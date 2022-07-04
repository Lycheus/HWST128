reg_t base = p->get_csr(CSR_UBOUNDS) & ~(1UL << 63);
reg_t addr = RS1 + insn.s_imm();
reg_t shadow_addr = base + 2 * addr + 8;
reg_t bound = STATE.BPR[2 * insn.rs2() + 1];
MMU.store_uint64(shadow_addr, bound);
