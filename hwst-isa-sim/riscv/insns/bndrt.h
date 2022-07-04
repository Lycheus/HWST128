reg_t k_key = RS1;
reg_t k_lock = RS2;

/* temporal compression layout
                   64 bits                              64 bits
--------------------------------------------------------------------------------
|                   key                 |                 lock                 |
--------------------------------------------------------------------------------
|                      ________________/                      ________________/ 
|                     /                  ____________________/
|       32bits       /     32bits       /
----------------------------------------
|        key        |       lock       |
----------------------------------------
63                32 31               0
*/

reg_t compressed_temporal = 0;

reg_t compressed_key = (k_key << (64- C_KEY_BIT )) & C_KEY_MASK;

reg_t compressed_lock = (k_lock << (64- C_KEY_BIT - C_LOCK_BIT )) & C_LOCK_MASK;

compressed_temporal = compressed_key | compressed_lock;

//compressed bndr implementation
WRITE_BREG(2*insn.rd()+1, compressed_temporal);

//printf("compressed_base:\t[%16lx]\ncompressed_bound:\t[%16lx]\ncompressed_spatial\t[%16lx]\n\n", compressed_base, compressed_bound, compressed_spatial);
