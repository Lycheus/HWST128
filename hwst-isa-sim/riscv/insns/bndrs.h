//original bndr implementation
/*
WRITE_BREG(2*insn.rd(),   RS1);
WRITE_BREG(2*insn.rd()+1, RS2);

reg_t base = STATE.BPR[2*insn.rd()];
reg_t bound = STATE.BPR[2*insn.rd()+1];
reg_t ptr = RD;

//printf("%08X: BNDR: base: %lx,\t bound: %lx,\t ptr: %lx\n", pc, base, bound, ptr), 

const char* regname[] = {   "zero", "ra", "sp",  "gp",  "tp", "t0",  "t1",  "t2",
			    "s0",   "s1", "a0",  "a1",  "a2", "a3",  "a4",  "a5",
			    "a6",   "a7", "s2",  "s3",  "s4", "s5",  "s6",  "s7",
			    "s8",   "s9", "s10", "s11", "t3", "t4",  "t5",  "t6"
};
int k_rd = insn.rd();
int k_rs1 = insn.rs1();
int k_rs2 = insn.rs2();
printf("%08lX: BNDR\t%3s [%16lx],       %3s  [%16lx], \t%3s [%16lx]\n", pc, regname[k_rd], ptr, regname[k_rs1], base, regname[k_rs2], bound);
*/

reg_t k_base = RS1;
reg_t k_bound = RS2;
reg_t range = k_bound - k_base;

/* spatial compression layout
                   64 bits                              64 bits
--------------------------------------------------------------------------------
|                   base                 |               bound                 |
--------------------------------------------------------------------------------
|                     __________________/   ___________________________________/ 
|                    /                   __/
|   32bits (4GB)    /      32bits       /
----------------------------------------
|    base          |       range       | 
----------------------------------------
 63              32 31                0
*/

reg_t compressed_spatial = 0;
//reg_t compressed_base = (k_base << 34) & 0xFFFFFFFC00000000;
reg_t compressed_base = (k_base << (64- C_BASE_BIT )) & C_BASE_MASK;
//reg_t compressed_bound = (range << 22) & 0x3FFC00000;
reg_t compressed_bound = (range << (64- C_BASE_BIT - C_RNGE_BIT )) & C_RNGE_MASK;
if(range >= (C_RNGE_MASK >> (64 - C_BASE_BIT - C_RNGE_BIT))){ //range is larger than C_RANGE
  //printf("kenny warning: compressed bound is 0 (not enough range-bit?)\nbase: \t[%16lx], bound: \t[%16lx]\n", k_base, k_bound);
  compressed_bound = C_RNGE_MASK; //set all bit in bound to 1 (full 21 bits access range)
 }
compressed_spatial = compressed_base | compressed_bound;

//compressed bndr implementation
WRITE_BREG(2*insn.rd(), compressed_spatial);

//printf("compressed_base:\t[%16lx]\ncompressed_bound:\t[%16lx]\ncompressed_spatial\t[%16lx]\n\n", compressed_base, compressed_bound, compressed_spatial);
