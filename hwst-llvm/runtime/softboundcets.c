//=== runtime/softboundcets.c - Creates the main function for SoftBound+CETS Runtime --*- C -*===//
// Copyright (c) 2016 Santosh Nagarakatte. All rights reserved.

// Developed by: Santosh Nagarakatte, Rutgers University
//               http://www.cs.rutgers.edu/~santosh.nagarakatte/softbound/

// The  SoftBoundCETS project had contributions from:
// Santosh Nagarakatte, Rutgers University,
// Milo M K Martin, University of Pennsylvania,
// Steve Zdancewic, University of Pennsylvania,
// Jianzhou Zhao, University of Pennsylvania


// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal with the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

//   1. Redistributions of source code must retain the above copyright notice,
//      this list of conditions and the following disclaimers.

//   2. Redistributions in binary form must reproduce the above copyright
//      notice, this list of conditions and the following disclaimers in the
//      documentation and/or other materials provided with the distribution.

//   3. Neither the names of its developers nor the names of its
//      contributors may be used to endorse or promote products
//      derived from this software without specific prior written
//      permission.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
// CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// WITH THE SOFTWARE.
//===---------------------------------------------------------------------===//

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#if defined(__linux__)
#include <malloc.h>
#endif
#include <string.h>
#include <ctype.h>
#include <stdarg.h>
#include <sys/mman.h>
#if !defined(__FreeBSD__)
#include <execinfo.h>
#endif
#include "softboundcets.h"

__softboundcets_trie_entry_t** __softboundcets_trie_primary_table;

size_t* __softboundcets_free_map_table = NULL;

size_t* __softboundcets_shadow_stack_ptr = NULL;

size_t* __softboundcets_lock_next_location = NULL;
size_t* __softboundcets_lock_new_location = NULL;
size_t __softboundcets_key_id_counter = 2;

/* key 0 means not used, 1 is for  globals*/
size_t __softboundcets_deref_check_count = 0;
size_t* __softboundcets_global_lock = 0;

size_t* __softboundcets_temporal_space_begin = 0;
size_t* __softboundcets_stack_temporal_space_begin = NULL;

void* malloc_address = NULL;
size_t* shadow_memory_start = NULL; //kenny add for tracking the starting of the shadow memory address for lock in shadow .text
__SOFTBOUNDCETS_NORETURN void __softboundcets_abort()
{
  //kenny print return address to identify the location of the violation
  //unsigned long return_addr;
  //asm volatile ("mv %0, ra" : "=r" (return_addr));
  //printf("ABORT return address: %p\n", return_addr);

  fprintf(stderr, "\nSoftboundcets: Memory safety violation detected\n\nBacktrace:\n");
  
  // Based on code from the backtrace man page
  size_t size;
  void *array[100];
  
#if !defined (__FreeBSD__)
  size = backtrace(array, 100);
  backtrace_symbols_fd(array, size, fileno(stderr));
#endif
  
  fprintf(stderr, "\n\n");

  //kenny add disabling bound check if abort
  //__asm__ volatile("csrw 0x800, x0");
  
  abort(); //kenny disable SoftboundCETS abort?
}

static int softboundcets_initialized = 0;

__NO_INLINE void __softboundcets_stub(void) {
  return;
}
void __softboundcets_init(void) 
{
  if (softboundcets_initialized != 0) {
    return;  // already initialized, do nothing
  }
  
  softboundcets_initialized = 1;

  if (__SOFTBOUNDCETS_DEBUG) {
    __softboundcets_printf("Initializing softboundcets metadata space\n");
  }

#ifdef __HW_SECURITY
  //initializing the csrw register for RISC-V to setup the shadow memory offset.
  //printf("kenny: initializing shadow memory offset csrw\n");
  /*
  asm volatile("li t0, 0x1\n\tsll t0, t0, 63\n\tadd t0, t0, sp\n\taddi t0, t0, 1024\n\tcsrw 0x800, t0"
	       :
	       : 
	       :
	       );
  */
  asm volatile("li t0, 0x1\n\tsll t0, t0, 63\n\tadd t0, t0, sp\n\taddi t0, t0, 1712\n\tcsrw 0x800, t0\n\taddi %[rd], sp, 1712"
	       : [rd]"=r" (shadow_memory_start)
	       : 
	       :
	       );
  printf("kenny shadow_memory_start: %lx\n", shadow_memory_start);
  
#endif                  
  
  assert(sizeof(__softboundcets_trie_entry_t) >= 16);

  /* Allocating the temporal shadow space */

  size_t temporal_table_length = (__SOFTBOUNDCETS_N_TEMPORAL_ENTRIES)* sizeof(void*);


  //kenny: this location alloc memory for temporal lock, and seems it is really asking too much space for locks
  __softboundcets_lock_new_location = mmap(0, temporal_table_length, 
                                           PROT_READ| PROT_WRITE,
                                           SOFTBOUNDCETS_MMAP_FLAGS, -1, 0);

  /* kenny: move the lock location to the start of shadow memory which overlap with .code's shadow 
  __softboundcets_lock_new_location = shadow_memory_start; //kenny maunally set the lock location to .text shadow
  printf("kenny lock_new_location: %lx\n", __softboundcets_lock_new_location);
  */
  
  //kenny replace mmap into malloc
  //__softboundcets_lock_new_location = (size_t *)malloc(temporal_table_length);
  
  assert(__softboundcets_lock_new_location != (void*) -1);
  __softboundcets_temporal_space_begin = (size_t *)__softboundcets_lock_new_location;


  size_t stack_temporal_table_length = (__SOFTBOUNDCETS_N_STACK_TEMPORAL_ENTRIES) * sizeof(void*);
  __softboundcets_stack_temporal_space_begin = mmap(0, stack_temporal_table_length, 
                                                    PROT_READ| PROT_WRITE, 
                                                    SOFTBOUNDCETS_MMAP_FLAGS, -1, 0);
  assert(__softboundcets_stack_temporal_space_begin != (void*) -1);
  /* kenny: Move the stack temproal space after .text shadow code lock
  __softboundcets_stack_temporal_space_begin = __softboundcets_lock_new_location + temporal_table_length; //kenny put the stack temporal after local location in .text shadow space
  printf("kenny stack_temporal_space_begin: %lx\n", __softboundcets_stack_temporal_space_begin);
  */
  

  size_t global_lock_size = (__SOFTBOUNDCETS_N_GLOBAL_LOCK_SIZE) * sizeof(void*);
  __softboundcets_global_lock = mmap(0, global_lock_size, 
                                     PROT_READ|PROT_WRITE, 
                                     SOFTBOUNDCETS_MMAP_FLAGS, -1, 0);
  assert(__softboundcets_global_lock != (void*) -1);
  //  __softboundcets_global_lock =  __softboundcets_lock_new_location++;
  *((size_t*)__softboundcets_global_lock) = 1;



  size_t shadow_stack_size = __SOFTBOUNDCETS_SHADOW_STACK_ENTRIES * sizeof(size_t);
  __softboundcets_shadow_stack_ptr = mmap(0, shadow_stack_size, 
                                          PROT_READ|PROT_WRITE, 
                                          SOFTBOUNDCETS_MMAP_FLAGS, -1, 0);
  assert(__softboundcets_shadow_stack_ptr != (void*)-1);

  *((size_t*)__softboundcets_shadow_stack_ptr) = 0; /* prev stack size */
  size_t * current_size_shadow_stack_ptr =  __softboundcets_shadow_stack_ptr +1 ;
  *(current_size_shadow_stack_ptr) = 0;


  if(__SOFTBOUNDCETS_FREE_MAP) {
    size_t length_free_map = (__SOFTBOUNDCETS_N_FREE_MAP_ENTRIES) * sizeof(size_t);
    __softboundcets_free_map_table = mmap(0, length_free_map, 
                                          PROT_READ| PROT_WRITE, 
                                          SOFTBOUNDCETS_MMAP_FLAGS, -1, 0);
    assert(__softboundcets_free_map_table != (void*) -1);
  }


  size_t length_trie = (__SOFTBOUNDCETS_TRIE_PRIMARY_TABLE_ENTRIES) * sizeof(__softboundcets_trie_entry_t*);

  
  __softboundcets_trie_primary_table = mmap(0, length_trie, 
					    PROT_READ| PROT_WRITE, 
					    SOFTBOUNDCETS_MMAP_FLAGS, -1, 0);
  
  //kenny replace mmap into malloc to workaround the proxy kernel mmap limit to 4k problem.
  //__softboundcets_trie_primary_table = malloc(length_trie);
  
  assert(__softboundcets_trie_primary_table != (void *)-1);  
  
  int* temp = malloc(1);
  malloc_address = temp;
  printf("kenny heap starting address: %lx\n", malloc_address);
  __softboundcets_allocation_secondary_trie_allocate_range(0, (size_t)temp);

}

static void softboundcets_init_ctype(){  
#if defined(__linux__)
  
  char* ptr;
  char* base_ptr;
  //printf("init_ctype: __ctype_b_loc() = %x\n", __ctype_b_loc());
  
  ptr = (void*) __ctype_b_loc();
  base_ptr = (void*) (*(__ctype_b_loc()));
  
#ifdef __HW_SECURITY
  //implenent the ctype initialization in hardware
  void* k_base = (char*) base_ptr - 129;
  void* k_bound = (char*) base_ptr + 256;
  size_t  k_key = 1;
  void* k_lock = __softboundcets_global_lock;
  
  asm volatile("bndrs %[container], %[base], %[bound]\n\tsbdl %[container], 0(%[container])"
	       : [container]"+r" (ptr)
	       : [base]"r" (k_base), [bound]"r" (k_bound)
	       :
	       );

  asm volatile("bndrt %[container], %[key], %[lock]\n\tsbdu %[container], 0(%[container])"
	       : [container]"+r" (ptr)
	       : [key]"r" (k_key), [lock]"r" (k_lock)
	       :
	       );
  
  //__softboundcets_metadata_store(ptr, 1, __softboundcets_global_lock); //kenny add for HW+CETS copy from _TEMPORAL line
  /*
  __softboundcets_metadata_store(ptr, ((char*) base_ptr - 129), 
                                 ((char*) base_ptr + 256), 1, 
                                 __softboundcets_global_lock); //kenny add for CETS
  */
#else

  __softboundcets_allocation_secondary_trie_allocate(base_ptr);

#ifdef __SOFTBOUNDCETS_SPATIAL
  __softboundcets_metadata_store(ptr, ((char*) base_ptr - 129), 
                                 ((char*) base_ptr + 256));

#elif __SOFTBOUNDCETS_TEMPORAL
  __softboundcets_metadata_store(ptr, 1, __softboundcets_global_lock);

#elif __SOFTBOUNDCETS_SPATIAL_TEMPORAL
  __softboundcets_metadata_store(ptr, ((char*) base_ptr - 129), 
                                 ((char*) base_ptr + 256), 1, 
                                 __softboundcets_global_lock);

#else  
  __softboundcets_metadata_store(ptr, ((char*) base_ptr - 129), 
                                 ((char*) base_ptr + 256), 1, 
                                 __softboundcets_global_lock);
  
#endif

#endif // end of __HW_SECURITY
#endif // __linux ends 
}


void __softboundcets_printf(const char* str, ...)
{
  va_list args;

  va_start(args, str);
  //vfprintf(stderr, str, args);
  vfprintf(stdout, str, args);
  va_end(args);
}

extern int softboundcets_pseudo_main(int argc, char **argv);

int main(int argc, char **argv){

#if __WORDSIZE == 32
  exit(1);
#endif
  
  char** new_argv = argv;
  int i;
  char* temp_ptr;
  int return_value;
  size_t argv_key;
  void* argv_loc;

  int* temp = malloc(1);
  malloc_address = temp;
  __softboundcets_allocation_secondary_trie_allocate_range(0, (size_t)temp);

  __softboundcets_stack_memory_allocation(&argv_loc, &argv_key);

#if defined(__linux__)
  mallopt(M_MMAP_MAX, 0);
#endif

  for(i = 0; i < argc; i++) { 
    
#ifdef __HW_SECURITY
    //printf("argv HW init\n");
    //kenny handle the base/bound for all main's argv
    void* k_container = &new_argv[i];
    void* k_base = new_argv[i];
    void* k_bound = new_argv[i] + strlen(new_argv[i]) + 100; //kenny FIXME, this is only temporate solution!
    //printf("k_c %p \tk_bas %p \tk_bnd %p\n", k_container, k_base, k_bound);
    
    asm volatile("bndrs %[container], %[base], %[bound]\n\tsbdl %[container], 0(%[container])"
		 : [container]"+r" (k_container)
		 : [base]"r" (k_base), [bound]"r" (k_bound)
		 :
		 );
    asm volatile("bndrt %[container], %[key], %[lock]\n\tsbdu %[container], 0(%[container])"
		 : [container]"+r" (k_container)
		 : [key]"r" (argv_key), [lock]"r" (argv_loc)
		 :
		 );
    
    //printf("kenny argv init __HW_SECURITY\n");
#else //end __HW_SECURITY
    
#ifdef __SOFTBOUNDCETS_SPATIAL
       /* replaced by hardware shadow space
       __softboundcets_metadata_store(&new_argv[i], 
       new_argv[i], 
       new_argv[i] + strlen(new_argv[i]) + 1);
    */
    
#elif __SOFTBOUNDCETS_TEMPORAL
    //    printf("performing metadata store\n");
    __softboundcets_metadata_store(&new_argv[i],  
                                   argv_key, argv_loc);
    
#elif __SOFTBOUNDCETS_SPATIAL_TEMPORAL

    __softboundcets_metadata_store(&new_argv[i], 
                                   new_argv[i], 
                                   new_argv[i] + strlen(new_argv[i]) + 1, 
                                   argv_key, argv_loc);
    //printf("kenny argv init __SPATIAL_TEMPORAL\n");
#else

    __softboundcets_metadata_store(&new_argv[i], 
                                   new_argv[i], 
                                   new_argv[i] + strlen(new_argv[i]) + 1, 
                                   argv_key, argv_loc);

#endif
#endif //end __HW_SECURITY else

  }

  //  printf("before init_ctype\n");
  softboundcets_init_ctype();

  /* Santosh: Real Nasty hack because C programmers assume argv[argc]
   * to be NULL. Also this NUll is a pointer, doing + 1 will make the
   * size_of_type to fail
   */
  temp_ptr = ((char*) &new_argv[argc]) + 8;

  /* &new_argv[0], temp_ptr, argv_key, argv_loc * the metadata */

  __softboundcets_allocate_shadow_stack_space(2);

#ifdef __SOFTBOUNDCETS_SPATIAL

  __softboundcets_store_base_shadow_stack(&new_argv[0], 1);
  __softboundcets_store_bound_shadow_stack(temp_ptr, 1);

#elif __SOFTBOUNDCETS_TEMPORAL

  //  printf("before writing to shadow stack\n");
  __softboundcets_store_base_shadow_stack(&new_argv[0], 1); //kenny add for HW+CETS base
  __softboundcets_store_bound_shadow_stack(temp_ptr, 1); //kenny add for HW+CETS bound
  __softboundcets_store_key_shadow_stack(argv_key, 1);
  __softboundcets_store_lock_shadow_stack(argv_loc, 1);

#elif __SOFTBOUNDCETS_SPATIAL_TEMPORAL

  __softboundcets_store_base_shadow_stack(&new_argv[0], 1);
  __softboundcets_store_bound_shadow_stack(temp_ptr, 1);
  __softboundcets_store_key_shadow_stack(argv_key, 1);
  __softboundcets_store_lock_shadow_stack(argv_loc, 1);

#else

  __softboundcets_store_base_shadow_stack(&new_argv[0], 1);
  __softboundcets_store_bound_shadow_stack(temp_ptr, 1);
  __softboundcets_store_key_shadow_stack(argv_key, 1);
  __softboundcets_store_lock_shadow_stack(argv_loc, 1);

#endif
  
  //  printf("before calling program main\n");
  return_value = softboundcets_pseudo_main(argc, new_argv);
  __softboundcets_deallocate_shadow_stack_space();

  __softboundcets_stack_memory_deallocation(argv_key);

  return return_value;
}

void * __softboundcets_safe_mmap(void* addr, 
                                 size_t length, int prot, 
                                 int flags, int fd, 
                                 off_t offset){
  return mmap(addr, length, prot, flags, fd, offset);
}

void* __softboundcets_safe_calloc(size_t nmemb, size_t size){

  return calloc(nmemb, size);
}

void* __softboundcets_safe_malloc(size_t size){

  return malloc(size);
}
void __softboundcets_safe_free(void* ptr){

  free(ptr);
}
