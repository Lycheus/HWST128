//read data from RS1 shadow register
reg_t compressed_spatial = STATE.BPR[2 * insn.rs1()];
reg_t compressed_temporal = STATE.BPR[2 * insn.rs1() + 1];

//write data to RD shadow register
WRITE_BREG(2*insn.rd(),   compressed_spatial);
WRITE_BREG(2*insn.rd()+1, compressed_temporal);
