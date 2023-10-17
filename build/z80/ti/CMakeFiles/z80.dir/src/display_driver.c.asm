;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module display_driver
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _lcd_stall
	.globl _kmalloc
	.globl _video_buffer
	.globl _display_setup
	.globl _display_clear_buffer
	.globl _display_set_pixel
	.globl _display_flush
	.globl _display_get_with
	.globl _display_get_height
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_Port_Link	=	0x0000
_Port_Keyboard	=	0x0001
_Port_Status	=	0x0002
_Port_Interrupt_Mask	=	0x0003
_Port_Mem_Map	=	0x0004
_Port_Interrupt_Status	=	0x0004
_Port_Mem_B3	=	0x0005
_Port_Mem_B1	=	0x0006
_Port_Mem_B2	=	0x0007
_Port_LCD_Command	=	0x0010
_Port_LCD_Data	=	0x0011
_Port_Flash_Protect	=	0x0014
_Port_ASIC_Version	=	0x0015
_Port_CPU_Scale	=	0x0020
_Port_Flash_Protection	=	0x0014
_Port_Clock_Control	=	0x0040
_Port_Clock_Set_0	=	0x0041
_Port_Clock_Set_1	=	0x0042
_Port_Clock_Set_2	=	0x0043
_Port_Clock_Set_3	=	0x0044
_Port_Clock_Read_0	=	0x0045
_Port_Clock_Read_1	=	0x0046
_Port_Clock_Read_2	=	0x0047
_Port_Clock_Read_3	=	0x0048
_Port_USB_Interrupt	=	0x0055
_Port_USB_Mask	=	0x005b
_Port_USB_Line_Event	=	0x0056
_Port_USB_Line_Event_Mask	=	0x0057
_Port_USB_Outgoing_Pipe	=	0x00a1
_Port_Timer_1_OnOff	=	0x0030
_Port_Timer_1_Loop	=	0x0031
_Port_Timer_1_Counter	=	0x0032
_Port_Timer_2_OnOff	=	0x0033
_Port_Timer_2_Loop	=	0x0034
_Port_Timer_2_Counter	=	0x0035
_Port_Timer_3_OnOff	=	0x0036
_Port_Timer_3_Loop	=	0x0037
_Port_Timer_3_Counter	=	0x0038
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_video_buffer::
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:7: void lcd_stall(void) __naked // This means that SDCC will not setup IX and add ret code
;	---------------------------------
; Function lcd_stall
; ---------------------------------
_lcd_stall::
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:21: __endasm;
	push	hl
	pop	hl
	push	hl
	pop	hl
	push	hl
	pop	hl
	push	hl
	pop	hl
	nop
;	manual ret is needed with __naked
	ret
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:22: }
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:24: void display_setup(void)
;	---------------------------------
; Function display_setup
; ---------------------------------
_display_setup::
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:26: video_buffer = kmalloc(768);
	ld	hl, #0x0300
	push	hl
	call	_kmalloc
	pop	af
	ld	(_video_buffer), hl
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:28: Port_LCD_Command = 0x40;
	ld	a, #0x40
	out	(_Port_LCD_Command), a
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:29: lcd_stall();
	call	_lcd_stall
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:30: Port_LCD_Command = 0x05;
	ld	a, #0x05
	out	(_Port_LCD_Command), a
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:31: lcd_stall();
	call	_lcd_stall
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:32: Port_LCD_Command = 0x01;
	ld	a, #0x01
	out	(_Port_LCD_Command), a
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:33: lcd_stall();
	call	_lcd_stall
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:34: Port_LCD_Command = 0x03;
	ld	a, #0x03
	out	(_Port_LCD_Command), a
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:35: lcd_stall();
	call	_lcd_stall
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:36: Port_LCD_Command = 0xF0;
	ld	a, #0xf0
	out	(_Port_LCD_Command), a
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:37: return;
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:38: }
	ret
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:40: void display_clear_buffer() {
;	---------------------------------
; Function display_clear_buffer
; ---------------------------------
_display_clear_buffer::
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:43: while (i <= 768) {
	ld	bc, #0x0000
00101$:
	xor	a, a
	cp	a, c
	ld	a, #0x03
	sbc	a, b
	ret	C
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:44: ((char*)(video_buffer))[i] = 0;
	ld	hl, (_video_buffer)
	add	hl, bc
	ld	(hl), #0x00
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:45: ++i;
	inc	bc
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:47: }
	jr	00101$
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:49: void display_set_pixel(unsigned int x, unsigned int y, unsigned int value) {
;	---------------------------------
; Function display_set_pixel
; ---------------------------------
_display_set_pixel::
	call	___sdcc_enter_ix
	push	af
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:50: unsigned int gbuffer_addr = y + (((x / 8)) * 64);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	b, #0x03
00103$:
	srl	h
	rr	l
	djnz	00103$
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	add	hl, bc
	ex	de,hl
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:51: char bit_addr = x % 8;
	ld	a, 4 (ix)
	and	a, #0x07
	ld	c, a
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:52: bit_addr = 7 - bit_addr;
	ld	a, #0x07
	sub	a, c
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:53: int mask = 1 << bit_addr;
	ld	-2 (ix), a
	ld	b, a
	ld	-1 (ix), #0x01
	inc	b
	jr	00105$
00104$:
	sla	-1 (ix)
00105$:
	djnz	00104$
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:54: ((char*)(video_buffer))[gbuffer_addr] = (( ((char*)(video_buffer))[gbuffer_addr] & ~mask) | (value << bit_addr));
	ld	hl, (_video_buffer)
	add	hl, de
	ld	c, (hl)
	ld	a, -1 (ix)
	cpl
	and	a, c
	ld	c, a
	ld	e, 8 (ix)
	ld	b, -2 (ix)
	inc	b
	jr	00107$
00106$:
	sla	e
00107$:
	djnz	00106$
	ld	a, e
	or	a, c
	ld	(hl), a
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:55: }
	pop	af
	pop	ix
	ret
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:57: void display_flush() {
;	---------------------------------
; Function display_flush
; ---------------------------------
_display_flush::
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:60: Port_LCD_Command = 0x20;
	ld	a, #0x20
	out	(_Port_LCD_Command), a
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:61: lcd_stall();
	call	_lcd_stall
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:62: Port_LCD_Command = 0x80;
	ld	a, #0x80
	out	(_Port_LCD_Command), a
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:63: while (i <= 768) {
	ld	de, #0x0000
00103$:
	xor	a, a
	cp	a, e
	ld	a, #0x03
	sbc	a, d
	ret	C
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:64: lcd_stall();
	push	de
	call	_lcd_stall
	pop	de
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:65: Port_LCD_Data =  ((char*)(video_buffer))[i];
	ld	hl, (_video_buffer)
	add	hl, de
	ld	a, (hl)
	out	(_Port_LCD_Data), a
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:66: if (i % 64 == 0)
	ld	a, e
	and	a, #0x3f
	jr	NZ,00102$
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:67: Port_LCD_Command = 0x20 + i / 64;
	ld	l, e
	ld	h, d
	ld	b, #0x06
00126$:
	srl	h
	rr	l
	djnz	00126$
	ld	a, l
	add	a, #0x20
	out	(_Port_LCD_Command), a
00102$:
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:68: ++i;
	inc	de
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:70: }
	jr	00103$
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:72: int display_get_with() {
;	---------------------------------
; Function display_get_with
; ---------------------------------
_display_get_with::
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:73: return 96;
	ld	hl, #0x0060
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:74: }
	ret
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:76: int display_get_height() {
;	---------------------------------
; Function display_get_height
; ---------------------------------
_display_get_height::
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:77: return 64;
	ld	hl, #0x0040
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/display_driver.c:78: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
