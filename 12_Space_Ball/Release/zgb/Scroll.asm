;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module Scroll
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Update_Parallax
	.globl _ScrollUpdateColumnWithDelay
	.globl _ScrollUpdateColumnR
	.globl _ScrollUpdateRowWithDelay
	.globl _ScrollUpdateRowR
	.globl _ClampScrollLimits
	.globl _UPDATE_TILE
	.globl _ZGB_SET_TILE
	.globl _GetTileReplacement
	.globl _PopBank
	.globl _PushBank
	.globl _SpriteManagerAdd
	.globl _set_win_tiles
	.globl _set_bkg_data
	.globl _ZGB_Parallax
	.globl _clamp_enabled
	.globl _scroll_h_border
	.globl _current_vbl_count
	.globl _pending_w_i
	.globl _pending_w_y
	.globl _pending_w_x
	.globl _pending_w_map
	.globl _pending_h_map
	.globl _pending_h_i
	.globl _pending_h_y
	.globl _pending_h_x
	.globl _scroll_offset_y
	.globl _scroll_offset_x
	.globl _scroll_bank
	.globl _scroll_tile_info
	.globl _scroll_collisions_down
	.globl _scroll_collisions
	.globl _scroll_target_offset_y
	.globl _scroll_target_offset_x
	.globl _scroll_target
	.globl _scroll_tiles_h
	.globl _scroll_tiles_w
	.globl _scroll_h
	.globl _scroll_w
	.globl _scroll_y
	.globl _scroll_x
	.globl _scroll_cmap
	.globl _scroll_map
	.globl _ZInitScrollTilesColor
	.globl _InitWindow
	.globl _ScrollSetMap
	.globl _InitScroll
	.globl _ScrollUpdateRow
	.globl _ScrollUpdateColumn
	.globl _RefreshScroll
	.globl _MoveScroll
	.globl _GetScrollTilePtr
	.globl _GetScrollTile
	.globl _ScrollFindTile
	.globl _EditCollision
	.globl _EditCollisionDown
	.globl _Set_Parallax
	.globl _Move_Parallax
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_scroll_map::
	.ds 2
_scroll_cmap::
	.ds 2
_scroll_x::
	.ds 2
_scroll_y::
	.ds 2
_scroll_w::
	.ds 2
_scroll_h::
	.ds 2
_scroll_tiles_w::
	.ds 2
_scroll_tiles_h::
	.ds 2
_scroll_target::
	.ds 2
_scroll_target_offset_x::
	.ds 2
_scroll_target_offset_y::
	.ds 2
_scroll_collisions::
	.ds 128
_scroll_collisions_down::
	.ds 128
_scroll_tile_info::
	.ds 256
_scroll_bank::
	.ds 1
_scroll_offset_x::
	.ds 1
_scroll_offset_y::
	.ds 1
_pending_h_x::
	.ds 2
_pending_h_y::
	.ds 2
_pending_h_i::
	.ds 1
_pending_h_map::
	.ds 2
_pending_w_map::
	.ds 2
_pending_w_x::
	.ds 2
_pending_w_y::
	.ds 2
_pending_w_i::
	.ds 1
_current_vbl_count::
	.ds 1
_scroll_h_border::
	.ds 1
_clamp_enabled::
	.ds 1
_ZGB_Parallax::
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
;C:/gbdk/ZGB/common/src/Scroll.c:24: unsigned char* scroll_map = 0;
	ld	hl,#_scroll_map
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:25: unsigned char* scroll_cmap = 0;
	ld	hl,#_scroll_cmap
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:32: struct Sprite* scroll_target = 0;
	ld	hl,#_scroll_target
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:33: INT16 scroll_target_offset_x = 0;
	ld	hl,#_scroll_target_offset_x
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:34: INT16 scroll_target_offset_y = 0;
	ld	hl,#_scroll_target_offset_y
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:39: UINT8 scroll_offset_x = 0;
	ld	hl,#_scroll_offset_x
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:40: UINT8 scroll_offset_y = 0;
	ld	hl,#_scroll_offset_y
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:44: unsigned char* pending_h_map = 0;
	ld	hl,#_pending_h_map
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:45: unsigned char* pending_w_map = 0;
	ld	hl,#_pending_w_map
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:173: INT8 scroll_h_border = 0;
	ld	hl,#_scroll_h_border
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:174: UINT8 clamp_enabled = 1;
	ld	hl,#_clamp_enabled
	ld	(hl),#0x01
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;C:/gbdk/ZGB/common/src/Scroll.c:57: void ZGB_SET_TILE(UINT8 x, UINT8 y, UINT8 t){
;	---------------------------------
; Function ZGB_SET_TILE
; ---------------------------------
_ZGB_SET_TILE::
;C:/gbdk/ZGB/common/src/Scroll.c:96: __endasm;
	LDA	HL,3(SP)
	DEC	HL
	LD	D,#0
	LD	B,#0
	LD	E,(HL)
	INC	HL
	LD	A,(HL+)
;	Multiply Y*32
	RLA
	RLA
	RLA
	LD	C,A
	LD	A,(HL)
	LD	HL,#0x9800
	ADD	HL,BC
	ADD	HL,BC
	ADD	HL,BC
	ADD	HL,BC
	ADD	HL,DE
	LD	B,A
	ld	de,#0xff41
	1$:
	ld	a,(de)
	and	a, #0x02
	jr	NZ,1$
	LD	(HL),B
	ld	a,(de)
	and	a, #0x02
	jr	NZ,1$
	ret
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:99: void UPDATE_TILE(INT16 x, INT16 y, UINT8* t, UINT8* c) {
;	---------------------------------
; Function UPDATE_TILE
; ---------------------------------
_UPDATE_TILE::
	add	sp, #-10
;C:/gbdk/ZGB/common/src/Scroll.c:100: UINT8 replacement = *t;
	ldhl	sp,#16
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#6
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#2
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Scroll.c:113: if(x < 0 || y < 0 || U_LESS_THAN(scroll_tiles_w - 1, x) || U_LESS_THAN(scroll_tiles_h - 1, y)) {
	ldhl	sp,#12
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a,#0x00
	ld	e, a
	bit	7, e
	jr	Z,00159$
	bit	7, d
	jr	NZ,00160$
	cp	a, a
	jr	00160$
00159$:
	bit	7, d
	jr	Z,00160$
	scf
00160$:
	jp	C,00111$
	ldhl	sp,#14
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a,#0x00
	ld	e, a
	bit	7, e
	jr	Z,00161$
	bit	7, d
	jr	NZ,00162$
	cp	a, a
	jr	00162$
00161$:
	bit	7, d
	jr	Z,00162$
	scf
00162$:
	jp	C,00111$
	ld	hl,#_scroll_tiles_w
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	dec	bc
	ldhl	sp,#12
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#8
	ld	(hl+),a
	ld	(hl),e
	dec	hl
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
	bit	7, b
	jr	NZ,00111$
	ld	hl,#_scroll_tiles_h
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	dec	bc
	ldhl	sp,#14
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#8
	ld	(hl+),a
	ld	(hl),e
	dec	hl
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
	bit	7, b
	jr	Z,00112$
00111$:
;C:/gbdk/ZGB/common/src/Scroll.c:114: replacement = 0;
	ldhl	sp,#2
	ld	(hl),#0x00
	jp	00113$
00112$:
;C:/gbdk/ZGB/common/src/Scroll.c:116: type = GetTileReplacement(t, &replacement);
	ldhl	sp,#2
	ld	c,l
	ld	b,h
	push	bc
	ldhl	sp,#8
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_GetTileReplacement
	add	sp, #4
	ldhl	sp,#3
	ld	(hl),e
;C:/gbdk/ZGB/common/src/Scroll.c:117: if(type != 255u) {
	ld	a,(hl)
	inc	a
	jp	Z,00113$
;C:/gbdk/ZGB/common/src/Scroll.c:118: tmp_y = y << 8;
	ldhl	sp,#14
	ld	b,(hl)
	ld	c,#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:119: id = (0x00FF & x) | ((0xFF00 & tmp_y)); // (y >> 3) << 8 == y << 5
	dec	hl
	dec	hl
	ld	e,(hl)
	ld	d,#0x00
	ld	c,#0x00
	ld	a,c
	or	a, e
	ld	c,a
	ld	a,b
	or	a, d
	ld	b,a
	ldhl	sp,#0
	ld	(hl),c
;C:/gbdk/ZGB/common/src/Scroll.c:120: for(i = 0u; i != sprite_manager_updatables[0]; ++i) {
	inc	hl
	ld	(hl),#0x00
00118$:
	ld	de, #_sprite_manager_updatables + 0
	ld	a,(de)
	ld	c,a
	ldhl	sp,#1
	ld	a,(hl)
	sub	a, c
	jr	NZ,00167$
	ld	a,#0x01
	jr	00168$
00167$:
	xor	a,a
00168$:
	ldhl	sp,#8
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Scroll.c:122: if((s->unique_id == id) && ((UINT16)s->type == (UINT16)type)) {
	ldhl	sp,#0
	ld	a,(hl)
	ldhl	sp,#6
	ld	(hl+),a
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:120: for(i = 0u; i != sprite_manager_updatables[0]; ++i) {
	inc	hl
	bit	0,(hl)
	jp	NZ,00104$
;C:/gbdk/ZGB/common/src/Scroll.c:121: s = sprite_manager_sprites[sprite_manager_updatables[i + 1]];
	ldhl	sp,#1
	ld	c,(hl)
	ld	b,#0x00
	inc	bc
	ld	hl,#_sprite_manager_updatables
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_sprite_manager_sprites
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ldhl	sp,#4
	ld	(hl+),a
	inc	de
	ld	a,(de)
;C:/gbdk/ZGB/common/src/Scroll.c:122: if((s->unique_id == id) && ((UINT16)s->type == (UINT16)type)) {
	ld	(hl-),a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0016
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
	ldhl	sp,#6
	ld	a,(hl)
	sub	a, c
	jr	NZ,00119$
	inc	hl
	ld	a,(hl)
	sub	a, b
	jr	NZ,00119$
	ldhl	sp,#(5 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0010
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#3
	ld	e,(hl)
	ld	d,#0x00
	ld	a,c
	sub	a, e
	jr	NZ,00173$
	ld	a,b
	sub	a, d
	jr	Z,00104$
00173$:
;C:/gbdk/ZGB/common/src/Scroll.c:123: break;
00119$:
;C:/gbdk/ZGB/common/src/Scroll.c:120: for(i = 0u; i != sprite_manager_updatables[0]; ++i) {
	ldhl	sp,#1
	inc	(hl)
	jp	00118$
00104$:
;C:/gbdk/ZGB/common/src/Scroll.c:127: if(i == sprite_manager_updatables[0]) {
	ldhl	sp,#8
	bit	0,(hl)
	jp	Z,00113$
;C:/gbdk/ZGB/common/src/Scroll.c:128: s = SpriteManagerAdd(type, x << 3, (y - 1) << 3);
	ldhl	sp,#14
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	dec	bc
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	dec	hl
	dec	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	push	bc
	push	de
	ldhl	sp,#7
	ld	a,(hl)
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
	ld	c,e
	ld	b,d
;C:/gbdk/ZGB/common/src/Scroll.c:129: if(s) {
	ld	a,b
	or	a,c
	jr	Z,00113$
;C:/gbdk/ZGB/common/src/Scroll.c:130: s->unique_id = id;
	ld	hl,#0x0016
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#6
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
00113$:
;C:/gbdk/ZGB/common/src/Scroll.c:136: x = 0x1F & (x + scroll_offset_x);
	ld	hl,#_scroll_offset_x
	ld	c,(hl)
	ld	b,#0x00
	ldhl	sp,#12
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,c
	and	a, #0x1f
	ldhl	sp,#12
	ld	(hl+),a
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:137: y = 0x1F & (y + scroll_offset_y);
	ld	hl,#_scroll_offset_y
	ld	c,(hl)
	ld	b,#0x00
	ldhl	sp,#14
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,c
	and	a, #0x1f
	ldhl	sp,#14
	ld	(hl+),a
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:138: ZGB_SET_TILE( x, y, replacement);
	dec	hl
	ld	b,(hl)
	dec	hl
	dec	hl
	ld	d,(hl)
	ldhl	sp,#2
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	inc	sp
	call	_ZGB_SET_TILE
	add	sp, #3
	add	sp, #10
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:146: void ZInitScrollTilesColor(UINT8 first_tile, UINT8 n_tiles, UINT8* tile_data, UINT8 tile_bank, UINT8* palette_entries) {
;	---------------------------------
; Function ZInitScrollTilesColor
; ---------------------------------
_ZInitScrollTilesColor::
	add	sp, #-3
;C:/gbdk/ZGB/common/src/Scroll.c:149: PUSH_BANK(tile_bank);
	ldhl	sp,#9
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/Scroll.c:150: set_bkg_data(first_tile, n_tiles, tile_data);
	ldhl	sp,#7
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ldhl	sp,#8
	ld	a,(hl)
	push	af
	inc	sp
	dec	hl
	ld	a,(hl)
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;C:/gbdk/ZGB/common/src/Scroll.c:151: for(i = first_tile; i < first_tile + n_tiles; ++i) {
	push	hl
	ldhl	sp,#7
	ld	a,(hl)
	ldhl	sp,#4
	ld	(hl),a
	pop	hl
00103$:
	ldhl	sp,#5
	ld	c,(hl)
	ld	b,#0x00
	inc	hl
	ld	a,(hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),#0x00
	pop	hl
	push	hl
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#2
	ld	a,(hl-)
	dec	hl
	ld	(hl+),a
	ld	(hl),#0x00
	dec	hl
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a,b
	ld	e, a
	bit	7, e
	jr	Z,00122$
	bit	7, d
	jr	NZ,00123$
	cp	a, a
	jr	00123$
00122$:
	bit	7, d
	jr	Z,00123$
	scf
00123$:
	jp	NC,00101$
;C:/gbdk/ZGB/common/src/Scroll.c:152: scroll_tile_info[i] = palette_entries ? palette_entries[i] : 0;
	ld	de,#_scroll_tile_info
	ldhl	sp,#2
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,#11
	ld	a,(hl-)
	or	a,(hl)
	jr	Z,00107$
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ldhl	sp,#2
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	jr	00108$
00107$:
	ld	c,#0x00
00108$:
	pop	hl
	push	hl
	ld	(hl),c
;C:/gbdk/ZGB/common/src/Scroll.c:151: for(i = first_tile; i < first_tile + n_tiles; ++i) {
	ldhl	sp,#2
	inc	(hl)
	jp	00103$
00101$:
;C:/gbdk/ZGB/common/src/Scroll.c:154: POP_BANK;
	call	_PopBank
	add	sp, #3
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:157: void InitWindow(UINT8 x, UINT8 y, UINT8 w, UINT8 h, UINT8* map, UINT8 bank, UINT8* cmap) {
;	---------------------------------
; Function InitWindow
; ---------------------------------
_InitWindow::
;C:/gbdk/ZGB/common/src/Scroll.c:159: PUSH_BANK(bank);
	ldhl	sp,#8
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/Scroll.c:160: set_win_tiles(x, y, w, h, map);
	ldhl	sp,#6
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ldhl	sp,#7
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
	ld	a,(hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;C:/gbdk/ZGB/common/src/Scroll.c:170: POP_BANK;
	jp	_PopBank
;C:/gbdk/ZGB/common/src/Scroll.c:175: void ClampScrollLimits(UINT16* x, UINT16* y) {
;	---------------------------------
; Function ClampScrollLimits
; ---------------------------------
_ClampScrollLimits::
	add	sp, #-6
;C:/gbdk/ZGB/common/src/Scroll.c:176: if(clamp_enabled) {
	ld	hl,#_clamp_enabled
	ld	a,(hl)
	or	a, a
	jp	Z,00111$
;C:/gbdk/ZGB/common/src/Scroll.c:177: if(U_LESS_THAN(*x, 0u)) {
	ldhl	sp,#8
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
	inc	de
	ld	a,(de)
	ld	b,a
	bit	7, b
	jr	Z,00102$
;C:/gbdk/ZGB/common/src/Scroll.c:178: *x = 0u;		
	ldhl	sp,#4
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
00102$:
;C:/gbdk/ZGB/common/src/Scroll.c:180: if(*x > (scroll_w - SCREENWIDTH)) {
	ldhl	sp,#(5 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#0
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ld	hl,#_scroll_w
	ld	a,(hl)
	add	a,#0x60
	ld	c,a
	inc	hl
	ld	a,(hl)
	adc	a,#0xff
	ld	b,a
	ldhl	sp,#0
	ld	a,c
	sub	a, (hl)
	inc	hl
	ld	a,b
	sbc	a, (hl)
	jr	NC,00104$
;C:/gbdk/ZGB/common/src/Scroll.c:181: *x = (scroll_w - SCREENWIDTH);
	ldhl	sp,#4
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
00104$:
;C:/gbdk/ZGB/common/src/Scroll.c:183: if(U_LESS_THAN(*y, 0u)) {
	ldhl	sp,#10
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
	pop	de
	push	de
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	bit	7, b
	jr	Z,00106$
;C:/gbdk/ZGB/common/src/Scroll.c:184: *y = 0u;		
	pop	hl
	push	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
00106$:
;C:/gbdk/ZGB/common/src/Scroll.c:186: if(*y > (scroll_h - SCREENHEIGHT + scroll_h_border)) {
	pop	de
	push	de
	ld	a,(de)
	ldhl	sp,#4
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ld	hl,#_scroll_h
	ld	a,(hl)
	add	a,#0x70
	ld	c,a
	inc	hl
	ld	a,(hl)
	adc	a,#0xff
	ld	b,a
	ld	hl,#_scroll_h_border
	ld	e,(hl)
	ld	a,(hl)
	rla
	sbc	a, a
	ld	d,a
	ldhl	sp,#2
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
	ldhl	sp,#4
	ld	a,c
	sub	a, (hl)
	inc	hl
	ld	a,b
	sbc	a, (hl)
	jr	NC,00111$
;C:/gbdk/ZGB/common/src/Scroll.c:187: *y = (scroll_h - SCREENHEIGHT + scroll_h_border);
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
00111$:
	add	sp, #6
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:192: void ScrollSetMap(UINT16 map_w, UINT16 map_h, unsigned char* map, UINT8 bank, unsigned char* cmap) {
;	---------------------------------
; Function ScrollSetMap
; ---------------------------------
_ScrollSetMap::
	add	sp, #-2
;C:/gbdk/ZGB/common/src/Scroll.c:193: scroll_tiles_w = map_w;
	ldhl	sp,#(5 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#_scroll_tiles_w
	ld	(hl),e
	inc	hl
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Scroll.c:194: scroll_tiles_h = map_h;
	ldhl	sp,#(7 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#_scroll_tiles_h
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/Scroll.c:195: scroll_map = map;
	push	hl
	ldhl	sp,#10
	ld	a,(hl)
	ld	hl,#_scroll_map
	ld	(hl),a
	pop	hl
	push	hl
	ldhl	sp,#11
	ld	a,(hl)
	ld	hl,#_scroll_map + 1
	ld	(hl),a
	pop	hl
;C:/gbdk/ZGB/common/src/Scroll.c:199: scroll_x = 0;
	ld	hl,#_scroll_x
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:200: scroll_y = 0;
	ld	hl,#_scroll_y
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:201: scroll_w = map_w << 3;
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	ld	hl,#_scroll_w
	ld	(hl),e
	inc	hl
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Scroll.c:202: scroll_h = map_h << 3;
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	ld	hl,#_scroll_h
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/Scroll.c:203: scroll_bank = bank;
	push	hl
	ldhl	sp,#12
	ld	a,(hl)
	ld	hl,#_scroll_bank
	ld	(hl),a
	pop	hl
;C:/gbdk/ZGB/common/src/Scroll.c:204: if(scroll_target) {
	ld	hl,#_scroll_target + 1
	ld	a,(hl-)
	or	a,(hl)
	jp	Z,00102$
;C:/gbdk/ZGB/common/src/Scroll.c:205: scroll_x = scroll_target->x - (SCREENWIDTH >> 1);
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
	pop	de
	push	de
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
	ld	a,c
	add	a,#0xb0
	ld	hl,#_scroll_x
	ld	(hl),a
	ld	a,b
	adc	a,#0xff
	inc	hl
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Scroll.c:206: scroll_y = scroll_target->y - BOTTOM_MOVEMENT_LIMIT; //Move the camera to its bottom limit
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
	ld	a,c
	add	a,#0xa6
	ld	hl,#_scroll_y
	ld	(hl),a
	ld	a,b
	adc	a,#0xff
	inc	hl
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Scroll.c:207: ClampScrollLimits(&scroll_x, &scroll_y);
	ld	hl,#_scroll_y
	push	hl
	ld	hl,#_scroll_x
	push	hl
	call	_ClampScrollLimits
	add	sp, #4
00102$:
;C:/gbdk/ZGB/common/src/Scroll.c:209: pending_h_i = 0;
	ld	hl,#_pending_h_i
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:210: pending_w_i = 0;
	ld	hl,#_pending_w_i
	ld	(hl),#0x00
	add	sp, #2
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:213: void InitScroll(UINT16 map_w, UINT16 map_h, unsigned char* map, const UINT8* coll_list, const UINT8* coll_list_down, UINT8 bank, unsigned char* color_map) {
;	---------------------------------
; Function InitScroll
; ---------------------------------
_InitScroll::
	add	sp, #-5
;C:/gbdk/ZGB/common/src/Scroll.c:217: ScrollSetMap(map_w, map_h, map, bank, color_map);
	ldhl	sp,#18
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ldhl	sp,#19
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#14
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ldhl	sp,#14
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ldhl	sp,#14
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_ScrollSetMap
	add	sp, #9
;C:/gbdk/ZGB/common/src/Scroll.c:219: for(i = 0u; i != 128; ++i) {
	ldhl	sp,#0
	ld	(hl),#0x00
00109$:
;C:/gbdk/ZGB/common/src/Scroll.c:220: scroll_collisions[i] = 0u;
	ld	de,#_scroll_collisions
	ldhl	sp,#0
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Scroll.c:221: scroll_collisions_down[i] = 0u;
	ld	de,#_scroll_collisions_down
	ldhl	sp,#0
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Scroll.c:219: for(i = 0u; i != 128; ++i) {
	ldhl	sp,#0
	inc	(hl)
	ld	a,(hl)
	sub	a, #0x80
	jr	NZ,00109$
;C:/gbdk/ZGB/common/src/Scroll.c:223: if(coll_list) {
	ldhl	sp,#14
	ld	a,(hl-)
	or	a,(hl)
	jr	Z,00104$
;C:/gbdk/ZGB/common/src/Scroll.c:224: for(i = 0u; coll_list[i] != 0u; ++i) {
	ldhl	sp,#0
	ld	(hl),#0x00
00112$:
	ldhl	sp,#(14 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ldhl	sp,#0
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	or	a, a
	jr	Z,00104$
;C:/gbdk/ZGB/common/src/Scroll.c:225: scroll_collisions[coll_list[i]] = 1u;
	ld	a,#<(_scroll_collisions)
	add	a, c
	ld	c,a
	ld	a,#>(_scroll_collisions)
	adc	a, #0x00
	ld	b,a
	ld	a,#0x01
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Scroll.c:224: for(i = 0u; coll_list[i] != 0u; ++i) {
	ldhl	sp,#0
	inc	(hl)
	jr	00112$
00104$:
;C:/gbdk/ZGB/common/src/Scroll.c:228: if(coll_list_down) {
	ldhl	sp,#16
	ld	a,(hl-)
	or	a,(hl)
	jr	Z,00107$
;C:/gbdk/ZGB/common/src/Scroll.c:229: for(i = 0u; coll_list_down[i] != 0u; ++i) {
	ldhl	sp,#0
	ld	(hl),#0x00
00115$:
	ldhl	sp,#(16 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ldhl	sp,#0
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	or	a, a
	jr	Z,00107$
;C:/gbdk/ZGB/common/src/Scroll.c:230: scroll_collisions_down[coll_list_down[i]] = 1u;
	ld	a,#<(_scroll_collisions_down)
	add	a, c
	ld	c,a
	ld	a,#>(_scroll_collisions_down)
	adc	a, #0x00
	ld	b,a
	ld	a,#0x01
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Scroll.c:229: for(i = 0u; coll_list_down[i] != 0u; ++i) {
	ldhl	sp,#0
	inc	(hl)
	jr	00115$
00107$:
;C:/gbdk/ZGB/common/src/Scroll.c:235: PUSH_BANK(bank);
	ldhl	sp,#17
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/Scroll.c:236: y = scroll_y >> 3;
	ld	hl,#_scroll_y
	ld	a,(hl)
	ldhl	sp,#3
	ld	(hl),a
	ld	hl,#_scroll_y + 1
	ld	a,(hl)
	ldhl	sp,#4
	ld	(hl),a
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
;C:/gbdk/ZGB/common/src/Scroll.c:237: for(i = 0u; i != (SCREEN_TILE_REFRES_H) && y != scroll_h; ++i, y ++) {
	ldhl	sp,#0
	ld	(hl),#0x00
00119$:
	ldhl	sp,#0
	ld	a,(hl)
	sub	a, #0x15
	jp	Z,00108$
	ldhl	sp,#(4 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#_scroll_h
	ld	a,(hl)
	sub	a, c
	jr	NZ,00178$
	inc	hl
	ld	a,(hl)
	sub	a, b
	jp	Z,00108$
00178$:
;C:/gbdk/ZGB/common/src/Scroll.c:238: ScrollUpdateRow((scroll_x >> 3) - SCREEN_PAD_LEFT,  y - SCREEN_PAD_TOP);
	ldhl	sp,#(4 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0001
	ld	a,e
	sub	a,l
	ld	e,a
	ld	a,d
	sbc	a,h
	ldhl	sp,#2
	ld	(hl-),a
	ld	(hl),e
	ld	hl,#_scroll_x + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	dec	bc
	ldhl	sp,#1
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	call	_ScrollUpdateRow
	add	sp, #4
;C:/gbdk/ZGB/common/src/Scroll.c:237: for(i = 0u; i != (SCREEN_TILE_REFRES_H) && y != scroll_h; ++i, y ++) {
	ldhl	sp,#0
	inc	(hl)
	ldhl	sp,#3
	inc	(hl)
	jp	NZ,00119$
	inc	hl
	inc	(hl)
	jp	00119$
00108$:
;C:/gbdk/ZGB/common/src/Scroll.c:240: POP_BANK;
	call	_PopBank
	add	sp, #5
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:243: void ScrollUpdateRowR() {
;	---------------------------------
; Function ScrollUpdateRowR
; ---------------------------------
_ScrollUpdateRowR::
	add	sp, #-3
;C:/gbdk/ZGB/common/src/Scroll.c:246: for(i = 0u; i != 5 && pending_w_i != 0; ++i, -- pending_w_i)  {
	ldhl	sp,#0
	ld	(hl),#0x00
00104$:
	ldhl	sp,#0
	ld	a,(hl)
	sub	a, #0x05
	jp	Z,00106$
	ld	hl,#_pending_w_i
	ld	a,(hl)
	or	a, a
	jp	Z,00106$
;C:/gbdk/ZGB/common/src/Scroll.c:250: UPDATE_TILE(pending_w_x ++, pending_w_y, pending_w_map ++,0);
	ld	hl,#_pending_w_map
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),e
	ld	hl,#_pending_w_map
	inc	(hl)
	jr	NZ,00122$
	inc	hl
	inc	(hl)
00122$:
	ld	hl,#_pending_w_x + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	dec	hl
	inc	(hl)
	jr	NZ,00123$
	inc	hl
	inc	(hl)
00123$:
	ld	hl,#0x0000
	push	hl
	ldhl	sp,#3
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#_pending_w_y
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	call	_UPDATE_TILE
	add	sp, #8
;C:/gbdk/ZGB/common/src/Scroll.c:246: for(i = 0u; i != 5 && pending_w_i != 0; ++i, -- pending_w_i)  {
	ldhl	sp,#0
	inc	(hl)
	ld	hl,#_pending_w_i
	dec	(hl)
	jp	00104$
00106$:
	add	sp, #3
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:255: void ScrollUpdateRowWithDelay(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateRowWithDelay
; ---------------------------------
_ScrollUpdateRowWithDelay::
;C:/gbdk/ZGB/common/src/Scroll.c:256: while(pending_w_i) {
00101$:
	ld	hl,#_pending_w_i
	ld	a,(hl)
	or	a, a
	jr	Z,00103$
;C:/gbdk/ZGB/common/src/Scroll.c:257: ScrollUpdateRowR();
	call	_ScrollUpdateRowR
	jr	00101$
00103$:
;C:/gbdk/ZGB/common/src/Scroll.c:260: pending_w_x = x;
	ldhl	sp,#2
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_pending_w_x
	ld	(hl+),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/Scroll.c:261: pending_w_y = y;
	ldhl	sp,#(5 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#_pending_w_y
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/Scroll.c:262: pending_w_i = SCREEN_TILE_REFRES_W;
	ld	hl,#_pending_w_i
	ld	(hl),#0x17
;C:/gbdk/ZGB/common/src/Scroll.c:263: pending_w_map = scroll_map + scroll_tiles_w * y + x;
	push	bc
	ld	hl,#_scroll_tiles_w
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__mulint
	add	sp, #4
	ld	c,e
	ld	b,d
	ld	a,c
	ld	hl,#_scroll_map
	add	a, (hl)
	ld	c,a
	ld	a,b
	inc	hl
	adc	a, (hl)
	ld	b,a
	ldhl	sp,#2
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	a,l
	ld	d,h
	ld	hl,#_pending_w_map
	ld	(hl+),a
	ld	(hl),d
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:270: void ScrollUpdateRow(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateRow
; ---------------------------------
_ScrollUpdateRow::
	add	sp, #-5
;C:/gbdk/ZGB/common/src/Scroll.c:272: unsigned char* map = scroll_map + scroll_tiles_w * y + x;
	ldhl	sp,#(10 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	bc
	ld	hl,#_scroll_tiles_w
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__mulint
	add	sp, #4
	ld	c,e
	ld	b,d
	ld	a,c
	ld	hl,#_scroll_map
	add	a, (hl)
	ld	c,a
	ld	a,b
	inc	hl
	adc	a, (hl)
	ld	b,a
	ldhl	sp,#7
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
;C:/gbdk/ZGB/common/src/Scroll.c:278: PUSH_BANK(scroll_bank);
	push	bc
	ld	hl,#_scroll_bank
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	bc
;C:/gbdk/ZGB/common/src/Scroll.c:279: for(i = 0u; i != SCREEN_TILE_REFRES_W; ++i) {
	ldhl	sp,#3
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ldhl	sp,#0
	ld	(hl),#0x00
00102$:
;C:/gbdk/ZGB/common/src/Scroll.c:283: UPDATE_TILE(x + i, y, map ++, 0);
	ldhl	sp,#3
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),e
	inc	hl
	inc	(hl)
	jr	NZ,00115$
	inc	hl
	inc	(hl)
00115$:
	ldhl	sp,#0
	ld	c,(hl)
	ld	b,#0x00
	ldhl	sp,#7
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	hl,#0x0000
	push	hl
	ldhl	sp,#3
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ldhl	sp,#13
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	call	_UPDATE_TILE
	add	sp, #8
;C:/gbdk/ZGB/common/src/Scroll.c:279: for(i = 0u; i != SCREEN_TILE_REFRES_W; ++i) {
	ldhl	sp,#0
	inc	(hl)
	ld	a,(hl)
	sub	a, #0x17
	jp	NZ,00102$
;C:/gbdk/ZGB/common/src/Scroll.c:286: POP_BANK;
	call	_PopBank
	add	sp, #5
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:289: void ScrollUpdateColumnR() {
;	---------------------------------
; Function ScrollUpdateColumnR
; ---------------------------------
_ScrollUpdateColumnR::
	dec	sp
;C:/gbdk/ZGB/common/src/Scroll.c:292: for(i = 0u; i != 5 && pending_h_i != 0; ++i, pending_h_i --) {
	ldhl	sp,#0
	ld	(hl),#0x00
00104$:
	ldhl	sp,#0
	ld	a,(hl)
	sub	a, #0x05
	jp	Z,00106$
	ld	hl,#_pending_h_i
	ld	a,(hl)
	or	a, a
	jp	Z,00106$
;C:/gbdk/ZGB/common/src/Scroll.c:298: UPDATE_TILE(pending_h_x, pending_h_y ++, pending_h_map, 0);
	ld	hl,#_pending_h_y + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	dec	hl
	inc	(hl)
	jr	NZ,00122$
	inc	hl
	inc	(hl)
00122$:
	ld	hl,#0x0000
	push	hl
	ld	hl,#_pending_h_map
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	ld	hl,#_pending_h_x
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_UPDATE_TILE
	add	sp, #8
;C:/gbdk/ZGB/common/src/Scroll.c:299: pending_h_map += scroll_tiles_w;
	ld	hl,#_pending_h_map
	ld	a,(hl)
	ld	hl,#_scroll_tiles_w
	add	a, (hl)
	ld	hl,#_pending_h_map
	ld	(hl+),a
	ld	a,(hl)
	ld	hl,#_scroll_tiles_w + 1
	adc	a, (hl)
	ld	hl,#_pending_h_map + 1
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Scroll.c:292: for(i = 0u; i != 5 && pending_h_i != 0; ++i, pending_h_i --) {
	ldhl	sp,#0
	inc	(hl)
	ld	hl,#_pending_h_i
	dec	(hl)
	jp	00104$
00106$:
	inc	sp
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:304: void ScrollUpdateColumnWithDelay(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateColumnWithDelay
; ---------------------------------
_ScrollUpdateColumnWithDelay::
;C:/gbdk/ZGB/common/src/Scroll.c:305: while(pending_h_i) {
00101$:
	ld	hl,#_pending_h_i
	ld	a,(hl)
	or	a, a
	jr	Z,00103$
;C:/gbdk/ZGB/common/src/Scroll.c:306: ScrollUpdateColumnR();
	call	_ScrollUpdateColumnR
	jr	00101$
00103$:
;C:/gbdk/ZGB/common/src/Scroll.c:309: pending_h_x = x;
	ldhl	sp,#2
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_pending_h_x
	ld	(hl+),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/Scroll.c:310: pending_h_y = y;
	ldhl	sp,#(5 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#_pending_h_y
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/Scroll.c:311: pending_h_i = SCREEN_TILE_REFRES_H;
	ld	hl,#_pending_h_i
	ld	(hl),#0x15
;C:/gbdk/ZGB/common/src/Scroll.c:312: pending_h_map = scroll_map + scroll_tiles_w * y + x;
	push	bc
	ld	hl,#_scroll_tiles_w
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__mulint
	add	sp, #4
	ld	c,e
	ld	b,d
	ld	a,c
	ld	hl,#_scroll_map
	add	a, (hl)
	ld	c,a
	ld	a,b
	inc	hl
	adc	a, (hl)
	ld	b,a
	ldhl	sp,#2
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	a,l
	ld	d,h
	ld	hl,#_pending_h_map
	ld	(hl+),a
	ld	(hl),d
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:319: void ScrollUpdateColumn(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateColumn
; ---------------------------------
_ScrollUpdateColumn::
	add	sp, #-5
;C:/gbdk/ZGB/common/src/Scroll.c:321: unsigned char* map = &scroll_map[scroll_tiles_w * y + x];
	ldhl	sp,#(10 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	bc
	ld	hl,#_scroll_tiles_w
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__mulint
	add	sp, #4
	ldhl	sp,#4
	ld	(hl),d
	dec	hl
	ld	(hl),e
	ldhl	sp,#(8 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ldhl	sp,#3
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,c
	ld	hl,#_scroll_map
	add	a, (hl)
	ld	c,a
	ld	a,b
	inc	hl
	adc	a, (hl)
	ld	b,a
	inc	sp
	inc	sp
	push	bc
;C:/gbdk/ZGB/common/src/Scroll.c:326: PUSH_BANK(scroll_bank);
	ld	hl,#_scroll_bank
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/Scroll.c:327: for(i = 0u; i != SCREEN_TILE_REFRES_H; ++i) {
	ldhl	sp,#2
	ld	(hl),#0x00
00102$:
;C:/gbdk/ZGB/common/src/Scroll.c:333: UPDATE_TILE(x, y + i, map, 0);
	ldhl	sp,#2
	ld	c,(hl)
	ld	b,#0x00
	ldhl	sp,#9
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	hl,#0x0000
	push	hl
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	push	bc
	ldhl	sp,#13
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_UPDATE_TILE
	add	sp, #8
;C:/gbdk/ZGB/common/src/Scroll.c:334: map += scroll_tiles_w;
	pop	de
	push	de
	ld	hl,#_scroll_tiles_w
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,de
	inc	sp
	inc	sp
	push	hl
;C:/gbdk/ZGB/common/src/Scroll.c:327: for(i = 0u; i != SCREEN_TILE_REFRES_H; ++i) {
	ldhl	sp,#2
	inc	(hl)
	ld	a,(hl)
	sub	a, #0x15
	jp	NZ,00102$
;C:/gbdk/ZGB/common/src/Scroll.c:337: POP_BANK;
	call	_PopBank
	add	sp, #5
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:340: void RefreshScroll() {
;	---------------------------------
; Function RefreshScroll
; ---------------------------------
_RefreshScroll::
	add	sp, #-8
;C:/gbdk/ZGB/common/src/Scroll.c:341: UINT16 ny = scroll_y;
	ld	hl,#_scroll_y
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#4
	ld	(hl+),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/Scroll.c:343: if(scroll_target) {
	ld	hl,#_scroll_target + 1
	ld	a,(hl-)
	or	a,(hl)
	jp	Z,00108$
;C:/gbdk/ZGB/common/src/Scroll.c:344: if(U_LESS_THAN(BOTTOM_MOVEMENT_LIMIT, scroll_target->y - scroll_y)) {
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
	pop	de
	push	de
	ld	hl,#0x0009
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ldhl	sp,#2
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ld	hl,#_scroll_y + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ldhl	sp,#(3 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	sub	a,c
	ld	e,a
	ld	a,d
	sbc	a,b
	ld	b,a
	ld	c,e
	ld	de,#0x005a
	ld	a,e
	sub	a,c
	ld	e,a
	ld	a,d
	sbc	a,b
	ldhl	sp,#7
	ld	(hl-),a
	ld	(hl),e
	inc	hl
	bit	7, (hl)
	jr	Z,00104$
;C:/gbdk/ZGB/common/src/Scroll.c:345: ny = scroll_target->y - BOTTOM_MOVEMENT_LIMIT;
	ldhl	sp,#(3 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x005a
	ld	a,e
	sub	a,l
	ld	e,a
	ld	a,d
	sbc	a,h
	ldhl	sp,#5
	ld	(hl-),a
	ld	(hl),e
	jr	00105$
00104$:
;C:/gbdk/ZGB/common/src/Scroll.c:346: } else if(U_LESS_THAN(scroll_target->y - scroll_y, TOP_MOVEMENT_LIMIT)) {
	ld	a,c
	add	a,#0xd8
	ld	c,a
	ld	a,b
	adc	a,#0xff
	ld	b,a
	bit	7, b
	jr	Z,00105$
;C:/gbdk/ZGB/common/src/Scroll.c:347: ny = scroll_target->y - TOP_MOVEMENT_LIMIT;
	ldhl	sp,#(3 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0028
	ld	a,e
	sub	a,l
	ld	e,a
	ld	a,d
	sbc	a,h
	ldhl	sp,#5
	ld	(hl-),a
	ld	(hl),e
00105$:
;C:/gbdk/ZGB/common/src/Scroll.c:350: MoveScroll(scroll_target->x - (SCREENWIDTH >> 1), ny);
	pop	de
	push	de
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
	ld	a,c
	add	a,#0xb0
	ld	c,a
	ld	a,b
	adc	a,#0xff
	ld	b,a
	ldhl	sp,#4
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	call	_MoveScroll
	add	sp, #4
00108$:
	add	sp, #8
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:354: void MoveScroll(INT16 x, INT16 y) {
;	---------------------------------
; Function MoveScroll
; ---------------------------------
_MoveScroll::
	add	sp, #-10
;C:/gbdk/ZGB/common/src/Scroll.c:357: PUSH_BANK(scroll_bank);
	ld	hl,#_scroll_bank
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/Scroll.c:358: ClampScrollLimits(&x, &y);
	ldhl	sp,#14
	ld	e,l
	ld	d,h
	ldhl	sp,#12
	ld	c,l
	ld	b,h
	push	de
	push	bc
	call	_ClampScrollLimits
	add	sp, #4
;C:/gbdk/ZGB/common/src/Scroll.c:360: current_column = scroll_x >> 3;
	ld	hl,#_scroll_x
	ld	a,(hl)
	ldhl	sp,#4
	ld	(hl),a
	ld	hl,#_scroll_x + 1
	ld	a,(hl)
	ldhl	sp,#5
	ld	(hl),a
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
;C:/gbdk/ZGB/common/src/Scroll.c:361: new_column     = x >> 3;
	ldhl	sp,#(13 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;C:/gbdk/ZGB/common/src/Scroll.c:362: current_row    = scroll_y >> 3;
	ld	hl,#_scroll_y
	ld	a,(hl)
	ldhl	sp,#0
	ld	(hl),a
	ld	hl,#_scroll_y + 1
	ld	a,(hl)
	ldhl	sp,#1
	ld	(hl),a
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
;C:/gbdk/ZGB/common/src/Scroll.c:363: new_row        = y >> 3;
	ldhl	sp,#14
	ld	a,(hl)
	ldhl	sp,#2
	ld	(hl),a
	ldhl	sp,#15
	ld	a,(hl)
	ldhl	sp,#3
	ld	(hl),a
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
;C:/gbdk/ZGB/common/src/Scroll.c:367: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT + SCREEN_TILE_REFRES_W - 1, new_row - SCREEN_PAD_TOP);
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0001
	ld	a,e
	sub	a,l
	ld	e,a
	ld	a,d
	sbc	a,h
	ldhl	sp,#7
	ld	(hl-),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/Scroll.c:369: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT, new_row - SCREEN_PAD_TOP);
	ld	de,#0x0001
	ld	a,c
	sub	a,e
	ld	e,a
	ld	a,b
	sbc	a,d
	ldhl	sp,#9
	ld	(hl-),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/Scroll.c:365: if(current_column != new_column) {
	ldhl	sp,#4
	ld	a,(hl)
	sub	a, c
	jr	NZ,00141$
	inc	hl
	ld	a,(hl)
	sub	a, b
	jp	Z,00105$
00141$:
;C:/gbdk/ZGB/common/src/Scroll.c:366: if(new_column > current_column) {
	ldhl	sp,#4
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a,b
	ld	e, a
	bit	7, e
	jr	Z,00142$
	bit	7, d
	jr	NZ,00143$
	cp	a, a
	jr	00143$
00142$:
	bit	7, d
	jr	Z,00143$
	scf
00143$:
	jr	NC,00102$
;C:/gbdk/ZGB/common/src/Scroll.c:367: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT + SCREEN_TILE_REFRES_W - 1, new_row - SCREEN_PAD_TOP);
	ld	hl,#0x0015
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#6
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	call	_ScrollUpdateColumnWithDelay
	add	sp, #4
	jr	00105$
00102$:
;C:/gbdk/ZGB/common/src/Scroll.c:369: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT, new_row - SCREEN_PAD_TOP);
	ldhl	sp,#6
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ldhl	sp,#10
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_ScrollUpdateColumnWithDelay
	add	sp, #4
00105$:
;C:/gbdk/ZGB/common/src/Scroll.c:373: if(current_row != new_row) {
	ldhl	sp,#0
	ld	a,(hl+)
	inc	hl
	sub	a, (hl)
	jr	NZ,00144$
	dec	hl
	ld	a,(hl+)
	inc	hl
	sub	a, (hl)
	jp	Z,00110$
00144$:
;C:/gbdk/ZGB/common/src/Scroll.c:374: if(new_row > current_row) {
	ldhl	sp,#0
	ld	d, h
	ld	e, l
	inc	hl
	inc	hl
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z,00145$
	bit	7, d
	jr	NZ,00146$
	cp	a, a
	jr	00146$
00145$:
	bit	7, d
	jr	Z,00146$
	scf
00146$:
	jr	NC,00107$
;C:/gbdk/ZGB/common/src/Scroll.c:375: ScrollUpdateRowWithDelay(new_column - SCREEN_PAD_LEFT, new_row - SCREEN_PAD_TOP + SCREEN_TILE_REFRES_H - 1);
	ldhl	sp,#(3 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0013
	add	hl,de
	ld	c,l
	ld	b,h
	push	bc
	ldhl	sp,#10
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_ScrollUpdateRowWithDelay
	add	sp, #4
	jr	00110$
00107$:
;C:/gbdk/ZGB/common/src/Scroll.c:377: ScrollUpdateRowWithDelay(new_column - SCREEN_PAD_LEFT, new_row - SCREEN_PAD_TOP);
	ldhl	sp,#6
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ldhl	sp,#10
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_ScrollUpdateRowWithDelay
	add	sp, #4
00110$:
;C:/gbdk/ZGB/common/src/Scroll.c:381: scroll_x = x;
	ldhl	sp,#12
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_scroll_x
	ld	(hl+),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/Scroll.c:382: scroll_y = y;
	ldhl	sp,#14
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_scroll_y
	ld	(hl+),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/Scroll.c:384: if(pending_w_i) {
	ld	hl,#_pending_w_i
	ld	a,(hl)
	or	a, a
	jr	Z,00112$
;C:/gbdk/ZGB/common/src/Scroll.c:385: ScrollUpdateRowR();
	call	_ScrollUpdateRowR
00112$:
;C:/gbdk/ZGB/common/src/Scroll.c:387: if(pending_h_i) {
	ld	hl,#_pending_h_i
	ld	a,(hl)
	or	a, a
	jr	Z,00114$
;C:/gbdk/ZGB/common/src/Scroll.c:388: ScrollUpdateColumnR();
	call	_ScrollUpdateColumnR
00114$:
;C:/gbdk/ZGB/common/src/Scroll.c:390: POP_BANK;
	call	_PopBank
	add	sp, #10
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:393: UINT8* GetScrollTilePtr(UINT16 x, UINT16 y) {
;	---------------------------------
; Function GetScrollTilePtr
; ---------------------------------
_GetScrollTilePtr::
;C:/gbdk/ZGB/common/src/Scroll.c:396: return scroll_map + (scroll_tiles_w * y + x); //TODO: fix this mult!!
	ldhl	sp,#4
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#_scroll_tiles_w
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__mulint
	add	sp, #4
	ld	c,e
	ld	b,d
	ldhl	sp,#2
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,c
	ld	hl,#_scroll_map
	add	a, (hl)
	ld	c,a
	ld	a,b
	inc	hl
	adc	a, (hl)
	ld	b,a
	ld	e, c
	ld	d, b
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:399: UINT8 GetScrollTile(UINT16 x, UINT16 y) {
;	---------------------------------
; Function GetScrollTile
; ---------------------------------
_GetScrollTile::
;C:/gbdk/ZGB/common/src/Scroll.c:401: x = x >>3;
	ldhl	sp,#3
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
;C:/gbdk/ZGB/common/src/Scroll.c:402: y = y >>3;
	ldhl	sp,#5
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
;C:/gbdk/ZGB/common/src/Scroll.c:403: PUSH_BANK(scroll_bank);
	ld	hl,#_scroll_bank
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/Scroll.c:404: ret = *GetScrollTilePtr(x,y);
	ldhl	sp,#4
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ldhl	sp,#4
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_GetScrollTilePtr
	add	sp, #4
	ld	a,(de)
	ld	e,a
;C:/gbdk/ZGB/common/src/Scroll.c:405: POP_BANK;
	push	de
	call	_PopBank
	pop	de
;C:/gbdk/ZGB/common/src/Scroll.c:406: return ret;
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:409: UINT8 ScrollFindTile(UINT16 map_w, unsigned char* map, UINT8 bank, UINT8 tile,
;	---------------------------------
; Function ScrollFindTile
; ---------------------------------
_ScrollFindTile::
	add	sp, #-11
;C:/gbdk/ZGB/common/src/Scroll.c:413: UINT16 yt = 0;
	ldhl	sp,#1
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:414: UINT8 found = 1;
	dec	hl
	dec	hl
	ld	(hl),#0x01
;C:/gbdk/ZGB/common/src/Scroll.c:416: PUSH_BANK(bank);
	ldhl	sp,#17
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/Scroll.c:417: for(xt = start_x; xt != start_x + w; ++ xt) {
	ldhl	sp,#19
	ld	a,(hl)
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),#0x00
	dec	hl
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#9
	ld	(hl+),a
	ld	(hl),e
00110$:
	ldhl	sp,#19
	ld	c,(hl)
	ld	b,#0x00
	inc	hl
	inc	hl
	ld	a,(hl)
	ldhl	sp,#5
	ld	(hl+),a
	ld	(hl),#0x00
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#9
	ld	a,(hl)
	sub	a, c
	jr	NZ,00134$
	inc	hl
	ld	a,(hl)
	sub	a, b
	jp	Z,00104$
00134$:
;C:/gbdk/ZGB/common/src/Scroll.c:418: for(yt = start_y; yt != start_y + h; ++ yt) {
	ldhl	sp,#20
	ld	a,(hl)
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),#0x00
	dec	hl
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#5
	ld	(hl+),a
	ld	(hl),e
00107$:
	ldhl	sp,#20
	ld	a,(hl)
	ldhl	sp,#7
	ld	(hl+),a
	ld	(hl),#0x00
	ldhl	sp,#22
	ld	c,(hl)
	ld	b,#0x00
	ldhl	sp,#7
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#5
	ld	a,(hl)
	sub	a, c
	jr	NZ,00135$
	inc	hl
	ld	a,(hl)
	sub	a, b
	jp	Z,00111$
00135$:
;C:/gbdk/ZGB/common/src/Scroll.c:419: if(map[map_w * yt + xt] == (UINT16)tile) { //That cast over there is mandatory and gave me a lot of headaches
	ldhl	sp,#5
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ldhl	sp,#15
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__mulint
	add	sp, #4
	ld	c,e
	ld	b,d
	ldhl	sp,#9
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#15
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ldhl	sp,#18
	ld	b,(hl)
	ld	de,#0x0000
	ld	a,b
	sub	a, c
	jr	NZ,00136$
	ld	a,e
	sub	a, d
	jr	Z,00105$
00136$:
;C:/gbdk/ZGB/common/src/Scroll.c:418: for(yt = start_y; yt != start_y + h; ++ yt) {
	ldhl	sp,#5
	inc	(hl)
	jr	NZ,00137$
	inc	hl
	inc	(hl)
00137$:
	ldhl	sp,#5
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),e
	jp	00107$
00111$:
;C:/gbdk/ZGB/common/src/Scroll.c:417: for(xt = start_x; xt != start_x + w; ++ xt) {
	ldhl	sp,#9
	inc	(hl)
	jr	NZ,00138$
	inc	hl
	inc	(hl)
00138$:
	ldhl	sp,#9
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),e
	jp	00110$
00104$:
;C:/gbdk/ZGB/common/src/Scroll.c:424: found = 0;
	ldhl	sp,#0
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Scroll.c:426: done:
00105$:
;C:/gbdk/ZGB/common/src/Scroll.c:427: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/Scroll.c:428: *x = xt;
	ldhl	sp,#(24 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ldhl	sp,#3
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Scroll.c:429: *y = yt;
	ldhl	sp,#(26 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ldhl	sp,#1
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Scroll.c:431: return found;
	dec	hl
	dec	hl
	ld	e,(hl)
	add	sp, #11
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:435: void EditCollision(UINT8 tile, UINT8 col){
;	---------------------------------
; Function EditCollision
; ---------------------------------
_EditCollision::
;C:/gbdk/ZGB/common/src/Scroll.c:436: scroll_collisions[tile] = col;
	ld	de,#_scroll_collisions
	ldhl	sp,#2
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ldhl	sp,#3
	ld	a,(hl)
	ld	(bc),a
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:438: void EditCollisionDown(UINT8 tile, UINT8 col){
;	---------------------------------
; Function EditCollisionDown
; ---------------------------------
_EditCollisionDown::
;C:/gbdk/ZGB/common/src/Scroll.c:439: scroll_collisions_down[tile] = col;
	ld	de,#_scroll_collisions_down
	ldhl	sp,#2
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ldhl	sp,#3
	ld	a,(hl)
	ld	(bc),a
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:587: void Update_Parallax(){
;	---------------------------------
; Function Update_Parallax
; ---------------------------------
_Update_Parallax::
;C:/gbdk/ZGB/common/src/Scroll.c:595: }
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:597: void Set_Parallax(unsigned char *tiles, UINT8 bank){
;	---------------------------------
; Function Set_Parallax
; ---------------------------------
_Set_Parallax::
;C:/gbdk/ZGB/common/src/Scroll.c:611: }
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:613: void Move_Parallax(){
;	---------------------------------
; Function Move_Parallax
; ---------------------------------
_Move_Parallax::
;C:/gbdk/ZGB/common/src/Scroll.c:631: }
	ret
	.area _CODE
	.area _CABS (ABS)
