WRITE_RD(sext_xlen(RS1 + insn.i_imm()));
PROP_BREG(2 * insn.rd(), STATE.BPR[2 * insn.rs1()]);
PROP_BREG(2 * insn.rd() + 1, STATE.BPR[2 * insn.rs1() + 1]);

//addi sp, sp, xx
//print PC
//dump all shadow registers
// reg_t rv64_addi(processor_t* p, insn_t insn, reg_t pc)
// *p->get_state().

/*
int k_rd = insn.rd();
int k_rs1 = insn.rs1();
signed long k_imm = insn.i_imm();
const char* regname[] = {   "zero", "ra", "sp",  "gp",  "tp", "t0",  "t1",  "t2",
			    "s0",   "s1", "a0",  "a1",  "a2", "a3",  "a4",  "a5",
			    "a6",   "a7", "s2",  "s3",  "s4", "s5",  "s6",  "s7",
			    "s8",   "s9", "s10", "s11", "t3", "t4",  "t5",  "t6"
};
if (k_rd == 2 &&  k_rs1 == 2){
    printf("\n%08X: ", pc);
    //printf("%lu, %lu, %d\n", insn.rd(), insn.rs1(), k_imm);
    printf("addi sp, sp, %d\n", k_imm);
    for (int i = 1; i < 32; i++){
      reg_t reg_value = READ_REG(i);
      reg_t base = READ_BREG_L(i);
      reg_t bound = READ_BREG_H(i);
      printf("%s: \tregv=%16lx, \tbase=%16lx, \tbound=%16lx\n", regname[i], reg_value, base, bound);
    }
    printf("\n");
 }
*/
