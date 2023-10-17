;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module platform
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _platform_setup
	.globl _ISR
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
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/platform.c:4: void ISR(void) __interrupt
;	---------------------------------
; Function ISR
; ---------------------------------
_ISR::
	ei
	push	af
	push	bc
	push	de
	push	hl
	push	iy
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/platform.c:9: status = Port_Interrupt_Status;
	in	a, (_Port_Interrupt_Status)
	ld	c, a
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/platform.c:10: mask = Port_Interrupt_Mask;
	in	a, (_Port_Interrupt_Mask)
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/platform.c:12: if(status & 0b0010)
	bit	1, c
	jr	Z,00102$
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/platform.c:14: Port_Interrupt_Mask = mask & 0b11111101;
	push	af
	and	a, #0xfd
	out	(_Port_Interrupt_Mask), a
	pop	af
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/platform.c:15: Port_Interrupt_Mask = mask;
	out	(_Port_Interrupt_Mask), a
00102$:
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/platform.c:17: if( status & 0b0001)
	bit	0, c
	jr	Z,00105$
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/platform.c:19: Port_Interrupt_Mask = mask & 0b11111110;
	push	af
	and	a, #0xfe
	out	(_Port_Interrupt_Mask), a
	pop	af
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/platform.c:20: Port_Interrupt_Mask = mask;
	out	(_Port_Interrupt_Mask), a
00105$:
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/platform.c:22: }
	pop	iy
	pop	hl
	pop	de
	pop	bc
	pop	af
	reti
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/platform.c:24: void platform_setup() {
;	---------------------------------
; Function platform_setup
; ---------------------------------
_platform_setup::
;/mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/platform.c:26: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
