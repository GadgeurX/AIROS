#include <stdint.h>
#include <stddef.h>

#include "memory.h"

void memcpy(char *src, char *dst, uint16_t length)
{
    uint16_t i = 0;
    while (i < length)
    {
        dst[i] = src[i];
        ++i;
    }
}

void *kmalloc(uint16_t size)
{
    static char first_call = 1;
    kmemory_chunk *old_memory_chunk = NULL;

    if (first_call)
    {
        first_call = 0;
        kmemory_chunk *memory_chunk = ksbrk(0);
        old_memory_chunk = memory_chunk;
        while (memory_chunk->previous_chunk != NULL)
        {
            if (memory_chunk->free && memory_chunk->size == size)
            {
                memory_chunk->free = 0;
                return ((char *)memory_chunk) + sizeof(kmemory_chunk);
            }
            memory_chunk = memory_chunk->previous_chunk;
        }
    }
    kmemory_chunk *new_memory_chunk = ksbrk(size + sizeof(kmemory_chunk));
    new_memory_chunk->size = size;
    new_memory_chunk->free = 1;
    new_memory_chunk->previous_chunk = old_memory_chunk;
    return ((char *)new_memory_chunk) + sizeof(kmemory_chunk);
}

void kfree(void *ptr)
{
    kmemory_chunk *memory_chunk = (kmemory_chunk *)(((char *)ptr) - sizeof(kmemory_chunk));
    memory_chunk->free = 1;
}