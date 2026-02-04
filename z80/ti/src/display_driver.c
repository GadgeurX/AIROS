#include "display.h"
#include "memory.h"
#include "ports.h"

char *video_buffer;

extern void lcd_stall(void);

void display_setup(void) {
  video_buffer = kmalloc(768);
  // Inititalize and turn on the LCD
  Port_LCD_Command = 0x40;
  lcd_stall();
  Port_LCD_Command = 0x05;
  lcd_stall();
  Port_LCD_Command = 0x01;
  lcd_stall();
  Port_LCD_Command = 0x03;
  lcd_stall();
  Port_LCD_Command = 0xF0;
  return;
}

void display_clear_buffer() {
  unsigned int i = 0;

  while (i < 768) {
    ((char *)(video_buffer))[i] = 0;
    ++i;
  }
}

void display_set_pixel(unsigned int x, unsigned int y, unsigned int value) {
  unsigned int gbuffer_addr = y + (((x / 8)) * 64);
  char bit_addr = x % 8;
  bit_addr = 7 - bit_addr;
  int mask = 1 << bit_addr;
  ((char *)(video_buffer))[gbuffer_addr] =
      ((((char *)(video_buffer))[gbuffer_addr] & ~mask) | (value << bit_addr));
}

void display_flush() {
  unsigned int i = 0;
  unsigned char col = 0;

  while (i < 768) {
    if ((i & 63) == 0) {
      Port_LCD_Command = 0x80; // Reset row to 0
      lcd_stall();
      Port_LCD_Command = 0x20 + col; // Set column
      lcd_stall();
      col++;
    }
    Port_LCD_Data = ((char *)(video_buffer))[i];
    lcd_stall();
    ++i;
  }
}

int display_get_width() { return 96; }

int display_get_height() { return 64; }