#include <stddef.h>
#include <stdint.h>

#include "memory.h"

void memcpy(char *src, char *dst, uint16_t length) {
  uint16_t i = 0;
  while (i < length) {
    dst[i] = src[i];
    ++i;
  }
}

// Global pointer to the last allocated chunk to maintain the list
static kmemory_chunk *last_alloc_chunk = NULL;

void *kmalloc(uint16_t size) {
  kmemory_chunk *chunk = last_alloc_chunk;

  // Search backwards for a free chunk of sufficient size
  while (chunk != NULL) {
    if (chunk->free && chunk->size >= size) {
      chunk->free = 0;
      // TODO: Split chunk if significantly larger? For now just use it.
      return ((char *)chunk) + sizeof(kmemory_chunk);
    }
    chunk = chunk->previous_chunk;
  }

  // No free chunk found, allocate new one
  kmemory_chunk *new_chunk = ksbrk(size + sizeof(kmemory_chunk));
  new_chunk->size = size;
  new_chunk->free = 0;
  new_chunk->previous_chunk = last_alloc_chunk;

  // Update the list head
  last_alloc_chunk = new_chunk;

  return ((char *)new_chunk) + sizeof(kmemory_chunk);
}

void kfree(void *ptr) {
  if (ptr == NULL)
    return;
  kmemory_chunk *chunk =
      (kmemory_chunk *)(((char *)ptr) - sizeof(kmemory_chunk));
  chunk->free = 1;
}