#include "display.h"
#include "ports.h"

void lcd_stall(void) __naked // This means that SDCC will not setup IX and add ret code
{ // Look at main.asm and compare functions to see what it does
	__asm
		push hl
		pop hl
		push hl
		pop hl
		push hl
		pop hl
		push hl
		pop hl
		nop
		; manual ret is needed with __naked
		ret
	__endasm;
}

void display_setup(void)
{
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

    while (i <= 768) {
        ((char*)(0x8000))[i] = 0;
       ++i;
    }
}

void display_set_pixel(unsigned int x, unsigned int y, unsigned int value) {
    unsigned int gbuffer_addr = y + (((x / 8)) * 64);
    char bit_addr = x % 8;
    bit_addr = 7 - bit_addr;
    int mask = 1 << bit_addr;
     ((char*)(0x8000))[gbuffer_addr] = (( ((char*)(0x8000))[gbuffer_addr] & ~mask) | (value << bit_addr));
}

void display_flush() {
    unsigned int i = 0;

    Port_LCD_Command = 0x20;
    lcd_stall();
    Port_LCD_Command = 0x80;
    while (i <= 768) {
        lcd_stall();
        Port_LCD_Data =  ((char*)(0x8000))[i];
        if (i % 64 == 0)
            Port_LCD_Command = 0x20 + i / 64;
        ++i;
    }
}

int display_get_with() {
    return 96;
}

int display_get_height() {
    return 64;
}