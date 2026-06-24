/* Linker script for MiniOS - adjust MEMORY map to match your Logisim RAM */
MEMORY
{
    ROM   (rx)  : ORIGIN = 0x00000000, LENGTH = 0x00100000
    RAM   (rwx) : ORIGIN = 0x80000000, LENGTH = 0x04000000
}

SECTIONS
{
    . = ORIGIN(ROM);
    .text :
    {
        KEEP(*(.start))
        *(.text*)
        *(.rodata*)
    } > ROM

    . = 0x00001000;
    .trap ALIGN(4) :
    {
        KEEP(*(.trap))
    } > ROM

    . = ORIGIN(RAM);
    .data :
    {
        *(.data*)
    } > RAM AT > ROM

    .bss :
    {
        __bss_start = .;
        *(.bss*)
        __bss_end = .;
    } > RAM

    /DISCARD/ : { *(.eh_frame) }
}

/* Symbols */
PROVIDE(_stack_start = ORIGIN(RAM) + LENGTH(RAM));
