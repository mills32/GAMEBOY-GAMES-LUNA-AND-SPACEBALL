;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module Frame_b
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _DrawFrame32x32
	.globl _DrawOAMSprite
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
	.area _CODE_1
;C:/gbdk/ZGB/common/src/Frame_b.c:5: void DrawFrame32x32(int idx, UINT8 x, UINT8 y, UINT8 flags) {
;	---------------------------------
; Function DrawFrame32x32
; ---------------------------------
_DrawFrame32x32::
	add	sp, #-10
;C:/gbdk/ZGB/common/src/Frame_b.c:7: DrawOAMSprite(y + 16u, x +  8u, idx + 10u, flags);
	ldhl	sp,#12
	ld	b,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	add	a, #0x08
	ld	c,a
	inc	hl
	ld	a,(hl)
	add	a, #0x10
	ld	e,a
;C:/gbdk/ZGB/common/src/Frame_b.c:8: DrawOAMSprite(y + 16u, x + 16u, idx +  8u, flags);
	dec	hl
	ld	a,(hl)
	add	a, #0x10
	ldhl	sp,#3
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Frame_b.c:9: DrawOAMSprite(y + 32u, x +  8u, idx + 14u, flags);
	ldhl	sp,#15
	ld	a,(hl)
	add	a, #0x20
	ld	d,a
;C:/gbdk/ZGB/common/src/Frame_b.c:11: DrawOAMSprite(y + 16u, x + 24u, idx +  2u, flags);
	dec	hl
	ld	a,(hl)
	add	a, #0x18
	ldhl	sp,#4
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Frame_b.c:12: DrawOAMSprite(y + 16u, x + 32u, idx      , flags);
	push	hl
	ldhl	sp,#14
	ld	a,(hl)
	ldhl	sp,#4
	ld	(hl),a
	pop	hl
	ldhl	sp,#14
	ld	a,(hl)
	add	a, #0x20
	ldhl	sp,#1
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Frame_b.c:7: DrawOAMSprite(y + 16u, x +  8u, idx + 10u, flags);
	ld	a,b
	add	a, #0x0a
	dec	hl
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Frame_b.c:8: DrawOAMSprite(y + 16u, x + 16u, idx +  8u, flags);
	ld	a,b
	add	a, #0x08
	ldhl	sp,#6
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Frame_b.c:9: DrawOAMSprite(y + 32u, x +  8u, idx + 14u, flags);
	ld	a,b
	add	a, #0x0e
	dec	hl
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Frame_b.c:10: DrawOAMSprite(y + 32u, x + 16u, idx + 12u, flags);
	ld	a,b
	add	a, #0x0c
	ldhl	sp,#9
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Frame_b.c:11: DrawOAMSprite(y + 16u, x + 24u, idx +  2u, flags);
	ld	a,b
	add	a, #0x02
	dec	hl
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Frame_b.c:13: DrawOAMSprite(y + 32u, x + 24u, idx +  6u, flags);
	ld	a,b
	add	a, #0x06
	dec	hl
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Frame_b.c:14: DrawOAMSprite(y + 32u, x + 32u, idx +  4u, flags);
	inc	b
	inc	b
	inc	b
	inc	b
;C:/gbdk/ZGB/common/src/Frame_b.c:6: if(flags & 32){
	ldhl	sp,#16
	bit	5, (hl)
	jp	Z,00102$
;C:/gbdk/ZGB/common/src/Frame_b.c:7: DrawOAMSprite(y + 16u, x +  8u, idx + 10u, flags);
	push	bc
	push	de
	ldhl	sp,#20
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#5
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	pop	de
	pop	bc
;C:/gbdk/ZGB/common/src/Frame_b.c:8: DrawOAMSprite(y + 16u, x + 16u, idx +  8u, flags);
	push	bc
	push	de
	ldhl	sp,#20
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#11
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#9
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	pop	de
	pop	bc
;C:/gbdk/ZGB/common/src/Frame_b.c:9: DrawOAMSprite(y + 32u, x +  8u, idx + 14u, flags);
	push	bc
	push	de
	ldhl	sp,#20
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#10
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	de
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	pop	de
	pop	bc
;C:/gbdk/ZGB/common/src/Frame_b.c:10: DrawOAMSprite(y + 32u, x + 16u, idx + 12u, flags);
	push	bc
	push	de
	ldhl	sp,#20
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#14
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#9
	ld	a,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	pop	de
	pop	bc
;C:/gbdk/ZGB/common/src/Frame_b.c:11: DrawOAMSprite(y + 16u, x + 24u, idx +  2u, flags);
	push	bc
	push	de
	ldhl	sp,#20
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#13
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#10
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	pop	de
	pop	bc
;C:/gbdk/ZGB/common/src/Frame_b.c:12: DrawOAMSprite(y + 16u, x + 32u, idx      , flags);
	push	bc
	push	de
	ldhl	sp,#20
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#7
	ld	a,(hl)
	push	af
	inc	sp
	dec	hl
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	pop	de
	pop	bc
;C:/gbdk/ZGB/common/src/Frame_b.c:13: DrawOAMSprite(y + 32u, x + 24u, idx +  6u, flags);
	push	bc
	push	de
	ldhl	sp,#20
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#12
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#10
	ld	a,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	pop	de
	pop	bc
;C:/gbdk/ZGB/common/src/Frame_b.c:14: DrawOAMSprite(y + 32u, x + 32u, idx +  4u, flags);
	ldhl	sp,#16
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,#3
	ld	a,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	jp	00104$
00102$:
;C:/gbdk/ZGB/common/src/Frame_b.c:16: DrawOAMSprite(y + 16u, x +  8u, idx,       flags);
	push	bc
	push	de
	ldhl	sp,#20
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#7
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	pop	de
	pop	bc
;C:/gbdk/ZGB/common/src/Frame_b.c:17: DrawOAMSprite(y + 16u, x + 16u, idx +  2u, flags);
	push	bc
	push	de
	ldhl	sp,#20
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#13
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#9
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	pop	de
	pop	bc
;C:/gbdk/ZGB/common/src/Frame_b.c:18: DrawOAMSprite(y + 32u, x +  8u, idx +  4u, flags);
	push	de
	ldhl	sp,#18
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	de
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	pop	de
;C:/gbdk/ZGB/common/src/Frame_b.c:19: DrawOAMSprite(y + 32u, x + 16u, idx +  6u, flags);
	push	de
	ldhl	sp,#18
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#10
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#7
	ld	a,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	pop	de
;C:/gbdk/ZGB/common/src/Frame_b.c:20: DrawOAMSprite(y + 16u, x + 24u, idx +  8u, flags);
	push	de
	ldhl	sp,#18
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#9
	ld	a,(hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	pop	de
;C:/gbdk/ZGB/common/src/Frame_b.c:21: DrawOAMSprite(y + 16u, x + 32u, idx + 10u, flags);
	push	de
	ldhl	sp,#18
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#3
	ld	a,(hl)
	push	af
	inc	sp
	inc	hl
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	pop	de
;C:/gbdk/ZGB/common/src/Frame_b.c:22: DrawOAMSprite(y + 32u, x + 24u, idx + 12u, flags);
	push	de
	ldhl	sp,#18
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#12
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#8
	ld	a,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	pop	de
;C:/gbdk/ZGB/common/src/Frame_b.c:23: DrawOAMSprite(y + 32u, x + 32u, idx + 14u, flags);
	ldhl	sp,#16
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#6
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#3
	ld	a,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
00104$:
	add	sp, #10
	ret
	.area _CODE_1
	.area _CABS (ABS)
