// STDIO library include
#include <stdio.h>
#include "platform.h"
#include "display.h"

void main(void)
{

  platform_setup();

  display_setup();
  display_clear_buffer();
  display_set_pixel(20, 20, 1);
  display_flush();
  
  while(1)
  {
    
  }
}
