//get temporal metadata from RS1 upper shadow register 
reg_t compressed_temporal = STATE.BPR[2 * insn.rs1() + 1];

//decompress the key
reg_t k_key = compressed_temporal >> (64-C_KEY_BIT);
//reg_t k_lock = (compressed_temporal & C_LOCK_MASK) >> (64- C_KEY_BIT - C_LOCK_BIT);

WRITE_RD(k_key);
