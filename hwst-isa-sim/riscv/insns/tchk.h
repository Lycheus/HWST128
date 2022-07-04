// using SW.B template (we don't use LW.B as template because we need two sources for key and lock)
// althrough load template is more behaviour similar to the load lock_location
// tchk RS2, imm(RS1);
// tchk key, imm(lock);

reg_t lock = RS1 + insn.s_imm();
reg_t key_in_lock = MMU.load_int32(lock); 
reg_t key = RS2;
CHECK_KEY(key, lock, key_in_lock, pc);

//printf("%08lX: kenny TCHK %lx(lock)\t %lx(lock.key)\t %lx(key)\n", pc, lock, key_in_lock, key);

//check key lock
/*
if (key != key_in_lock)
    printf("%08lX: kenny memory violation %lx(lock)\t %lx(lock.key)\t %lx(key)\n", pc, lock, key_in_lock, key);
*/
