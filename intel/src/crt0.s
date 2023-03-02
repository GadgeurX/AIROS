.set ALIGN,    1<<0             /* align loaded modules on page boundaries */
.set MEMINFO,  1<<1             /* provide memory map */
.set MBOOT_VBE_MODE, 1<<2   /* have GRUB set video mode */
.set FLAGS,    ALIGN | MEMINFO | MBOOT_VBE_MODE  /* this is the Multiboot 'flag' field */
.set MAGIC,    0x1BADB002       /* 'magic number' lets bootloader find the header */
.set CHECKSUM, -(MAGIC + FLAGS) /* checksum of above, to prove we are multiboot */
 

.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM
.long 0
.long 0
.long 0
.long 0
.long 0

.long 0
.long 0
.long 0
.long 32
 
.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stack_top:
 

.section .text
.global _start
.type _start, @function
_start:

	mov $stack_top, %esp
	call main
 
	cli
1:	hlt
	jmp 1b
 
/*
Set the size of the _start symbol to the current location '.' minus its start.
This is useful when debugging or when you implement call tracing.
*/
.size _start, . - _start