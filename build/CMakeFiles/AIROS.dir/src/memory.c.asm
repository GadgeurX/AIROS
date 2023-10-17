;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module memory
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcpy
	.globl _ksbrk
	.globl _kmalloc
	.globl _kfree
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_kmalloc_first_call_65536_8:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:18: static char first_call = 1;
	ld	iy, #_kmalloc_first_call_65536_8
	ld	0 (iy), #0x01
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:6: void memcpy(char *src, char *dst, uint16_t length)
;	---------------------------------
; Function memcpy
; ---------------------------------
_memcpy::
	call	___sdcc_enter_ix
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:9: while (i < length)
	ld	bc, #0x0000
00101$:
	ld	a, c
	sub	a, 8 (ix)
	ld	a, b
	sbc	a, 9 (ix)
	jr	NC,00104$
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:11: dst[i] = src[i];
	ld	a, 6 (ix)
	add	a, c
	ld	e, a
	ld	a, 7 (ix)
	adc	a, b
	ld	d, a
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:12: ++i;
	inc	bc
	jr	00101$
00104$:
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:14: }
	pop	ix
	ret
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:16: void *kmalloc(uint16_t size)
;	---------------------------------
; Function kmalloc
; ---------------------------------
_kmalloc::
	call	___sdcc_enter_ix
	ld	hl, #-12
	add	hl, sp
	ld	sp, hl
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:19: kmemory_chunk *old_memory_chunk = NULL;
	ld	hl, #0x0000
	ex	(sp), hl
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:28: if (memory_chunk->free && memory_chunk->size == size)
	ld	a, 4 (ix)
	ld	-10 (ix), a
	ld	a, 5 (ix)
	ld	-9 (ix), a
	xor	a, a
	ld	-8 (ix), a
	ld	-7 (ix), a
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:21: if (first_call)
	ld	iy, #_kmalloc_first_call_65536_8
	ld	a, 0 (iy)
	or	a, a
	jp	Z, 00108$
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:23: first_call = 0;
	ld	0 (iy), #0x00
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:24: kmemory_chunk *memory_chunk = ksbrk(0);
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x0000
	push	hl
	call	_ksbrk
	pop	af
	pop	af
	ld	c, l
	ld	b, h
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:25: old_memory_chunk = memory_chunk;
	inc	sp
	inc	sp
	push	bc
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:26: while (memory_chunk->previous_chunk != NULL)
00104$:
	ld	a, (bc)
	ld	-6 (ix), a
	inc	bc
	ld	a, (bc)
	ld	-5 (ix), a
	dec	bc
	ld	a, -5 (ix)
	or	a, -6 (ix)
	jr	Z,00108$
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:28: if (memory_chunk->free && memory_chunk->size == size)
	ld	hl, #0x0006
	add	hl, bc
	ex	de, hl
	ld	a, (de)
	or	a, a
	jr	Z,00102$
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -4 (ix)
	sub	a, -10 (ix)
	jr	NZ,00102$
	ld	a, -3 (ix)
	sub	a, -9 (ix)
	jr	NZ,00102$
	ld	a, -2 (ix)
	sub	a, -8 (ix)
	jr	NZ,00102$
	ld	a, -1 (ix)
	sub	a, -7 (ix)
	jr	NZ,00102$
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:30: memory_chunk->free = 0;
	xor	a, a
	ld	(de), a
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:31: return ((char *)memory_chunk) + sizeof(kmemory_chunk);
	ld	hl, #0x0007
	add	hl, bc
	jr	00109$
00102$:
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:33: memory_chunk = memory_chunk->previous_chunk;
	ld	c, -6 (ix)
	ld	b, -5 (ix)
	jr	00104$
00108$:
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:36: kmemory_chunk *new_memory_chunk = ksbrk(size + sizeof(kmemory_chunk));
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	hl, #0x0007
	add	hl, bc
	ld	bc, #0x0000
	push	bc
	push	hl
	call	_ksbrk
	pop	af
	pop	af
	ld	c, l
	ld	b, h
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:37: new_memory_chunk->size = size;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	push	bc
	ld	hl, #0x0004
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	bc
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:38: new_memory_chunk->free = 1;
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x01
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:39: new_memory_chunk->previous_chunk = old_memory_chunk;
	pop	de
	push	de
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:40: return ((char *)new_memory_chunk) + sizeof(kmemory_chunk);
	ld	hl, #0x0007
	add	hl, bc
00109$:
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:41: }
	ld	sp, ix
	pop	ix
	ret
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:43: void kfree(void *ptr)
;	---------------------------------
; Function kfree
; ---------------------------------
_kfree::
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:45: kmemory_chunk *memory_chunk = (kmemory_chunk *)(((char *)ptr) - sizeof(kmemory_chunk));
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a, c
	add	a, #0xf9
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:46: memory_chunk->free = 1;
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x01
;/mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c:47: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
