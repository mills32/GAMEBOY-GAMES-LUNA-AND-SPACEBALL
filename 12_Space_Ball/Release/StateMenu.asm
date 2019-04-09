;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module StateMenu
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Update_STATE_MENU
	.globl _Start_STATE_MENU
	.globl _change_menu_settings
	.globl _CP_LoadMusic
	.globl _TILE_ANIMATE
	.globl _LOAD_TILE_ANIM
	.globl _MAP_ANIMATE
	.globl _LOAD_MAP_ANIM
	.globl _SpriteManagerAdd
	.globl _SpriteManagerLoad
	.globl _MoveScroll
	.globl _InitScroll
	.globl _ZInitScrollTilesColor
	.globl _SetPalette
	.globl _set_bkg_tiles
	.globl _Settings_Op
	.globl _M
	.globl _Tile_items
	.globl _Bkg_items
	.globl _Activate_Parallax
	.globl _Menu_Mode
	.globl _bank_STATE_MENU
	.globl _shipsPAL
	.globl _tiles_menuPAL
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_MENU::
	.ds 1
_Menu_Mode::
	.ds 1
_Activate_Parallax::
	.ds 1
_Bkg_items::
	.ds 26
_Tile_items::
	.ds 20
_M::
	.ds 2
_Settings_Op::
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
;StateMenu.c:6: UINT8 bank_STATE_MENU = 2;
	ld	hl,#_bank_STATE_MENU
	ld	(hl),#0x02
;StateMenu.c:34: UINT8 Menu_Mode = 0;
	ld	hl,#_Menu_Mode
	ld	(hl),#0x00
;StateMenu.c:35: UINT8 Activate_Parallax = 0;
	ld	hl,#_Activate_Parallax
	ld	(hl),#0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_2
;StateMenu.c:46: void change_menu_settings(UINT8 op, UINT8 set){
;	---------------------------------
; Function change_menu_settings
; ---------------------------------
_change_menu_settings::
;StateMenu.c:47: set_bkg_tiles(24,op,8,1,map_menu_anim_settings+set);
	ld	de,#_map_menu_anim_settings
	ldhl	sp,#3
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	push	bc
	push	de
	ld	hl,#0x0108
	push	hl
	ldhl	sp,#8
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,#0x18
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	pop	bc
;StateMenu.c:48: set_bkg_tiles(0,op,4,1,map_menu_anim_settings+set+4);
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	push	bc
	ld	hl,#0x0104
	push	hl
	ldhl	sp,#6
	ld	a,(hl)
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	ret
_tiles_menuPAL:
	.dw #0x7fff
	.dw #0x4e73
	.dw #0x294a
	.dw #0x0000
	.dw #0x7fff
	.dw #0x211f
	.dw #0x0011
	.dw #0x0000
	.dw #0x4c02
	.dw #0x7fff
	.dw #0x35ad
	.dw #0x0000
	.dw #0x4c02
	.dw #0x37ed
	.dw #0x0e20
	.dw #0x0000
	.dw #0x4c02
	.dw #0x7ab3
	.dw #0x7d66
	.dw #0x0000
	.dw #0x4c02
	.dw #0x721e
	.dw #0x0e20
	.dw #0x0000
	.dw #0x4c02
	.dw #0x5ad6
	.dw #0x001f
	.dw #0x0000
	.dw #0x4c02
	.dw #0x269f
	.dw #0x0177
	.dw #0x0000
_shipsPAL:
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
;StateMenu.c:51: void Start_STATE_MENU() {
;	---------------------------------
; Function Start_STATE_MENU
; ---------------------------------
_Start_STATE_MENU::
;StateMenu.c:54: HIDE_WIN;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	res	5, c
	ld	b,#0x00
	ld	hl,#0xff40
	ld	(hl),c
;StateMenu.c:56: ZGB_Parallax = 0;
	ld	hl,#_ZGB_Parallax
	ld	(hl),#0x00
;StateMenu.c:58: SPRITES_8x16;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	2, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateMenu.c:59: for(i = 0; i != N_SPRITE_TYPES; ++ i) {
	ld	bc,#0x0000
00108$:
;StateMenu.c:60: SpriteManagerLoad(i);
	ld	d,c
	push	bc
	push	de
	inc	sp
	call	_SpriteManagerLoad
	inc	sp
	pop	bc
;StateMenu.c:59: for(i = 0; i != N_SPRITE_TYPES; ++ i) {
	inc	bc
	ld	a,c
	sub	a, #0x06
	jr	NZ,00108$
	ld	a,b
	or	a, a
	jr	NZ,00108$
;StateMenu.c:62: SHOW_SPRITES; 
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateMenu.c:64: SetPalette(tiles_menuPAL, shipsPAL, 2);
	ld	a,#0x02
	push	af
	inc	sp
	ld	hl,#_shipsPAL
	push	hl
	ld	hl,#_tiles_menuPAL
	push	hl
	call	_SetPalette
	add	sp, #5
;StateMenu.c:66: InitScrollTiles(0, 256, tiles_menu, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_tiles_menu
	push	hl
	ld	hl,#0x0000
	push	hl
	call	_ZInitScrollTilesColor
	add	sp, #7
;StateMenu.c:67: if (Menu_Mode == 0)InitScroll(map_plogoWidth, map_plogoHeight, map_plogoPLN0, 0, 0, 2, map_plogoPLN1);
	ld	hl,#_Menu_Mode
	ld	a,(hl)
	or	a, a
	jr	NZ,00103$
	ld	hl,#_map_plogoPLN1
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	ld	hl,#0x0000
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl,#_map_plogoPLN0
	push	hl
	ld	hl,#0x0012
	push	hl
	ld	l, #0x14
	push	hl
	call	_InitScroll
	add	sp, #13
00103$:
;StateMenu.c:68: if (Menu_Mode == 2){
	ld	hl,#_Menu_Mode
	ld	a,(hl)
	sub	a, #0x02
	jr	NZ,00105$
;StateMenu.c:69: CP_LoadMusic(6,1);
	ld	hl,#0x0106
	push	hl
	call	_CP_LoadMusic
	add	sp, #2
;StateMenu.c:70: InitScroll(map_menuWidth, map_menuHeight, map_menuPLN0, 0, 0, 3, map_menuPLN1);
	ld	hl,#_map_menuPLN1
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#0x0000
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl,#_map_menuPLN0
	push	hl
	ld	hl,#0x0024
	push	hl
	ld	l, #0x28
	push	hl
	call	_InitScroll
	add	sp, #13
00105$:
;StateMenu.c:73: SHOW_BKG;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	0, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateMenu.c:76: LOAD_MAP_ANIM(&Bkg_items[0],3, 3, 4, map_menu_anim_asteroid, 3);
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_map_menu_anim_asteroid
	push	hl
	ld	hl,#0x0403
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_Bkg_items
	push	hl
	call	_LOAD_MAP_ANIM
	add	sp, #8
;StateMenu.c:77: LOAD_MAP_ANIM(&Bkg_items[1], 2, 3, 4, map_menu_anim_ball, 3);
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_map_menu_anim_ball
	push	hl
	ld	hl,#0x0403
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	ld	hl,#(_Bkg_items + 0x000d)
	push	hl
	call	_LOAD_MAP_ANIM
	add	sp, #8
;StateMenu.c:79: LOAD_TILE_ANIM(&Tile_items[0], 1, 4, tile_menu_anim_star, 3);
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_tile_menu_anim_star
	push	hl
	ld	hl,#0x0401
	push	hl
	ld	hl,#_Tile_items
	push	hl
	call	_LOAD_TILE_ANIM
	add	sp, #7
;StateMenu.c:80: LOAD_TILE_ANIM(&Tile_items[1], 1, 4, tile_menu_anim_star2, 3);	
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_tile_menu_anim_star2
	push	hl
	ld	hl,#0x0401
	push	hl
	ld	hl,#(_Tile_items + 0x000a)
	push	hl
	call	_LOAD_TILE_ANIM
	add	sp, #7
;StateMenu.c:82: if (Menu_Mode == 0) CP_LoadMusic(6,0);
	ld	hl,#_Menu_Mode
	ld	a,(hl)
	or	a, a
	jr	NZ,00107$
	ld	hl,#0x0006
	push	hl
	call	_CP_LoadMusic
	add	sp, #2
00107$:
;StateMenu.c:83: M = 0;
	ld	hl,#_M
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;StateMenu.c:84: Settings_Op = 0;
	ld	hl,#_Settings_Op
	ld	(hl),#0x00
	ret
;StateMenu.c:87: void Update_STATE_MENU() {
;	---------------------------------
; Function Update_STATE_MENU
; ---------------------------------
_Update_STATE_MENU::
;StateMenu.c:89: TILE_ANIMATE(&Tile_items[0], 100, 8);
	ld	hl,#0x0864
	push	hl
	ld	hl,#_Tile_items
	push	hl
	call	_TILE_ANIMATE
	add	sp, #4
;StateMenu.c:90: TILE_ANIMATE(&Tile_items[1], 98, 5);	
	ld	hl,#0x0562
	push	hl
	ld	hl,#(_Tile_items + 0x000a)
	push	hl
	call	_TILE_ANIMATE
	add	sp, #4
;StateMenu.c:91: switch (Menu_Mode){
	ld	a,#0x0a
	ld	hl,#_Menu_Mode
	sub	a, (hl)
	ret	C
	ld	e,(hl)
	ld	d,#0x00
	ld	hl,#00210$
	add	hl,de
	add	hl,de
	add	hl,de
	jp	(hl)
00210$:
	jp	00101$
	jp	00104$
	jp	00107$
	jp	00108$
	jp	00109$
	jp	00110$
	jp	00113$
	jp	00114$
	jp	00117$
	jp	00135$
	jp	00138$
;StateMenu.c:92: case 0:
00101$:
;StateMenu.c:93: if(M == 250){
	ld	hl,#_M
	ld	a,(hl)
	sub	a, #0xfa
	jr	NZ,00103$
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	NZ,00103$
;StateMenu.c:94: InitScroll(map_flogoWidth, map_flogoHeight, map_flogoPLN0, 0, 0, 3, map_flogoPLN1);
	ld	hl,#_map_flogoPLN1
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#0x0000
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl,#_map_flogoPLN0
	push	hl
	ld	hl,#0x0012
	push	hl
	ld	l, #0x14
	push	hl
	call	_InitScroll
	add	sp, #13
;StateMenu.c:95: Menu_Mode = 1;
	ld	hl,#_Menu_Mode
	ld	(hl),#0x01
;StateMenu.c:96: CP_LoadMusic(6,1);
	ld	hl,#0x0106
	push	hl
	call	_CP_LoadMusic
	add	sp, #2
00103$:
;StateMenu.c:98: M++;
	ld	hl,#_M
	inc	(hl)
	ret	NZ
	inc	hl
	inc	(hl)
;StateMenu.c:99: break;
	ret
;StateMenu.c:100: case 1:
00104$:
;StateMenu.c:101: if(KEY_PRESSED(J_START)) {M = 0; Menu_Mode = 2;}
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	7, c
	ret	Z
	ld	hl,#_M
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#_Menu_Mode
	ld	(hl),#0x02
;StateMenu.c:102: break;
	ret
;StateMenu.c:103: case 2: // To Main Menu
00107$:
;StateMenu.c:104: InitScroll(map_menuWidth, map_menuHeight, map_menuPLN0, 0, 0, 3, map_menuPLN1);
	ld	hl,#_map_menuPLN1
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#0x0000
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl,#_map_menuPLN0
	push	hl
	ld	hl,#0x0024
	push	hl
	ld	l, #0x28
	push	hl
	call	_InitScroll
	add	sp, #13
;StateMenu.c:105: SpriteManagerAdd(SPRITE_SHIP, 160+16, 3*8);
	ld	hl,#0x0018
	push	hl
	ld	l, #0xb0
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:106: SpriteManagerAdd(SPRITE_UFO, -16, 10*8);
	ld	hl,#0x0050
	push	hl
	ld	hl,#0xfff0
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:107: SpriteManagerAdd(SPRITE_ARROW, 80, 80);
	ld	hl,#0x0050
	push	hl
	ld	l, #0x50
	push	hl
	ld	a,#0x04
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:108: Menu_Mode = 3;
	ld	hl,#_Menu_Mode
	ld	(hl),#0x03
;StateMenu.c:109: break;
	ret
;StateMenu.c:111: case 3: //Main Menu
00108$:
;StateMenu.c:114: MAP_ANIMATE(&Bkg_items[0], 14, 2, 8);
	ld	hl,#0x0802
	push	hl
	ld	a,#0x0e
	push	af
	inc	sp
	ld	hl,#_Bkg_items
	push	hl
	call	_MAP_ANIMATE
	add	sp, #5
;StateMenu.c:115: MAP_ANIMATE(&Bkg_items[1], 8, 10, 20);
	ld	hl,#0x140a
	push	hl
	ld	a,#0x08
	push	af
	inc	sp
	ld	hl,#(_Bkg_items + 0x000d)
	push	hl
	call	_MAP_ANIMATE
	add	sp, #5
;StateMenu.c:119: break;
	ret
;StateMenu.c:121: case 4: //Scroll to info	
00109$:
;StateMenu.c:122: InitScroll(map_menuWidth, map_menuHeight, map_menuPLN0+(40*18), 0, 0, 3, map_menuPLN1+(40*9));
	ld	hl,#(_map_menuPLN1 + 0x0168)
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#0x0000
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl,#(_map_menuPLN0 + 0x02d0)
	push	hl
	ld	hl,#0x0024
	push	hl
	ld	l, #0x28
	push	hl
	call	_InitScroll
	add	sp, #13
;StateMenu.c:123: Menu_Mode = 5;
	ld	hl,#_Menu_Mode
	ld	(hl),#0x05
;StateMenu.c:124: break;
	ret
;StateMenu.c:125: case 5: //Info
00110$:
;StateMenu.c:126: if(KEY_PRESSED(J_B))Menu_Mode = 6;
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	5, c
	jr	Z,00112$
	ld	hl,#_Menu_Mode
	ld	(hl),#0x06
00112$:
;StateMenu.c:129: MAP_ANIMATE(&Bkg_items[0], 0, 14, 8);
	ld	hl,#0x080e
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	hl,#_Bkg_items
	push	hl
	call	_MAP_ANIMATE
	add	sp, #5
;StateMenu.c:130: MAP_ANIMATE(&Bkg_items[1], 1, 7, 20);			
	ld	hl,#0x1407
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	ld	hl,#(_Bkg_items + 0x000d)
	push	hl
	call	_MAP_ANIMATE
	add	sp, #5
;StateMenu.c:131: break;
	ret
;StateMenu.c:132: case 6: //Back to Main
00113$:
;StateMenu.c:133: SpriteManagerAdd(SPRITE_ARROW, 80, 80);
	ld	hl,#0x0050
	push	hl
	ld	l, #0x50
	push	hl
	ld	a,#0x04
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:134: InitScroll(map_menuWidth, map_menuHeight, map_menuPLN0, 0, 0, 3, map_menuPLN1);
	ld	hl,#_map_menuPLN1
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#0x0000
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl,#_map_menuPLN0
	push	hl
	ld	hl,#0x0024
	push	hl
	ld	l, #0x28
	push	hl
	call	_InitScroll
	add	sp, #13
;StateMenu.c:135: Menu_Mode = 3;
	ld	hl,#_Menu_Mode
	ld	(hl),#0x03
;StateMenu.c:136: break;
	ret
;StateMenu.c:138: case 7: //Scroll to settings
00114$:
;StateMenu.c:139: if (M == 20*8) Menu_Mode = 8;
	ld	hl,#_M
	ld	a,(hl)
	sub	a, #0xa0
	jr	NZ,00116$
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	NZ,00116$
	ld	hl,#_Menu_Mode
	ld	(hl),#0x08
00116$:
;StateMenu.c:140: MoveScroll(M,0);
	ld	hl,#0x0000
	push	hl
	ld	hl,#_M
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_MoveScroll
	add	sp, #4
;StateMenu.c:141: M++; 			
	ld	hl,#_M
	inc	(hl)
	ret	NZ
	inc	hl
	inc	(hl)
;StateMenu.c:142: break;
	ret
;StateMenu.c:143: case 8: //settings
00117$:
;StateMenu.c:144: if(KEY_TICKED(J_B))Menu_Mode = 9;
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	5, c
	jr	Z,00119$
	ld	hl,#_previous_keys
	ld	e,(hl)
	ld	d,#0x00
	bit	5, e
	jr	NZ,00119$
	ld	hl,#_Menu_Mode
	ld	(hl),#0x09
00119$:
;StateMenu.c:145: if(Settings_Op > 6*8) Settings_Op=0;
	ld	a,#0x30
	ld	hl,#_Settings_Op
	sub	a, (hl)
	jr	NC,00122$
	ld	(hl),#0x00
00122$:
;StateMenu.c:147: if(KEY_TICKED(J_DOWN)){change_menu_settings(7, Settings_Op+12);Settings_Op+=6;}
	bit	3, c
	jr	Z,00124$
	ld	hl,#_previous_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	3, c
	jr	NZ,00124$
	ld	hl,#_Settings_Op
	ld	a,(hl)
	add	a, #0x0c
	ld	b,a
	push	bc
	inc	sp
	ld	a,#0x07
	push	af
	inc	sp
	call	_change_menu_settings
	add	sp, #2
	ld	hl,#_Settings_Op
	ld	a,(hl)
	add	a, #0x06
	ld	(hl),a
00124$:
;StateMenu.c:148: if(KEY_TICKED(J_UP)){change_menu_settings(7, Settings_Op+12);Settings_Op-=6;}		
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	2, c
	jr	Z,00127$
	ld	hl,#_previous_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	2, c
	jr	NZ,00127$
	ld	hl,#_Settings_Op
	ld	a,(hl)
	add	a, #0x0c
	ld	b,a
	push	bc
	inc	sp
	ld	a,#0x07
	push	af
	inc	sp
	call	_change_menu_settings
	add	sp, #2
	ld	hl,#_Settings_Op
	ld	a,(hl)
	add	a,#0xfa
	ld	(hl),a
00127$:
;StateMenu.c:150: if(KEY_TICKED(J_LEFT)) change_menu_settings(10, 0);
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	1, c
	jr	Z,00130$
	ld	hl,#_previous_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	1, c
	jr	NZ,00130$
	ld	hl,#0x000a
	push	hl
	call	_change_menu_settings
	add	sp, #2
00130$:
;StateMenu.c:151: if(KEY_TICKED(J_RIGHT)) change_menu_settings(10, 6);	
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	0, c
	jr	Z,00133$
	ld	hl,#_previous_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	0, c
	jr	NZ,00133$
	ld	hl,#0x060a
	push	hl
	call	_change_menu_settings
	add	sp, #2
00133$:
;StateMenu.c:154: MAP_ANIMATE(&Bkg_items[1], 5, 13, 8);	
	ld	hl,#0x080d
	push	hl
	ld	a,#0x05
	push	af
	inc	sp
	ld	hl,#(_Bkg_items + 0x000d)
	push	hl
	call	_MAP_ANIMATE
	add	sp, #5
;StateMenu.c:155: break;
	ret
;StateMenu.c:156: case 9: //Back to Main
00135$:
;StateMenu.c:157: if (M == 0){
	ld	hl,#_M + 1
	ld	a,(hl-)
	or	a,(hl)
	jr	NZ,00137$
;StateMenu.c:158: Menu_Mode = 3;
	ld	hl,#_Menu_Mode
	ld	(hl),#0x03
;StateMenu.c:159: SpriteManagerAdd(SPRITE_UFO, -16, 3*8);
	ld	hl,#0x0018
	push	hl
	ld	hl,#0xfff0
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:160: SpriteManagerAdd(SPRITE_SHIP, 160+16, 10*8);
	ld	hl,#0x0050
	push	hl
	ld	l, #0xb0
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:161: SpriteManagerAdd(SPRITE_ARROW, 80, 80);
	ld	hl,#0x0050
	push	hl
	ld	l, #0x50
	push	hl
	ld	a,#0x04
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00137$:
;StateMenu.c:163: MoveScroll(M,0);
	ld	hl,#0x0000
	push	hl
	ld	hl,#_M
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_MoveScroll
	add	sp, #4
;StateMenu.c:164: M--; 			
	ld	hl,#_M + 1
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	dec	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;StateMenu.c:165: break;	
	ret
;StateMenu.c:166: case 10:
00138$:
;StateMenu.c:167: SCX_REG++;
	ld	hl,#0xff43
	ld	(hl),#0x44
;StateMenu.c:169: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
