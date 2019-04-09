;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module Vector
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcpy
	.globl _VectorAdd
	.globl _VectorRemovePos
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
;C:/gbdk/ZGB/common/src/Vector.c:5: void VectorAdd(UINT8* v, UINT8 elem) {
;	---------------------------------
; Function VectorAdd
; ---------------------------------
_VectorAdd::
	dec	sp
;C:/gbdk/ZGB/common/src/Vector.c:6: v[++ v[0]] = elem;
	ldhl	sp,#(4 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(bc)
	inc	a
	ldhl	sp,#0
	ld	(hl),a
	ld	a,(hl)
	ld	(bc),a
	ld	l,(hl)
	ld	h,#0x00
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#5
	ld	a,(hl)
	ld	(bc),a
	inc	sp
	ret
;C:/gbdk/ZGB/common/src/Vector.c:9: void VectorRemovePos(UINT8* v, UINT8 pos) {
;	---------------------------------
; Function VectorRemovePos
; ---------------------------------
_VectorRemovePos::
	add	sp, #-8
;C:/gbdk/ZGB/common/src/Vector.c:10: memcpy(&v[pos + 1], &v[pos + 2], v[0] - pos);
	ldhl	sp,#10
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#4
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#12
	ld	a,(hl)
	ldhl	sp,#6
	ld	(hl+),a
	ld	(hl),#0x00
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	sub	a,e
	ld	e,a
	ld	a,b
	sbc	a,d
	ldhl	sp,#3
	ld	(hl-),a
	ld	(hl),e
	ldhl	sp,#(7 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	ldhl	sp,#4
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	sp
	inc	sp
	push	bc
	ldhl	sp,#(7 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	ldhl	sp,#4
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	push	bc
	call	_memcpy
	add	sp, #6
;C:/gbdk/ZGB/common/src/Vector.c:11: v[0] --;
	ldhl	sp,#(5 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	dec	c
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	add	sp, #8
	ret
	.area _CODE
	.area _CABS (ABS)
