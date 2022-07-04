//get spatial metadata from RS1 lower shadow register
reg_t compressed_spatial = STATE.BPR[2 * insn.rs1()];

//decompress the bound
reg_t k_base = compressed_spatial >> (64-C_BASE_BIT);
reg_t k_bound = k_base + ((compressed_spatial & C_RNGE_MASK) >> (64- C_BASE_BIT - C_RNGE_BIT ));

WRITE_RD(k_bound);
