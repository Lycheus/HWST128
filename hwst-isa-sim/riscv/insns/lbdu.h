//WRITE_BREG(2 * insn.rd() + 1, MMU.load_uint64(RS1 + insn.i_imm() + 8));
reg_t base = p->get_csr(CSR_UBOUNDS) & ~(1UL << 63);
reg_t addr = RS1 + insn.i_imm();
/*
reg_t shadow_addr = base + 2 * addr + 8;
//WRITE_BREG(2 * insn.rd() + 1, MMU.load_uint64(shadow_addr)); //FIX
WRITE_RD(MMU.load_uint64(shadow_addr)); //FIX
*/

//load from shadow memory
reg_t k_shadow_addr = base + 2 * addr; //access the same shadow address as lbdl
reg_t compressed_spatial = MMU.load_uint64(k_shadow_addr);

//decompress the base
reg_t k_base = compressed_spatial >> (64-C_BASE_BIT);
reg_t k_bound = k_base + ((compressed_spatial & C_RNGE_MASK) >> (64- C_BASE_BIT - C_RNGE_BIT ));

//store base to $RD
WRITE_RD(k_bound);

//printf("decompressed_bound:\t [%16lx]\n", k_bound);
