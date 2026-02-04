#include "display_driver.h"

static struct vbe_mode_info*  vbe_info;

void display_setup(void)
{
   vbe_info = (struct vbe_mode_info*)multiboot_struct->vbe_mode_info;
}

void display_clear_buffer() {
   int x = 0;
   while (x < vbe_info->width) {
    int y = 0;
    while (y < vbe_info->height) {
        uint32_t* pixel_addr =  ((uint32_t*)vbe_info->framebuffer) + y* vbe_info->pitch + x;
        *pixel_addr = 0;
        ++y;
    }
    ++x;
   }
}

void display_set_pixel(unsigned int x, unsigned int y, unsigned int value) {
    uint32_t* pixel_addr =  ((uint32_t*)vbe_info->framebuffer) + y* (vbe_info->pitch / 4) + x;
    *pixel_addr = INT32_MAX;
}

void display_flush() {
    
}

int display_get_width() {
    return vbe_info->width;
}

int display_get_height() {
    return vbe_info->height;
}