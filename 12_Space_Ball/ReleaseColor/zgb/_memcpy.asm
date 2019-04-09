;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module _memcpy
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcpy
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;C:/gbdk/ZGB/common/src/_memcpy.c:36: void * memcpy (void * dst, const void * src, size_t acount)
;	---------------------------------
; Function memcpy
; ---------------------------------
_memcpy::
	add	sp, #-8
;C:/gbdk/ZGB/common/src/_memcpy.c:38: void * ret = dst;
	ldhl	sp,#10
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/_memcpy.c:39: char * d = dst;
	ldhl	sp,#10
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#6
	ld	(hl+),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/_memcpy.c:40: const char * s = src;
	ldhl	sp,#12
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#2
	ld	(hl+),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/_memcpy.c:45: while (acount--) {
	ldhl	sp,#(15 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
00101$:
	ldhl	sp,#4
	ld	(hl),c
	inc	hl
	ld	(hl),b
	dec	bc
	ld	a,(hl-)
	or	a,(hl)
	jr	Z,00103$
;C:/gbdk/ZGB/common/src/_memcpy.c:46: *d++ = *s++;
	dec	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	inc	(hl)
	jr	NZ,00115$
	inc	hl
	inc	(hl)
00115$:
	ldhl	sp,#(7 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
	dec	hl
	inc	(hl)
	jr	NZ,00101$
	inc	hl
	inc	(hl)
	jr	00101$
00103$:
;C:/gbdk/ZGB/common/src/_memcpy.c:49: return(ret);
	pop	de
	push	de
	add	sp, #8
	ret
	.area _CODE
	.area _CABS (ABS)
