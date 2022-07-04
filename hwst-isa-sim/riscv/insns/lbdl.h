//WRITE_BREG(2 * insn.rd(), MMU.load_uint64(RS1 + insn.i_imm()));
reg_t base = p->get_csr(CSR_UBOUNDS) & ~(1UL << 63);
reg_t addr = RS1 + insn.i_imm();
reg_t shadow_addr = base + 2 * addr;

/*
reg_t bound = MMU.load_uint64(shadow_addr);
//WRITE_BREG(2 * insn.rd(), MMU.load_uint64(shadow_addr)); //FIX
WRITE_RD(MMU.load_uint64(shadow_addr)); //REVISION to load from shadow memory to physical register instead shadow register

//printf("%08X: LBDL: base: %lx, \t read from\t shadow_addr: %lx\n", pc, bound, shadow_addr);

const char* regname[] = {   "zero", "ra", "sp",  "gp",  "tp", "t0",  "t1",  "t2",
			    "s0",   "s1", "a0",  "a1",  "a2", "a3",  "a4",  "a5",
			    "a6",   "a7", "s2",  "s3",  "s4", "s5",  "s6",  "s7",
			    "s8",   "s9", "s10", "s11", "t3", "t4",  "t5",  "t6"
};
int k_rd = insn.rd();
int k_rs1 = insn.rs1();
int k_imm = insn.i_imm();
printf("%08lX: LBDL\t%3s [%16lx], %5d(%3s) [%16lx]\n", pc, regname[k_rd], bound, k_imm, regname[k_rs1], shadow_addr);
*/


//load from shadow memory
reg_t compressed_spatial = MMU.load_uint64(shadow_addr);

//decompress the base
reg_t k_base = compressed_spatial >> (64-C_BASE_BIT);

//store base to $RD
WRITE_RD(k_base);

//printf("decompressed_base:\t [%16lx]\n", k_base);
