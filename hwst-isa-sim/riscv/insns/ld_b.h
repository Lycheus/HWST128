require_rv64;
reg_t addr = RS1 + insn.i_imm();
CHECK_BND(addr, insn.rs1(), pc);
WRITE_RD(MMU.load_int64(addr));
