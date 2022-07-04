reg_t base = p->get_csr(CSR_UBOUNDS) & ~(1UL << 63);
reg_t addr = RS1 + insn.s_imm();
reg_t shadow_addr = base + 2 * addr;
reg_t bound = STATE.BPR[2 * insn.rs2()];

MMU.store_uint64(shadow_addr, bound);

//printf("%08X: SBDL: base: %lx, \t write to\t shadow_addr: %lx\n", pc, bound, shadow_addr);
/*
const char* regname[] = {   "zz", "ra", "sp",  "gp",  "tp", "t0",  "t1",  "t2",
			    "s0",   "s1", "a0",  "a1",  "a2", "a3",  "a4",  "a5",
			    "a6",   "a7", "s2",  "s3",  "s4", "s5",  "s6",  "s7",
			    "s8",   "s9", "s10", "s11", "t3", "t4",  "t5",  "t6"
};
int k_rs2 = insn.rs2();
int k_rs1 = insn.rs1();
int k_imm = insn.s_imm();
printf("%08lX: SBDL\t%3s [%16lx],\t%5d(%3s) [%16lx]\n", pc, regname[k_rs2], bound, k_imm, regname[k_rs1], shadow_addr);
*/
