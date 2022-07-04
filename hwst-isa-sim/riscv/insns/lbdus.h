//WRITE_BREG(2 * insn.rd() + 1, MMU.load_uint64(RS1 + insn.i_imm() + 8));
reg_t base = p->get_csr(CSR_UBOUNDS) & ~(1UL << 63);
reg_t addr = RS1 + insn.i_imm();
reg_t shadow_addr = base + 2 * addr + 8;
WRITE_BREG(2 * insn.rd() + 1, MMU.load_uint64(shadow_addr)); //FIX
//WRITE_RD(MMU.load_uint64(shadow_addr)); //FIX
