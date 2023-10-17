;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _display_clear_buffer
	.globl _display_flush
	.globl _display_set_pixel
	.globl _display_setup
	.globl _platform_setup
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/main.c:4: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/main.c:7: platform_setup();
	call	_platform_setup
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/main.c:9: display_setup();
	call	_display_setup
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/main.c:10: display_clear_buffer();
	call	_display_clear_buffer
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/main.c:11: display_set_pixel(20, 20, 1);
	ld	hl, #0x0001
	push	hl
	ld	l, #0x14
	push	hl
	ld	l, #0x14
	push	hl
	call	_display_set_pixel
	pop	af
	pop	af
	pop	af
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/main.c:12: display_flush();
	call	_display_flush
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/main.c:14: while(1)
00102$:
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/main.c:18: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
