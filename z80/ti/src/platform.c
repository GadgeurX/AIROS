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
 
}