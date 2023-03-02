#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

struct multiboot* multiboot_struct;

void platform_setup() {
asm ("mov %%ebx, %0"
    : "=r" (multiboot_struct)
  );
}