;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module StateLevel1
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Update_STATE_LEVEL1
	.globl _Start_STATE_LEVEL1
	.globl _CP_LoadMusic
	.globl _TILE_ANIMATE
	.globl _LOAD_TILE_ANIM
	.globl _SpriteManagerAdd
	.globl _SpriteManagerLoad
	.globl _Move_Parallax
	.globl _Set_Parallax
	.globl _InitWindow
	.globl _InitScroll
	.globl _ZInitScrollTilesColor
	.globl _SetPalette
	.globl _SetState
	.globl _Level
	.globl _bank_STATE_LEVEL1
	.globl _playerPAL
	.globl _tiles_level1PAL
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_LEVEL1::
	.ds 1
_Level::
	.ds 1
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
;StateLevel1.c:6: UINT8 bank_STATE_LEVEL1 = 4;
	ld	hl,#_bank_STATE_LEVEL1
	ld	(hl),#0x04
;StateLevel1.c:33: UINT8 Level = 0;
	ld	hl,#_Level
	ld	(hl),#0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_4
;StateLevel1.c:41: void Start_STATE_LEVEL1() {
;	---------------------------------
; Function Start_STATE_LEVEL1
; ---------------------------------
_Start_STATE_LEVEL1::
	add	sp, #-19
;StateLevel1.c:43: const UINT8 collision_tiles[] = {1,2,3,4,5,6,7,8,9,10,11,12,36,37,38,39,0};
	ldhl	sp,#0
	ld	a,l
	ld	d,h
	ldhl	sp,#17
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x01
	ldhl	sp,#(18 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	ld	a,#0x02
	ld	(bc),a
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	ld	a,#0x03
	ld	(bc),a
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	inc	bc
	ld	a,#0x04
	ld	(bc),a
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x05
	ld	(bc),a
	ldhl	sp,#(18 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0005
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x06
	ld	(bc),a
	ldhl	sp,#(18 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0006
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x07
	ld	(bc),a
	ldhl	sp,#(18 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0007
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x08
	ld	(bc),a
	ldhl	sp,#(18 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0008
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x09
	ld	(bc),a
	ldhl	sp,#(18 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0009
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x0a
	ld	(bc),a
	ldhl	sp,#(18 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000a
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x0b
	ld	(bc),a
	ldhl	sp,#(18 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000b
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x0c
	ld	(bc),a
	ldhl	sp,#(18 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000c
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x24
	ld	(bc),a
	ldhl	sp,#(18 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000d
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x25
	ld	(bc),a
	ldhl	sp,#(18 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000e
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x26
	ld	(bc),a
	ldhl	sp,#(18 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000f
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x27
	ld	(bc),a
	ldhl	sp,#(18 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0010
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;StateLevel1.c:45: CP_LoadMusic(6,2);
	ld	hl,#0x0206
	push	hl
	call	_CP_LoadMusic
	add	sp, #2
;StateLevel1.c:46: ZGB_Parallax = 1;
	ld	hl,#_ZGB_Parallax
	ld	(hl),#0x01
;StateLevel1.c:47: SPRITES_8x16;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	2, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateLevel1.c:48: for(i = 0; i != N_SPRITE_TYPES; ++ i) {
	ld	b,#0x00
00102$:
;StateLevel1.c:49: SpriteManagerLoad(i);
	push	bc
	push	bc
	inc	sp
	call	_SpriteManagerLoad
	inc	sp
	pop	bc
;StateLevel1.c:48: for(i = 0; i != N_SPRITE_TYPES; ++ i) {
	inc	b
	ld	a,b
	sub	a, #0x06
	jr	NZ,00102$
;StateLevel1.c:51: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateLevel1.c:53: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 35*8,42*8);//58*8, 58*8);
	ld	hl,#0x0150
	push	hl
	ld	l, #0x18
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
	ld	hl,#_scroll_target
	ld	(hl),e
	inc	hl
	ld	(hl),d
;StateLevel1.c:55: InitScrollTiles(0, 255, tiles_level1, 4);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x04
	push	af
	inc	sp
	ld	hl,#_tiles_level1
	push	hl
	ld	hl,#0xff00
	push	hl
	call	_ZInitScrollTilesColor
	add	sp, #7
;StateLevel1.c:56: InitScroll(map_level0Width, map_level0Height, map_level0PLN0, collision_tiles, 0, 5,map_level0PLN1);
	ld	de,#_map_level0PLN1+0
	ldhl	sp,#(18 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	de
	ld	a,#0x05
	push	af
	inc	sp
	ld	hl,#0x0000
	push	hl
	push	bc
	ld	hl,#_map_level0PLN0
	push	hl
	ld	hl,#0x0030
	push	hl
	ld	l, #0x30
	push	hl
	call	_InitScroll
	add	sp, #13
;StateLevel1.c:58: SetPalette(tiles_level1PAL,playerPAL,4);
	ld	a,#0x04
	push	af
	inc	sp
	ld	hl,#_playerPAL
	push	hl
	ld	hl,#_tiles_level1PAL
	push	hl
	call	_SetPalette
	add	sp, #5
;StateLevel1.c:60: InitWindow(0, 0, win_level1Width, win_level1Height, win_level1PLN0, 4, win_level1PLN1);
	ld	hl,#_win_level1PLN1
	push	hl
	ld	a,#0x04
	push	af
	inc	sp
	ld	hl,#_win_level1PLN0
	push	hl
	ld	hl,#0x0314
	push	hl
	ld	hl,#0x0000
	push	hl
	call	_InitWindow
	add	sp, #9
;StateLevel1.c:61: WY_REG = 16*8;
	ld	hl,#0xff4a
	ld	(hl),#0x80
;StateLevel1.c:62: SHOW_BKG;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	0, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;StateLevel1.c:63: SHOW_WIN;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	5, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;StateLevel1.c:65: INIT_FONT(font, 3, PRINT_WIN);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_font
	push	hl
	ld	hl,#0x2dd2
	push	hl
	call	_ZInitScrollTilesColor
	add	sp, #7
	ld	hl,#_font_idx
	ld	(hl),#0xd2
	ld	hl,#_print_target
	ld	(hl),#0x01
;StateLevel1.c:67: LOAD_TILE_ANIM(&Tile_items[0], 1, 8, level_anim_hconv, 3);
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_level_anim_hconv
	push	hl
	ld	hl,#0x0801
	push	hl
	ld	hl,#_Tile_items
	push	hl
	call	_LOAD_TILE_ANIM
	add	sp, #7
;StateLevel1.c:68: LOAD_TILE_ANIM(&Tile_items[1], 1, 8, level_anim_vconv, 3);	
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_level_anim_vconv
	push	hl
	ld	hl,#0x0801
	push	hl
	ld	hl,#(_Tile_items + 0x000a)
	push	hl
	call	_LOAD_TILE_ANIM
	add	sp, #7
;StateLevel1.c:69: SpriteManagerAdd(SPRITE_POINTER, 0, 0);
	ld	hl,#0x0000
	push	hl
	ld	l, #0x00
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateLevel1.c:70: Set_Parallax(level1_parallaxtiles,7);
	ld	a,#0x07
	push	af
	inc	sp
	ld	hl,#_level1_parallaxtiles
	push	hl
	call	_Set_Parallax
	add	sp, #3
	add	sp, #19
	ret
_tiles_level1PAL:
	.dw #0x7c42
	.dw #0x7b5a
	.dw #0x79d0
	.dw #0x5c03
	.dw #0x7b5e
	.dw #0x713f
	.dw #0x4c12
	.dw #0x0000
	.dw #0x53d5
	.dw #0x0382
	.dw #0x0561
	.dw #0x0481
	.dw #0x6739
	.dw #0x23ea
	.dw #0x05c1
	.dw #0x294a
	.dw #0x7fdd
	.dw #0x3b3e
	.dw #0x017f
	.dw #0x0000
	.dw #0x7bb6
	.dw #0x7f82
	.dw #0x5e20
	.dw #0x0000
	.dw #0x7c42
	.dw #0x7b7b
	.dw #0x201f
	.dw #0x1021
	.dw #0x7b5e
	.dw #0x7f86
	.dw #0x4c12
	.dw #0x0000
_playerPAL:
	.dw #0x7fff
	.dw #0x7fff
	.dw #0x5ad6
	.dw #0x0000
	.dw #0x4021
	.dw #0x043f
	.dw #0x0052
	.dw #0x0000
	.dw #0x4021
	.dw #0x23e9
	.dw #0x0620
	.dw #0x0000
	.dw #0x4021
	.dw #0x23fd
	.dw #0x02d4
	.dw #0x0000
	.dw #0x4021
	.dw #0x7f09
	.dw #0x17fe
	.dw #0x0000
	.dw #0x4021
	.dw #0x7f09
	.dw #0x043f
	.dw #0x0000
	.dw #0x4021
	.dw #0x7f09
	.dw #0x7c5f
	.dw #0x0000
	.dw #0x4421
	.dw #0x7fff
	.dw #0x00df
	.dw #0x0000
;StateLevel1.c:73: void Update_STATE_LEVEL1() {
;	---------------------------------
; Function Update_STATE_LEVEL1
; ---------------------------------
_Update_STATE_LEVEL1::
;StateLevel1.c:74: Move_Parallax();
	call	_Move_Parallax
;StateLevel1.c:75: TILE_ANIMATE(&Tile_items[0], 40, 3);
	ld	hl,#0x0328
	push	hl
	ld	hl,#_Tile_items
	push	hl
	call	_TILE_ANIMATE
	add	sp, #4
;StateLevel1.c:76: TILE_ANIMATE(&Tile_items[1], 42, 3);	
	ld	hl,#0x032a
	push	hl
	ld	hl,#(_Tile_items + 0x000a)
	push	hl
	call	_TILE_ANIMATE
	add	sp, #4
;StateLevel1.c:78: if (KEY_PRESSED(J_SELECT)) {
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	6, c
	ret	Z
;StateLevel1.c:79: Menu_Mode = 2;
	ld	hl,#_Menu_Mode
	ld	(hl),#0x02
;StateLevel1.c:80: SetState(STATE_MENU);
	xor	a, a
	push	af
	inc	sp
	call	_SetState
	inc	sp
	ret
	.area _CODE_4
	.area _CABS (ABS)
