//William: I perhaps have it set up more flexibly than it needs to be. If RS1 is bounded it propagates RS1, else if RS2 is bounded it propagates RS2, else it propagates 0.

WRITE_RD(sext_xlen(RS1 + RS2));
PROP_BREG(2 * insn.rd(), STATE.BPR[2 * insn.rs1()]);
PROP_BREG(2 * insn.rd() + 1, STATE.BPR[2 * insn.rs1() + 1]);
