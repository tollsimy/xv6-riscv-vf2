OUTPUT_ARCH( "riscv" )
ENTRY( _entry )

BASE_ADDRESS = 0x80000000;

SECTIONS
{
  /*
   * ensure that entry.S / _entry is at BASE_ADDRESS,
   * where bootloader (or qemu's -kernel) jumps.
   */
  . = BASE_ADDRESS;

  .text : {
    *(.text .text.*)
    . = ALIGN(4K);       /* align trampsec to page boundary (4K bytes) */
    _trampoline = .;
    *(trampsec)
    . = ALIGN(4K);
    ASSERT(. - _trampoline == 4K, "error: trampoline larger than one page");
    PROVIDE(etext = .);
  }

  .rodata : {
    . = ALIGN(4K);      /* align regions to page boundary */
    *(.srodata .srodata.*) /* do not need to distinguish this from .rodata */
    . = ALIGN(4K);
    *(.rodata .rodata.*)
  }

  .data : {
    . = ALIGN(4K);
    *(.sdata .sdata.*) /* do not need to distinguish this from .data */
    . = ALIGN(4K);
    *(.data .data.*)
  }

  .bss : {
    . = ALIGN(4K);
    *(.sbss .sbss.*) /* do not need to distinguish this from .bss */
    . = ALIGN(4K);
    *(.bss .bss.*)
  }

  PROVIDE(kernel_end = .);
}
