#ifndef _MEMORY_H_
#define _MEMORY_H_

#include <stdint.h>

typedef struct kmemory_chunk_t
{
    void* previous_chunk;
    int32_t size;
    int8_t free;
} kmemory_chunk;


void*   ksbrk(int32_t size);
void*   kmalloc(uint16_t size);
void    kfree(void* ptr);

#endif