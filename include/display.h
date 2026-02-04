#ifndef _DISPLAY_H_
#define _DISPLAY_H_

void display_setup(void);
void display_set_pixel(unsigned int x, unsigned int y, unsigned int value);
void display_flush();
void display_clear_buffer();
int display_get_width();
int display_get_height();

#endif