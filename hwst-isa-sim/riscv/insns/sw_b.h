reg_t addr = RS1 + insn.s_imm();
CHECK_BND(addr, insn.rs1(), pc);
MMU.store_uint32(addr, RS2);
