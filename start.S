    .section .start
    .global _start
_start:
    /* Set stack pointer to top of RAM (symbol provided by linker) */
    la   sp, _stack_start
    /* Call main */
    call main
hang:
    /* spin */
    j hang
