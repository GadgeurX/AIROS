#include "memory.h"
#include "stdint.h"

void*   ksbrk(int32_t size) {
    static char* memory_buffer = (char*)0x8000;
    char* old_addr = memory_buffer;
    memory_buffer += size;
    return old_addr;
}