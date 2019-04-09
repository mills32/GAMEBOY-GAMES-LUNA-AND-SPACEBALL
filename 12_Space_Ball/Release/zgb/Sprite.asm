;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module Sprite
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SpriteManagerRemove
	.globl _PopBank
	.globl _PushBank
	.globl _GetScrollTilePtr
	.globl _DrawFrame
	.globl _tile_coll
	.globl _InitSprite
	.globl _SetSpriteAnim
	.globl _DrawSprite
	.globl _TranslateSprite
	.globl _CheckCollision
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_tile_coll::
	.ds 2
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
;C:/gbdk/ZGB/common/src/Sprite.c:6: void InitSprite(struct Sprite* sprite, FrameSize size, UINT8 first_tile) {
;	---------------------------------
; Function InitSprite
; ---------------------------------
_InitSprite::
	add	sp, #-2
;C:/gbdk/ZGB/common/src/Sprite.c:7: sprite->size = size;
	ldhl	sp,#4
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
	pop	de
	push	de
	ldhl	sp,#6
	ld	a,(hl)
	ld	(de),a
;C:/gbdk/ZGB/common/src/Sprite.c:8: sprite->first_tile = first_tile;
	pop	bc
	push	bc
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Sprite.c:9: sprite->anim_data = 0u;
	pop	bc
	push	bc
	inc	bc
	inc	bc
	ld	a,#0x00
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Sprite.c:10: sprite->current_frame = 0u;
	pop	de
	push	de
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Sprite.c:11: sprite->anim_speed = 33u;
	pop	de
	push	de
	ld	hl,#0x0006
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x21
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Sprite.c:13: sprite->x = 0;
	pop	de
	push	de
	ld	hl,#0x0007
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x00
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Sprite.c:14: sprite->y = 0;
	pop	de
	push	de
	ld	hl,#0x0009
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x00
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Sprite.c:16: sprite->coll_x = 0u;
	pop	de
	push	de
	ld	hl,#0x000c
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Sprite.c:17: sprite->coll_y = 0u;
	pop	de
	push	de
	ld	hl,#0x000d
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Sprite.c:19: case FRAME_8x8:   sprite->coll_w =  8u; sprite->coll_h =  8u; break;
	pop	de
	push	de
	ld	hl,#0x000e
	add	hl,de
	ld	c,l
	ld	b,h
	pop	de
	push	de
	ld	hl,#0x000f
	add	hl,de
	inc	sp
	inc	sp
	push	hl
;C:/gbdk/ZGB/common/src/Sprite.c:18: switch(size) {
	ldhl	sp,#6
	ld	a,(hl)
	or	a, a
	jr	Z,00101$
	ldhl	sp,#6
	ld	a,(hl)
	dec	a
	jr	Z,00102$
	ldhl	sp,#6
	ld	a,(hl)
	sub	a, #0x02
	jr	Z,00103$
	ldhl	sp,#6
	ld	a,(hl)
	sub	a, #0x04
	jr	Z,00104$
	jr	00106$
;C:/gbdk/ZGB/common/src/Sprite.c:19: case FRAME_8x8:   sprite->coll_w =  8u; sprite->coll_h =  8u; break;
00101$:
	ld	a,#0x08
	ld	(bc),a
	pop	hl
	push	hl
	ld	(hl),#0x08
	jr	00106$
;C:/gbdk/ZGB/common/src/Sprite.c:20: case FRAME_8x16:  sprite->coll_w =  8u; sprite->coll_h = 16u; break;
00102$:
	ld	a,#0x08
	ld	(bc),a
	pop	hl
	push	hl
	ld	(hl),#0x10
	jr	00106$
;C:/gbdk/ZGB/common/src/Sprite.c:21: case FRAME_16x16: sprite->coll_w = 16u; sprite->coll_h = 16u; break;
00103$:
	ld	a,#0x10
	ld	(bc),a
	pop	hl
	push	hl
	ld	(hl),#0x10
	jr	00106$
;C:/gbdk/ZGB/common/src/Sprite.c:22: case FRAME_32x32: sprite->coll_w = 32u; sprite->coll_h = 32u; break;
00104$:
	ld	a,#0x20
	ld	(bc),a
	pop	hl
	push	hl
	ld	(hl),#0x20
;C:/gbdk/ZGB/common/src/Sprite.c:23: }
00106$:
	add	sp, #2
	ret
;C:/gbdk/ZGB/common/src/Sprite.c:26: void SetSpriteAnim(struct Sprite* sprite, UINT8* data, UINT8 speed) {
;	---------------------------------
; Function SetSpriteAnim
; ---------------------------------
_SetSpriteAnim::
	add	sp, #-4
;C:/gbdk/ZGB/common/src/Sprite.c:27: if(sprite->anim_data !=  data) {
	ldhl	sp,#6
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
	pop	bc
	push	bc
	inc	bc
	inc	bc
	ld	e, c
	ld	d, b
	ld	a,(de)
	inc	hl
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#8
	ld	a,(hl)
	ldhl	sp,#2
	sub	a, (hl)
	jr	NZ,00109$
	ldhl	sp,#9
	ld	a,(hl)
	ldhl	sp,#3
	sub	a, (hl)
	jp	Z,00103$
00109$:
;C:/gbdk/ZGB/common/src/Sprite.c:28: sprite->anim_data = data;
	ldhl	sp,#8
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Sprite.c:29: sprite->current_frame = 0;
	pop	de
	push	de
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Sprite.c:30: sprite->accum_ticks = 0;
	pop	de
	push	de
	ld	hl,#0x0005
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Sprite.c:31: sprite->anim_speed = speed;
	pop	de
	push	de
	ld	hl,#0x0006
	add	hl,de
	ld	c,l
	ld	b,h
	ldhl	sp,#10
	ld	a,(hl)
	ld	(bc),a
00103$:
	add	sp, #4
	ret
;C:/gbdk/ZGB/common/src/Sprite.c:38: void DrawSprite(struct Sprite* sprite) {
;	---------------------------------
; Function DrawSprite
; ---------------------------------
_DrawSprite::
	add	sp, #-13
;C:/gbdk/ZGB/common/src/Sprite.c:42: if(sprite->anim_data) {	
	ldhl	sp,#15
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#11
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0002
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#9
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;C:/gbdk/ZGB/common/src/Sprite.c:45: sprite->current_frame ++;
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#7
	ld	(hl+),a
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Sprite.c:42: if(sprite->anim_data) {	
	ld	a,b
	or	a,c
	jp	Z,00106$
;C:/gbdk/ZGB/common/src/Sprite.c:43: sprite->accum_ticks += sprite->anim_speed << delta_time;
	ldhl	sp,#(12 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0005
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#5
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	dec	hl
	ld	(hl),a
	ldhl	sp,#(12 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0006
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	hl,#_delta_time
	ld	a,(hl)
	inc	a
	jr	00142$
00141$:
	sla	c
00142$:
	dec	a
	jr	NZ,00141$
	ldhl	sp,#4
	ld	a,(hl)
	add	a, c
	ld	c,a
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
;C:/gbdk/ZGB/common/src/Sprite.c:44: if(sprite->accum_ticks > 100u) {
	ld	a,#0x64
	sub	a, c
	jp	NC,00104$
;C:/gbdk/ZGB/common/src/Sprite.c:45: sprite->current_frame ++;
	ldhl	sp,#(8 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	inc	a
	ldhl	sp,#4
	ld	(hl),a
	ldhl	sp,#(8 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ldhl	sp,#4
	ld	a,(hl)
	ld	(de),a
;C:/gbdk/ZGB/common/src/Sprite.c:46: if(sprite->current_frame == sprite->anim_data[0]){
	ldhl	sp,#(10 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	a,(bc)
	ld	c,a
	ldhl	sp,#4
	ld	a,(hl)
	sub	a, c
	jr	NZ,00102$
;C:/gbdk/ZGB/common/src/Sprite.c:47: sprite->current_frame = 0;
	ldhl	sp,#7
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x00
00102$:
;C:/gbdk/ZGB/common/src/Sprite.c:50: sprite->accum_ticks -= 100u;
	ldhl	sp,#(6 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	add	a,#0x9c
	ld	c,a
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
00104$:
;C:/gbdk/ZGB/common/src/Sprite.c:52: frame = sprite->anim_data[1 + sprite->current_frame];
	ldhl	sp,#(10 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#5
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	inc	bc
	ldhl	sp,#5
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	jr	00107$
00106$:
;C:/gbdk/ZGB/common/src/Sprite.c:54: frame = sprite->current_frame;
	ldhl	sp,#(8 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
00107$:
;C:/gbdk/ZGB/common/src/Sprite.c:57: screen_x = sprite->x - scroll_x;
	ldhl	sp,#(12 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0007
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#5
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ld	hl,#_scroll_x
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#7
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	dec	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	a,e
	sub	a,l
	ld	e,a
	ld	a,d
	sbc	a,h
	ldhl	sp,#1
	ld	(hl-),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/Sprite.c:58: screen_y = sprite->y - scroll_y;
	ldhl	sp,#(12 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0009
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#5
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ld	hl,#_scroll_y
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#7
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	dec	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	a,e
	sub	a,l
	ld	e,a
	ld	a,d
	sbc	a,h
	ldhl	sp,#3
	ld	(hl-),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/Sprite.c:60: if((screen_x + 32u < SCREENWIDTH_PLUS_32) && (screen_y + 32 < SCREENHEIGHT_PLUS_32)) {
	pop	de
	push	de
	ld	hl,#0x0020
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#5
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	a, (hl)
	sub	a, #0xc0
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jp	NC,00112$
	ldhl	sp,#(3 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0020
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#5
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	a, (hl)
	sub	a, #0xb0
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jp	NC,00112$
;C:/gbdk/ZGB/common/src/Sprite.c:61: DrawFrame(sprite->size, sprite->first_tile + (frame << sprite->size), screen_x, screen_y, sprite->flags);		
	ldhl	sp,#(12 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000b
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#5
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	dec	hl
	ld	(hl),a
	push	hl
	dec	hl
	dec	hl
	ld	a,(hl)
	ldhl	sp,#7
	ld	(hl),a
	pop	hl
	push	hl
	ldhl	sp,#2
	ld	a,(hl)
	ldhl	sp,#9
	ld	(hl),a
	pop	hl
	ldhl	sp,#(12 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0001
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#9
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	ld	(hl+),a
	ld	(hl),#0x00
	ld	b,#0x00
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	ld	(hl),a
	ld	a,(hl)
	inc	a
	jr	00146$
00145$:
	sla	c
	rl	b
00146$:
	dec	a
	jr	NZ,00145$
	dec	hl
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#4
	ld	a,(hl)
	push	af
	inc	sp
	inc	hl
	ld	a,(hl)
	push	af
	inc	sp
	inc	hl
	inc	hl
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	ldhl	sp,#16
	ld	a,(hl)
	push	af
	inc	sp
	call	_DrawFrame
	add	sp, #6
	jp	00115$
00112$:
;C:/gbdk/ZGB/common/src/Sprite.c:63: if((screen_x + THIS->lim_x + 16) > ((THIS->lim_x << 1) + 16 + SCREENWIDTH) ||
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#5
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0012
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	pop	hl
	push	hl
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#7
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0010
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#7
	ld	(hl+),a
	ld	(hl),d
	sla	c
	rl	b
	ld	hl,#0x00b0
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#7
	ld	a,c
	sub	a, (hl)
	inc	hl
	ld	a,b
	sbc	a, (hl)
	jp	C,00108$
;C:/gbdk/ZGB/common/src/Sprite.c:64: (screen_y + THIS->lim_y + 16) > ((THIS->lim_y << 1) + 16 + SCREENHEIGHT)
	ldhl	sp,#(6 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0014
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ldhl	sp,#2
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#5
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0010
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#5
	ld	(hl+),a
	ld	(hl),d
	sla	c
	rl	b
	ld	hl,#0x00a0
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#5
	ld	a,c
	sub	a, (hl)
	inc	hl
	ld	a,b
	sbc	a, (hl)
	jr	NC,00115$
00108$:
;C:/gbdk/ZGB/common/src/Sprite.c:66: SpriteManagerRemove(THIS_IDX);
	ld	hl,#_THIS_IDX
	ld	c,(hl)
	ld	b,#0x00
	push	bc
	call	_SpriteManagerRemove
	add	sp, #2
00115$:
	add	sp, #13
	ret
;C:/gbdk/ZGB/common/src/Sprite.c:72: UINT8 TranslateSprite(struct Sprite* sprite, INT8 x, INT8 y) {
;	---------------------------------
; Function TranslateSprite
; ---------------------------------
_TranslateSprite::
	add	sp, #-28
;C:/gbdk/ZGB/common/src/Sprite.c:75: UINT8 ret = 0;
	ldhl	sp,#17
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Sprite.c:77: PUSH_BANK(scroll_bank);
	ld	hl,#_scroll_bank
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/Sprite.c:80: start_x = (sprite->x + sprite->coll_x + sprite->coll_w - 1 + x);
	ldhl	sp,#(31 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0007
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#24
	ld	(hl+),a
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Sprite.c:81: start_y = (sprite->y + sprite->coll_y);
	ld	hl,#0x0009
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#11
	ld	(hl+),a
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Sprite.c:78: if(scroll_map) {
	ld	hl,#_scroll_map + 1
	ld	a,(hl-)
	or	a,(hl)
	jp	Z,00133$
;C:/gbdk/ZGB/common/src/Sprite.c:80: start_x = (sprite->x + sprite->coll_x + sprite->coll_w - 1 + x);
	ld	hl,#0x000c
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#15
	ld	(hl+),a
	ld	(hl),d
	ld	hl,#0x000e
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#20
	ld	(hl+),a
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Sprite.c:81: start_y = (sprite->y + sprite->coll_y);
	ld	hl,#0x000d
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#18
	ld	(hl+),a
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Sprite.c:83: n_its = ((start_y + sprite->coll_h - 1u) >> 3) - (start_y >> 3) + 1u;
	ld	hl,#0x000f
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#13
	ld	(hl+),a
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Sprite.c:79: if(x > 0) {
	ldhl	sp,#32
	ld	a,(hl)
	ld	e,a
	ld	a,#0x00
	ld	d,a
	xor	a, a
	sub	a, (hl)
	bit	7, e
	jr	Z,00240$
	bit	7, d
	jr	NZ,00241$
	cp	a, a
	jr	00241$
00240$:
	bit	7, d
	jr	Z,00241$
	scf
00241$:
	jp	NC,00107$
;C:/gbdk/ZGB/common/src/Sprite.c:80: start_x = (sprite->x + sprite->coll_x + sprite->coll_w - 1 + x);
	ldhl	sp,#(25 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#9
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#(16 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#9
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#(21 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	ldhl	sp,#9
	ld	(hl),e
	inc	hl
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	dec	bc
	ldhl	sp,#32
	ld	e,(hl)
	ld	a,(hl)
	rla
	sbc	a, a
	ld	d,a
	ldhl	sp,#9
	ld	(hl),e
	inc	hl
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#9
	ld	(hl+),a
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Sprite.c:81: start_y = (sprite->y + sprite->coll_y);
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#26
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#(19 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#26
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#26
	ld	(hl+),a
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Sprite.c:82: if(((start_y & 0xF000) | (start_x & 0xF000)) == 0u) {
	ld	c,#0x00
	ld	a,(hl)
	and	a, #0xf0
	ld	b,a
	ld	e,#0x00
	ldhl	sp,#10
	ld	a,(hl)
	and	a, #0xf0
	ld	d,a
	ld	a,c
	or	a, e
	ld	c,a
	ld	a,b
	or	a, d
	ld	b,a
	or	a,c
	jp	NZ,00107$
;C:/gbdk/ZGB/common/src/Sprite.c:83: n_its = ((start_y + sprite->coll_h - 1u) >> 3) - (start_y >> 3) + 1u;
	ldhl	sp,#(14 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#26
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	dec	bc
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ldhl	sp,#27
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	sub	a,e
	ld	e,a
	ld	a,b
	sbc	a,d
	ld	b,a
	ld	c,e
	inc	bc
	ldhl	sp,#22
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/Sprite.c:84: tile_coll = GetScrollTilePtr(start_x >> 3, start_y >> 3);
	ldhl	sp,#(10 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ldhl	sp,#26
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	call	_GetScrollTilePtr
	add	sp, #4
	ld	hl,#_tile_coll
	ld	(hl),e
	inc	hl
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Sprite.c:86: for(i = 0u; i != n_its; ++i, tile_coll += scroll_tiles_w) {
	ld	c,#0x00
00135$:
	ld	b,c
	ld	e,#0x00
	ldhl	sp,#22
	ld	a,(hl)
	sub	a, b
	jr	NZ,00242$
	inc	hl
	ld	a,(hl)
	sub	a, e
	jp	Z,00107$
00242$:
;C:/gbdk/ZGB/common/src/Sprite.c:87: if(scroll_collisions[*tile_coll] == 1u) {
	ld	hl,#_tile_coll + 1
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	b,a
	ld	de,#_scroll_collisions
	ld	l,b
	ld	h,#0x00
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#26
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	a
	jr	NZ,00136$
;C:/gbdk/ZGB/common/src/Sprite.c:88: x -= (start_x & (UINT16)7u) + 1;
	ldhl	sp,#9
	ld	a,(hl)
	and	a, #0x07
	ld	c,a
	ld	e,#0x00
	inc	c
	ldhl	sp,#32
	ld	a,(hl)
	sub	a, c
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Sprite.c:89: ret = *tile_coll;
	ldhl	sp,#17
	ld	(hl),b
;C:/gbdk/ZGB/common/src/Sprite.c:90: break;
	jr	00107$
00136$:
;C:/gbdk/ZGB/common/src/Sprite.c:86: for(i = 0u; i != n_its; ++i, tile_coll += scroll_tiles_w) {
	inc	c
	ld	hl,#_tile_coll
	ld	a,(hl)
	ld	hl,#_scroll_tiles_w
	add	a, (hl)
	ld	hl,#_tile_coll
	ld	(hl+),a
	ld	a,(hl)
	ld	hl,#_scroll_tiles_w + 1
	adc	a, (hl)
	ld	hl,#_tile_coll + 1
	ld	(hl),a
	jp	00135$
00107$:
;C:/gbdk/ZGB/common/src/Sprite.c:95: if(x < 0) {
	ld	a,#0x00
	ld	e,a
	ldhl	sp,#32
	ld	a,(hl)
	ld	d,a
	ld	a,(hl)
	bit	7,a
	jp	Z,00114$
;C:/gbdk/ZGB/common/src/Sprite.c:96: start_x = (sprite->x + sprite->coll_x + (INT16)x);
	ldhl	sp,#(25 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#22
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#(16 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#22
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#32
	ld	a,(hl)
	ldhl	sp,#22
	ld	(hl),a
	ldhl	sp,#32
	ld	a,(hl)
	rla
	sbc	a, a
	ldhl	sp,#23
	ld	(hl-),a
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#26
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#26
	ld	(hl+),a
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Sprite.c:97: start_y = (sprite->y + sprite->coll_y);
	ldhl	sp,#(12 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#9
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#(19 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#9
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#9
	ld	(hl+),a
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Sprite.c:98: if(((start_y & 0xF000) | (start_x & 0xF000)) == 0u) {
	ld	c,#0x00
	ld	a,(hl)
	and	a, #0xf0
	ld	b,a
	ld	e,#0x00
	ldhl	sp,#27
	ld	a,(hl)
	and	a, #0xf0
	ld	d,a
	ld	a,c
	or	a, e
	ld	c,a
	ld	a,b
	or	a, d
	ld	b,a
	or	a,c
	jp	NZ,00114$
;C:/gbdk/ZGB/common/src/Sprite.c:99: n_its = ((start_y + sprite->coll_h - 1u) >> 3) - (start_y >> 3) + 1u;
	ldhl	sp,#(14 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#9
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	dec	bc
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ldhl	sp,#10
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	sub	a,e
	ld	e,a
	ld	a,b
	sbc	a,d
	ld	b,a
	ld	c,e
	inc	bc
	ldhl	sp,#7
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/Sprite.c:100: tile_coll = GetScrollTilePtr(start_x >> 3, start_y >> 3);
	ldhl	sp,#(27 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ldhl	sp,#9
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	call	_GetScrollTilePtr
	add	sp, #4
	ld	hl,#_tile_coll
	ld	(hl),e
	inc	hl
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Sprite.c:102: for(i = 0u; i != n_its; ++i, tile_coll += scroll_tiles_w) {
	ldhl	sp,#2
	ld	(hl),#0x00
00138$:
	ldhl	sp,#2
	ld	c,(hl)
	ld	b,#0x00
	ldhl	sp,#7
	ld	a,(hl)
	sub	a, c
	jr	NZ,00245$
	inc	hl
	ld	a,(hl)
	sub	a, b
	jp	Z,00114$
00245$:
;C:/gbdk/ZGB/common/src/Sprite.c:87: if(scroll_collisions[*tile_coll] == 1u) {
	ld	hl,#_tile_coll + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(bc)
	ldhl	sp,#9
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Sprite.c:103: if(scroll_collisions[*tile_coll] == 1u) {
	ld	de,#_scroll_collisions
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	dec	a
	jr	NZ,00139$
;C:/gbdk/ZGB/common/src/Sprite.c:104: x = (INT16)x + (8u - (start_x & (UINT16)7u));
	ldhl	sp,#22
	ld	c,(hl)
	ldhl	sp,#26
	ld	a,(hl)
	and	a, #0x07
	ld	b,a
	ld	e,#0x00
	ld	a,#0x08
	sub	a, b
	ld	b, a
	add	a,c
	ldhl	sp,#32
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Sprite.c:105: ret = *tile_coll;
	push	hl
	ldhl	sp,#11
	ld	a,(hl)
	ldhl	sp,#19
	ld	(hl),a
	pop	hl
;C:/gbdk/ZGB/common/src/Sprite.c:106: break;
	jr	00114$
00139$:
;C:/gbdk/ZGB/common/src/Sprite.c:102: for(i = 0u; i != n_its; ++i, tile_coll += scroll_tiles_w) {
	ldhl	sp,#2
	inc	(hl)
	ld	hl,#_tile_coll
	ld	a,(hl)
	ld	hl,#_scroll_tiles_w
	add	a, (hl)
	ld	hl,#_tile_coll
	ld	(hl+),a
	ld	a,(hl)
	ld	hl,#_scroll_tiles_w + 1
	adc	a, (hl)
	ld	hl,#_tile_coll + 1
	ld	(hl),a
	jp	00138$
00114$:
;C:/gbdk/ZGB/common/src/Sprite.c:111: if(y > 0) {
	ldhl	sp,#33
	ld	a,(hl)
	ld	e,a
	ld	a,#0x00
	ld	d,a
	xor	a, a
	sub	a, (hl)
	bit	7, e
	jr	Z,00248$
	bit	7, d
	jr	NZ,00249$
	cp	a, a
	jr	00249$
00248$:
	bit	7, d
	jr	Z,00249$
	scf
00249$:
	jp	NC,00124$
;C:/gbdk/ZGB/common/src/Sprite.c:112: start_x = (sprite->x + sprite->coll_x);
	ldhl	sp,#(25 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#7
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#(16 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#7
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#5
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/Sprite.c:113: start_y = (sprite->y + sprite->coll_y + sprite->coll_h - 1 + y);
	ldhl	sp,#(12 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#7
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#(19 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#7
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#7
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#(14 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#7
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	dec	bc
	ldhl	sp,#33
	ld	e,(hl)
	ld	a,(hl)
	rla
	sbc	a, a
	ld	d,a
	ldhl	sp,#7
	ld	(hl),e
	inc	hl
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#3
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/Sprite.c:114: if(((start_y & 0xF000) | (start_x & 0xF000)) == 0u) {
	ld	c,#0x00
	ld	a,(hl)
	and	a, #0xf0
	ld	b,a
	ld	e,#0x00
	inc	hl
	inc	hl
	ld	a,(hl)
	and	a, #0xf0
	ld	d,a
	ld	a,c
	or	a, e
	ld	c,a
	ld	a,b
	or	a, d
	ld	b,a
	or	a,c
	jp	NZ,00124$
;C:/gbdk/ZGB/common/src/Sprite.c:115: n_its = ((start_x + sprite->coll_w - 1u) >> 3) - (start_x >> 3) + 1u;
	ldhl	sp,#(21 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#5
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	dec	bc
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ldhl	sp,#5
	ld	a,(hl)
	ldhl	sp,#22
	ld	(hl),a
	ldhl	sp,#6
	ld	a,(hl)
	ldhl	sp,#23
	ld	(hl),a
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	sub	a,e
	ld	e,a
	ld	a,b
	sbc	a,d
	ld	b,a
	ld	c,e
	inc	bc
	inc	sp
	inc	sp
	push	bc
;C:/gbdk/ZGB/common/src/Sprite.c:116: tile_coll = GetScrollTilePtr(start_x >> 3, start_y >> 3);
	ldhl	sp,#(4 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	push	bc
	push	bc
	ldhl	sp,#26
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_GetScrollTilePtr
	add	sp, #4
	pop	bc
	ld	hl,#_tile_coll
	ld	(hl),e
	inc	hl
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Sprite.c:118: for(i = 0u; i != n_its; ++i, tile_coll += 1u) {
	ldhl	sp,#(4 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ldhl	sp,#7
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	a,e
	sub	a,l
	ld	e,a
	ld	a,d
	sbc	a,h
	ldhl	sp,#8
	ld	(hl-),a
	ld	(hl),e
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ld	a,c
	sub	a, e
	jr	NZ,00250$
	ld	a,b
	sub	a, d
	jr	NZ,00250$
	ld	a,#0x01
	jr	00251$
00250$:
	xor	a,a
00251$:
	ldhl	sp,#7
	ld	(hl),a
	ldhl	sp,#2
	ld	(hl),#0x00
00141$:
	ldhl	sp,#2
	ld	c,(hl)
	ld	b,#0x00
	dec	hl
	dec	hl
	ld	a,(hl)
	sub	a, c
	jr	NZ,00252$
	inc	hl
	ld	a,(hl)
	sub	a, b
	jp	Z,00124$
00252$:
;C:/gbdk/ZGB/common/src/Sprite.c:87: if(scroll_collisions[*tile_coll] == 1u) {
	ld	hl,#_tile_coll + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(bc)
	ldhl	sp,#22
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Sprite.c:119: if(scroll_collisions[*tile_coll] == 1u || 
	ld	de,#_scroll_collisions
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	dec	a
	jp	Z,00115$
;C:/gbdk/ZGB/common/src/Sprite.c:120: (scroll_collisions_down[*tile_coll] == 1u && //Tile that only checks collisions when going down
	ld	de,#_scroll_collisions_down
	ldhl	sp,#22
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	dec	a
	jp	NZ,00142$
;C:/gbdk/ZGB/common/src/Sprite.c:121: scroll_collisions_down[*(tile_coll - scroll_tiles_w)] == 0) &&  //The one above is not collidable (so we can crate a big block putting some of there together)
	ld	hl,#_scroll_tiles_w + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#_tile_coll
	ld	a,(hl)
	sub	a, c
	ld	c,a
	inc	hl
	ld	a,(hl)
	sbc	a, b
	ld	b,a
	ld	a,(bc)
	add	a,#<(_scroll_collisions_down)
	ld	c,a
	ld	a,#>(_scroll_collisions_down)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	or	a, a
	jr	NZ,00142$
;C:/gbdk/ZGB/common/src/Sprite.c:122: (((start_y - y) >> 3) != (start_y >> 3)) //The is entering the collidable tile in this moment
	ldhl	sp,#7
	bit	0,(hl)
	jr	NZ,00142$
00115$:
;C:/gbdk/ZGB/common/src/Sprite.c:124: y -= (start_y & (UINT16)7u) + 1;
	ldhl	sp,#3
	ld	a,(hl)
	and	a, #0x07
	ld	c,a
	ld	b,#0x00
	inc	c
	ldhl	sp,#33
	ld	a,(hl)
	sub	a, c
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Sprite.c:125: ret = *tile_coll;
	push	hl
	ldhl	sp,#24
	ld	a,(hl)
	ldhl	sp,#19
	ld	(hl),a
	pop	hl
;C:/gbdk/ZGB/common/src/Sprite.c:126: break;
	jr	00124$
00142$:
;C:/gbdk/ZGB/common/src/Sprite.c:118: for(i = 0u; i != n_its; ++i, tile_coll += 1u) {
	ldhl	sp,#2
	inc	(hl)
	ld	hl,#_tile_coll
	inc	(hl)
	jp	NZ,00141$
	inc	hl
	inc	(hl)
	jp	00141$
00124$:
;C:/gbdk/ZGB/common/src/Sprite.c:131: if(y < 0) {
	ld	a,#0x00
	ld	e,a
	ldhl	sp,#33
	ld	a,(hl)
	ld	d,a
	ld	a,(hl)
	bit	7,a
	jp	Z,00133$
;C:/gbdk/ZGB/common/src/Sprite.c:132: start_x = (sprite->x + sprite->coll_x);
	ldhl	sp,#(25 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#7
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#(16 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#7
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#7
	ld	(hl+),a
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Sprite.c:133: start_y = (sprite->y + sprite->coll_y + (INT16)y);
	ldhl	sp,#(12 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#22
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#(19 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#22
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#22
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#33
	ld	a,(hl)
	ldhl	sp,#26
	ld	(hl),a
	ldhl	sp,#33
	ld	a,(hl)
	rla
	sbc	a, a
	ldhl	sp,#27
	ld	(hl-),a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ldhl	sp,#22
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#22
	ld	(hl+),a
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Sprite.c:134: if(((start_y & 0xF000) | (start_x & 0xF000)) == 0u) {
	ld	c,#0x00
	ld	a,(hl)
	and	a, #0xf0
	ld	b,a
	ld	e,#0x00
	ldhl	sp,#8
	ld	a,(hl)
	and	a, #0xf0
	ld	d,a
	ld	a,c
	or	a, e
	ld	c,a
	ld	a,b
	or	a, d
	ld	b,a
	or	a,c
	jp	NZ,00133$
;C:/gbdk/ZGB/common/src/Sprite.c:135: n_its = ((start_x + sprite->coll_w - 1u) >> 3) - (start_x >> 3) + 1u;
	ldhl	sp,#(21 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#7
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	dec	bc
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ldhl	sp,#8
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	sub	a,e
	ld	e,a
	ld	a,b
	sbc	a,d
	ld	b,a
	ld	c,e
	inc	bc
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/Sprite.c:136: tile_coll = GetScrollTilePtr(start_x >> 3, start_y >> 3);
	ldhl	sp,#(23 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	push	bc
	ldhl	sp,#9
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_GetScrollTilePtr
	add	sp, #4
	ld	hl,#_tile_coll
	ld	(hl),e
	inc	hl
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Sprite.c:138: for(i = 0u; i != n_its; ++i, tile_coll += 1u) {
	ldhl	sp,#2
	ld	(hl),#0x00
00144$:
	ldhl	sp,#2
	ld	c,(hl)
	ld	b,#0x00
	ldhl	sp,#9
	ld	a,(hl)
	sub	a, c
	jr	NZ,00257$
	inc	hl
	ld	a,(hl)
	sub	a, b
	jp	Z,00133$
00257$:
;C:/gbdk/ZGB/common/src/Sprite.c:87: if(scroll_collisions[*tile_coll] == 1u) {
	ld	hl,#_tile_coll + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(bc)
	ldhl	sp,#7
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Sprite.c:139: if(scroll_collisions[*tile_coll] == 1u) {
	ld	de,#_scroll_collisions
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	dec	a
	jr	NZ,00145$
;C:/gbdk/ZGB/common/src/Sprite.c:140: y = (INT16)y + (8u - (start_y & (UINT16)7u));
	ldhl	sp,#26
	ld	c,(hl)
	ldhl	sp,#22
	ld	a,(hl)
	and	a, #0x07
	ld	b,a
	ld	e,#0x00
	ld	a,#0x08
	sub	a, b
	ld	e, a
	add	a,c
	ldhl	sp,#33
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Sprite.c:141: ret = *tile_coll;
	push	hl
	ldhl	sp,#9
	ld	a,(hl)
	ldhl	sp,#19
	ld	(hl),a
	pop	hl
;C:/gbdk/ZGB/common/src/Sprite.c:142: break;
	jr	00133$
00145$:
;C:/gbdk/ZGB/common/src/Sprite.c:138: for(i = 0u; i != n_its; ++i, tile_coll += 1u) {
	ldhl	sp,#2
	inc	(hl)
	ld	hl,#_tile_coll
	inc	(hl)
	jp	NZ,00144$
	inc	hl
	inc	(hl)
	jp	00144$
00133$:
;C:/gbdk/ZGB/common/src/Sprite.c:148: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/Sprite.c:150: sprite->x += (INT16)x;
	ldhl	sp,#(25 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#7
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#32
	ld	c,(hl)
	ld	a,(hl)
	rla
	sbc	a, a
	ld	b,a
	ldhl	sp,#7
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#24
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/Sprite.c:151: sprite->y += (INT16)y;
	ldhl	sp,#(12 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#7
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#33
	ld	c,(hl)
	ld	a,(hl)
	rla
	sbc	a, a
	ld	b,a
	ldhl	sp,#7
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#11
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/Sprite.c:152: return ret;
	ldhl	sp,#17
	ld	e,(hl)
	add	sp, #28
	ret
;C:/gbdk/ZGB/common/src/Sprite.c:155: UINT8 CheckCollision(struct Sprite* sprite1, struct Sprite* sprite2) {
;	---------------------------------
; Function CheckCollision
; ---------------------------------
_CheckCollision::
	add	sp, #-10
;C:/gbdk/ZGB/common/src/Sprite.c:156: if( (sprite1->x + sprite1->coll_x + sprite1->coll_w < sprite2->x + sprite2->coll_x) ||
	ldhl	sp,#12
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#4
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0007
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ldhl	sp,#6
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl-),a
	dec	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000c
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#6
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#6
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	dec	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000e
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#6
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,#14
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#2
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0007
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ldhl	sp,#8
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#(3 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000c
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#8
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#8
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#0
	ld	d, h
	ld	e, l
	ldhl	sp,#8
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	jp	C,00101$
;C:/gbdk/ZGB/common/src/Sprite.c:157: (sprite2->x + sprite2->coll_x + sprite2->coll_w < sprite1->x + sprite1->coll_x) ||
	ldhl	sp,#(3 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000e
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#8
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#6
	ld	a,c
	sub	a, (hl)
	inc	hl
	ld	a,b
	sbc	a, (hl)
	jp	C,00101$
;C:/gbdk/ZGB/common/src/Sprite.c:158: (sprite1->y + sprite1->coll_y + sprite1->coll_h < sprite2->y + sprite2->coll_y) ||
	ldhl	sp,#(5 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0009
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ldhl	sp,#8
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#(5 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000d
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#8
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#8
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#(5 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000f
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#8
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,#(3 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0009
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ldhl	sp,#6
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#(3 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000d
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#6
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#6
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#0
	ld	d, h
	ld	e, l
	ldhl	sp,#6
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	jr	C,00101$
;C:/gbdk/ZGB/common/src/Sprite.c:159: (sprite2->y + sprite2->coll_y + sprite2->coll_h < sprite1->y + sprite1->coll_y)
	ldhl	sp,#(3 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000f
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#6
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#8
	ld	a,c
	sub	a, (hl)
	inc	hl
	ld	a,b
	sbc	a, (hl)
	jr	NC,00102$
00101$:
;C:/gbdk/ZGB/common/src/Sprite.c:161: return 0;
	ld	e,#0x00
	jr	00107$
00102$:
;C:/gbdk/ZGB/common/src/Sprite.c:163: return 1;
	ld	e,#0x01
00107$:
	add	sp, #10
	ret
	.area _CODE
	.area _CABS (ABS)
