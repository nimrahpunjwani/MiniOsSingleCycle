    .section .trap
    .global trap_entry
trap_entry:
    li t0, 1
    beq a7, t0, syscall_write
    li t0, 2
    beq a7, t0, syscall_exit
    li a0, -1
    j trap_return

syscall_write:
    li t1, 0x10000000
    mv t2, a1
    mv t3, a2
    mv a0, zero

write_loop:
    beqz t3, trap_return
    lbu t4, 0(t2)
    sw t4, 0(t1)
    addi t2, t2, 1
    addi t3, t3, -1
    addi a0, a0, 1
    j write_loop

syscall_exit:
    j trap_return

trap_return:
    .word 0x30200073