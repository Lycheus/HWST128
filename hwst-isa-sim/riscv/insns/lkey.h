//WRITE_BREG(2 * insn.rd(), MMU.load_uint64(RS1 + insn.i_imm()));

//calculate the shadow address using the RS1+offset
reg_t base = p->get_csr(CSR_UBOUNDS) & ~(1UL << 63);
reg_t addr = RS1 + insn.i_imm();
reg_t shadow_addr = base + 2 * addr + 8;


//load from upper shadow memory
reg_t compressed_temporal = MMU.load_uint64(shadow_addr);

//decompress the key
reg_t k_key = compressed_temporal >> (64-C_KEY_BIT);
//reg_t k_lock = (compressed_temporal & C_LOCK_MASK) >> (64- C_KEY_BIT - C_LOCK_BIT);

WRITE_RD(k_key);
