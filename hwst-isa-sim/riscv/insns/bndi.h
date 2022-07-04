WRITE_BREG(2*insn.rd(), RS1);
WRITE_BREG(2*insn.rd()+1, RS1 + insn.i_imm());
