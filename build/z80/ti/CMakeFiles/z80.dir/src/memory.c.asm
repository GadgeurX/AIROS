;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module memory
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ksbrk
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_ksbrk_memory_buffer_65536_5:
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/memory.c:5: static char* memory_buffer = 0x8000;
	ld	hl, #0x8000
	ld	(_ksbrk_memory_buffer_65536_5), hl
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/memory.c:4: void*   ksbrk(int32_t size) {
;	---------------------------------
; Function ksbrk
; ---------------------------------
_ksbrk::
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/memory.c:6: char* old_addr = memory_buffer;
	ld	bc, (_ksbrk_memory_buffer_65536_5)
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/memory.c:7: memory_buffer += size;
	ld	hl, #2
	add	hl, sp
	push	de
	ld	iy, #_ksbrk_memory_buffer_65536_5
	push	iy
	pop	de
	ld	a, (de)
	add	a, (hl)
	ld	(de), a
	inc	de
	ld	a, (de)
	inc	hl
	adc	a, (hl)
	ld	(de), a
	pop	de
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/memory.c:8: return old_addr;
	ld	l, c
	ld	h, b
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/memory.c:9: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
