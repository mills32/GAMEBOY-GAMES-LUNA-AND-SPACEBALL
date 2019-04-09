;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module BkgAnimation
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PopBank
	.globl _PushBank
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _NULL_TILE
	.globl _c3
	.globl _c2
	.globl _c1
	.globl _c0
	.globl _LOAD_MAP_ANIM
	.globl _MAP_ANIMATE
	.globl _LOAD_TILE_ANIM
	.globl _TILE_ANIMATE
	.globl _BKG_EDIT_TILE
	.globl _WIN_EDIT_TILE
	.globl _BKG_COLLECT_ITEM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_NULL_TILE::
	.ds 10
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
;C:/gbdk/ZGB/common/src/BkgAnimation.c:146: const unsigned char * NULL_TILE[] = {
	ld	hl,#_NULL_TILE
	ld	(hl),#<(_c0)
	inc	hl
	ld	(hl),#>(_c0)
	ld	hl,#(_NULL_TILE + 0x0002)
	ld	(hl),#<(_c1)
	inc	hl
	ld	(hl),#>(_c1)
	ld	hl,#(_NULL_TILE + 0x0004)
	ld	(hl),#<(_c2)
	inc	hl
	ld	(hl),#>(_c2)
	ld	hl,#(_NULL_TILE + 0x0006)
	ld	(hl),#<(_c3)
	inc	hl
	ld	(hl),#>(_c3)
	ld	hl,#(_NULL_TILE + 0x0008)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;C:/gbdk/ZGB/common/src/BkgAnimation.c:4: void LOAD_MAP_ANIM(MAP_ANIMATION* anim, UINT8 sx, UINT8 sy, UINT8 frames, unsigned char *map, UINT8 bank)
;	---------------------------------
; Function LOAD_MAP_ANIM
; ---------------------------------
_LOAD_MAP_ANIM::
	add	sp, #-2
;C:/gbdk/ZGB/common/src/BkgAnimation.c:6: anim->sx = sx;
	ldhl	sp,#4
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
	pop	bc
	push	bc
	inc	bc
	inc	bc
	ldhl	sp,#6
	ld	a,(hl)
	ld	(bc),a
;C:/gbdk/ZGB/common/src/BkgAnimation.c:7: anim->sy = sy;
	pop	bc
	push	bc
	inc	bc
	inc	bc
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;C:/gbdk/ZGB/common/src/BkgAnimation.c:8: anim->frame = 0;
	pop	de
	push	de
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;C:/gbdk/ZGB/common/src/BkgAnimation.c:9: anim->frames = frames;
	pop	de
	push	de
	ld	hl,#0x0005
	add	hl,de
	ld	c,l
	ld	b,h
	ldhl	sp,#8
	ld	a,(hl)
	ld	(bc),a
;C:/gbdk/ZGB/common/src/BkgAnimation.c:10: anim->timer = 0;
	pop	de
	push	de
	ld	hl,#0x0006
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x00
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
;C:/gbdk/ZGB/common/src/BkgAnimation.c:11: PUSH_BANK(bank);
	ldhl	sp,#11
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/BkgAnimation.c:12: anim->map = map;
	pop	de
	push	de
	ld	hl,#0x0009
	add	hl,de
	ld	c,l
	ld	b,h
	ldhl	sp,#9
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;C:/gbdk/ZGB/common/src/BkgAnimation.c:13: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/BkgAnimation.c:14: anim->bank = bank;
	pop	de
	push	de
	ld	hl,#0x000c
	add	hl,de
	ld	c,l
	ld	b,h
	ldhl	sp,#11
	ld	a,(hl)
	ld	(bc),a
	add	sp, #2
	ret
;C:/gbdk/ZGB/common/src/BkgAnimation.c:17: void MAP_ANIMATE(MAP_ANIMATION* anim, UINT8 x, UINT8 y, UINT8 speed) 
;	---------------------------------
; Function MAP_ANIMATE
; ---------------------------------
_MAP_ANIMATE::
	add	sp, #-12
;C:/gbdk/ZGB/common/src/BkgAnimation.c:19: if (anim->timer == speed){
	ldhl	sp,#14
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
	pop	de
	push	de
	ld	hl,#0x0006
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#8
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	inc	hl
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#18
	ld	c,(hl)
	ld	b,#0x00
;C:/gbdk/ZGB/common/src/BkgAnimation.c:20: anim->pos = anim->frame * anim->sx * anim->sy;
	pop	de
	push	de
	ld	hl,#0x0004
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#4
	ld	(hl+),a
	ld	(hl),d
;C:/gbdk/ZGB/common/src/BkgAnimation.c:19: if (anim->timer == speed){
	ldhl	sp,#10
	ld	a,(hl)
	sub	a, c
	jp	NZ,00102$
	inc	hl
	ld	a,(hl)
	sub	a, b
	jp	NZ,00102$
;C:/gbdk/ZGB/common/src/BkgAnimation.c:20: anim->pos = anim->frame * anim->sx * anim->sy;
	pop	de
	push	de
	ld	hl,#0x000b
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#10
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#(5 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	b,a
	pop	de
	push	de
	ld	hl,#0x0002
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#2
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__muluchar
	add	sp, #2
	ld	b,e
	pop	de
	push	de
	ld	hl,#0x0003
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#6
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__muluchar
	add	sp, #2
	ld	c,e
	ldhl	sp,#10
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
;C:/gbdk/ZGB/common/src/BkgAnimation.c:21: PUSH_BANK(anim->bank);
	pop	de
	push	de
	ld	hl,#0x000c
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	b,a
	push	bc
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/BkgAnimation.c:22: set_bkg_tiles(x,y,anim->sx,anim->sy,anim->map+anim->pos);
	pop	de
	push	de
	ld	hl,#0x0009
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
	ldhl	sp,#(11 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	ld	(hl),a
	ld	l,(hl)
	ld	h,#0x00
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#(7 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#(3 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	af
	ld	a,(de)
	ldhl	sp,#8
	ld	(hl),a
	pop	af
	push	bc
	push	af
	inc	sp
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#21
	ld	a,(hl)
	push	af
	inc	sp
	dec	hl
	ld	a,(hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;C:/gbdk/ZGB/common/src/BkgAnimation.c:23: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/BkgAnimation.c:24: anim->frame++;
	ldhl	sp,#(5 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	c
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
;C:/gbdk/ZGB/common/src/BkgAnimation.c:25: anim->timer = 0;
	ldhl	sp,#8
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
00102$:
;C:/gbdk/ZGB/common/src/BkgAnimation.c:27: if (anim->frame == anim->frames) anim->frame = 0;
	ldhl	sp,#(5 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	inc	hl
	ld	(hl),a
	pop	de
	push	de
	ld	hl,#0x0005
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ldhl	sp,#6
	ld	a,(hl)
	sub	a, c
	jr	NZ,00104$
	ldhl	sp,#4
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x00
00104$:
;C:/gbdk/ZGB/common/src/BkgAnimation.c:28: anim->timer++;
	ldhl	sp,#(9 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	inc	bc
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
	add	sp, #12
	ret
;C:/gbdk/ZGB/common/src/BkgAnimation.c:34: void LOAD_TILE_ANIM(TILE_ANIMATION* anim, UINT8 tiles, UINT8 frames, unsigned char *map, UINT8 bank)
;	---------------------------------
; Function LOAD_TILE_ANIM
; ---------------------------------
_LOAD_TILE_ANIM::
	add	sp, #-2
;C:/gbdk/ZGB/common/src/BkgAnimation.c:37: anim->frame = 0;
	ldhl	sp,#4
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
	pop	hl
	push	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/BkgAnimation.c:38: anim->frames = frames;
	pop	bc
	push	bc
	inc	bc
	inc	bc
	ldhl	sp,#7
	ld	a,(hl)
	ld	(bc),a
;C:/gbdk/ZGB/common/src/BkgAnimation.c:39: anim->timer = 0;
	pop	de
	push	de
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x00
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
;C:/gbdk/ZGB/common/src/BkgAnimation.c:40: anim->tiles = tiles;
	pop	bc
	push	bc
	inc	bc
	inc	bc
	inc	bc
	ldhl	sp,#6
	ld	a,(hl)
	ld	(bc),a
;C:/gbdk/ZGB/common/src/BkgAnimation.c:41: anim->bank = bank;
	pop	de
	push	de
	ld	hl,#0x0009
	add	hl,de
	ld	c,l
	ld	b,h
	ldhl	sp,#10
	ld	a,(hl)
	ld	(bc),a
;C:/gbdk/ZGB/common/src/BkgAnimation.c:42: PUSH_BANK(bank);
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/BkgAnimation.c:43: anim->map = map;
	pop	de
	push	de
	ld	hl,#0x0007
	add	hl,de
	ld	c,l
	ld	b,h
	ldhl	sp,#8
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;C:/gbdk/ZGB/common/src/BkgAnimation.c:44: POP_BANK;
	call	_PopBank
	add	sp, #2
	ret
;C:/gbdk/ZGB/common/src/BkgAnimation.c:47: void TILE_ANIMATE(TILE_ANIMATION* anim, UINT8 tile, UINT8 speed)
;	---------------------------------
; Function TILE_ANIMATE
; ---------------------------------
_TILE_ANIMATE::
	add	sp, #-9
;C:/gbdk/ZGB/common/src/BkgAnimation.c:50: if (anim->timer == speed){
	ldhl	sp,#11
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#6
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#4
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
	ldhl	sp,#14
	ld	e,(hl)
	ld	d,#0x00
	ld	a,c
	sub	a, e
	jp	NZ,00102$
	ld	a,b
	sub	a, d
	jp	NZ,00102$
;C:/gbdk/ZGB/common/src/BkgAnimation.c:51: PUSH_BANK(anim->bank);
	ldhl	sp,#(7 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0009
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	b,a
	push	bc
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/BkgAnimation.c:52: set_bkg_data(tile, anim->tiles, ((UINT16 *)anim->map) + (anim->frame<<3*anim->tiles));
	ldhl	sp,#(7 - 1)
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
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ldhl	sp,#2
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ldhl	sp,#(7 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#0
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#(7 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	inc	hl
	ld	(hl),a
	ld	c,(hl)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	a,c
	push	af
	ldhl	sp,#2
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	pop	af
	inc	a
	jr	00118$
00117$:
	sla	c
	rl	b
00118$:
	dec	a
	jr	NZ,00117$
	sla	c
	rl	b
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	push	bc
	ldhl	sp,#10
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#16
	ld	a,(hl)
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;C:/gbdk/ZGB/common/src/BkgAnimation.c:53: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/BkgAnimation.c:54: anim->frame++; 
	ldhl	sp,#(7 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	inc	bc
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/BkgAnimation.c:55: anim->timer = 0;
	ldhl	sp,#4
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
00102$:
;C:/gbdk/ZGB/common/src/BkgAnimation.c:57: if (anim->frame == anim->frames) anim->frame = 0;
	ldhl	sp,#(7 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#0
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#(7 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#0
	ld	a,(hl)
	sub	a, c
	jr	NZ,00104$
	inc	hl
	ld	a,(hl)
	sub	a, b
	jr	NZ,00104$
	ldhl	sp,#6
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
00104$:
;C:/gbdk/ZGB/common/src/BkgAnimation.c:58: anim->timer++;
	ldhl	sp,#(5 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	inc	bc
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
	add	sp, #9
	ret
;C:/gbdk/ZGB/common/src/BkgAnimation.c:62: void BKG_EDIT_TILE(UINT8 x, UINT8 y, UINT8 number){
;	---------------------------------
; Function BKG_EDIT_TILE
; ---------------------------------
_BKG_EDIT_TILE::
;C:/gbdk/ZGB/common/src/BkgAnimation.c:63: set_bkg_tiles(x,y,1,1,&number);
	ldhl	sp,#4
	ld	c,l
	ld	b,h
	push	bc
	ld	hl,#0x0101
	push	hl
	ldhl	sp,#7
	ld	a,(hl)
	push	af
	inc	sp
	dec	hl
	ld	a,(hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	ret
;C:/gbdk/ZGB/common/src/BkgAnimation.c:65: void WIN_EDIT_TILE(UINT8 x, UINT8 y, UINT8 number){
;	---------------------------------
; Function WIN_EDIT_TILE
; ---------------------------------
_WIN_EDIT_TILE::
;C:/gbdk/ZGB/common/src/BkgAnimation.c:66: set_win_tiles(x,y,1,1,&number);
	ldhl	sp,#4
	ld	c,l
	ld	b,h
	push	bc
	ld	hl,#0x0101
	push	hl
	ldhl	sp,#7
	ld	a,(hl)
	push	af
	inc	sp
	dec	hl
	ld	a,(hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
	ret
;C:/gbdk/ZGB/common/src/BkgAnimation.c:154: void BKG_COLLECT_ITEM(UINT16 first_tile, UINT8 tiles, UINT8 color){
;	---------------------------------
; Function BKG_COLLECT_ITEM
; ---------------------------------
_BKG_COLLECT_ITEM::
;C:/gbdk/ZGB/common/src/BkgAnimation.c:155: set_bkg_data(first_tile, tiles,NULL_TILE[color]);
	ldhl	sp,#5
	ld	c,(hl)
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_NULL_TILE
	add	hl,bc
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
	ld	d,(hl)
	push	bc
	inc	hl
	inc	hl
	ld	a,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_set_bkg_data
	add	sp, #4
	ret
_c0:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_c1:
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
_c2:
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
_c3:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.area _CODE
	.area _CABS (ABS)
