#include "ports.h"

// interrupt with __interrupt means that it will exx and ex af,af' and such.
void ISR(void) __interrupt
{
  unsigned char mask,status;
  
  // Do something, like clear out the interrupts
  status = Port_Interrupt_Status;
  mask = Port_Interrupt_Mask;

  if(status & 0b0010)
  {
    Port_Interrupt_Mask = mask & 0b11111101;
    Port_Interrupt_Mask = mask;
  }
  if( status & 0b0001)
  {
    Port_Interrupt_Mask = mask & 0b11111110;
    Port_Interrupt_Mask = mask;
  }
}

void platform_setup() {
     __asm
  ld a, #0x41
	out (#7),a

	ld a, #3
	out (#0xE), a ; What does this do? (TIOS does it)
	xor a
	out (#0xF), a
	;; Stack at the top of memory.
	ld	sp,#0
	; Clear RAM
	ld hl, #0x8000
	ld (hl), #0
	ld de, #0x8001
	ld bc, #0x7FFF
	ldir

	ld hl, #0x8002
	ld (hl), #0xAA
  __endasm;
}