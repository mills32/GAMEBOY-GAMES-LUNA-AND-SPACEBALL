;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module Frame
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _DrawFrame32x32
	.globl _PopBank
	.globl _PushBank
	.globl _DrawOAMSprite
	.globl _DrawFrame
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
;C:/gbdk/ZGB/common/src/Frame.c:12: void DrawFrame(FrameSize size, int idx, UINT8 x, UINT8 y, UINT8 flags){
;	---------------------------------
; Function DrawFrame
; ---------------------------------
_DrawFrame::
	dec	sp
;C:/gbdk/ZGB/common/src/Frame.c:25: DrawOAMSprite(y + 16u, x + 8u, idx, flags);
	ldhl	sp,#4
	ld	c,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	add	a, #0x08
	ld	b,a
	inc	hl
	ld	a,(hl)
	add	a, #0x10
	ld	d,a
;C:/gbdk/ZGB/common/src/Frame.c:19: switch(size) {
	ldhl	sp,#3
	ld	a,(hl)
	dec	a
	jr	Z,00101$
	ldhl	sp,#3
	ld	a,(hl)
	sub	a, #0x02
	jr	Z,00102$
	ldhl	sp,#3
	ld	a,(hl)
	sub	a, #0x04
	jp	Z,00106$
	jp	00108$
;C:/gbdk/ZGB/common/src/Frame.c:24: case FRAME_8x16:
00101$:
;C:/gbdk/ZGB/common/src/Frame.c:25: DrawOAMSprite(y + 16u, x + 8u, idx, flags);
	ldhl	sp,#8
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
;C:/gbdk/ZGB/common/src/Frame.c:26: break;
	jp	00108$
;C:/gbdk/ZGB/common/src/Frame.c:28: case FRAME_16x16:
00102$:
;C:/gbdk/ZGB/common/src/Frame.c:30: DrawOAMSprite(y + 16u, x + 8u,  idx + 2u, flags);
	ldhl	sp,#4
	ld	e,(hl)
;C:/gbdk/ZGB/common/src/Frame.c:31: DrawOAMSprite(y + 16u, x + 16u, idx,      flags);
	inc	hl
	inc	hl
	ld	a,(hl)
	add	a, #0x10
	ldhl	sp,#0
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Frame.c:30: DrawOAMSprite(y + 16u, x + 8u,  idx + 2u, flags);
	inc	e
	inc	e
;C:/gbdk/ZGB/common/src/Frame.c:29: if(flags & 32){
	ldhl	sp,#8
	bit	5, (hl)
	jp	Z,00104$
;C:/gbdk/ZGB/common/src/Frame.c:30: DrawOAMSprite(y + 16u, x + 8u,  idx + 2u, flags);
	push	bc
	push	de
	ldhl	sp,#12
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	pop	de
	pop	bc
;C:/gbdk/ZGB/common/src/Frame.c:31: DrawOAMSprite(y + 16u, x + 16u, idx,      flags);
	ldhl	sp,#8
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ldhl	sp,#2
	ld	a,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	jp	00108$
00104$:
;C:/gbdk/ZGB/common/src/Frame.c:33: DrawOAMSprite(y + 16u, x + 8u,  idx,      flags);
	push	de
	ldhl	sp,#10
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
	pop	de
;C:/gbdk/ZGB/common/src/Frame.c:34: DrawOAMSprite(y + 16u, x + 16u, idx + 2u, flags);
	ldhl	sp,#8
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	ldhl	sp,#2
	ld	a,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_DrawOAMSprite
	add	sp, #4
;C:/gbdk/ZGB/common/src/Frame.c:36: break;
	jr	00108$
;C:/gbdk/ZGB/common/src/Frame.c:38: case FRAME_32x32:
00106$:
;C:/gbdk/ZGB/common/src/Frame.c:39: PUSH_BANK(1);
	ld	a,#0x01
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/Frame.c:40: DrawFrame32x32(idx, x, y, flags);
	ldhl	sp,#8
	ld	a,(hl)
	push	af
	inc	sp
	dec	hl
	ld	a,(hl)
	push	af
	inc	sp
	dec	hl
	ld	a,(hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_DrawFrame32x32
	add	sp, #5
;C:/gbdk/ZGB/common/src/Frame.c:41: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/Frame.c:43: }
00108$:
	inc	sp
	ret
	.area _CODE
	.area _CABS (ABS)
