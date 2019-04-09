;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module SpritePlayer
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Destroy_SPRITE_PLAYER
	.globl _Update_SPRITE_PLAYER
	.globl _Start_SPRITE_PLAYER
	.globl _Set_Power_Bar
	.globl _WIN_EDIT_TILE
	.globl _SpriteManagerAdd
	.globl _TranslateSprite
	.globl _Ball_State
	.globl _HitDir
	.globl _BallPos_y
	.globl _BallPos_x
	.globl _TIMER
	.globl _bank_SPRITE_PLAYER
	.globl _Dir
	.globl _Speed
	.globl _anim_idle
	.globl _anim_roll
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_PLAYER::
	.ds 1
_TIMER::
	.ds 1
_BallPos_x::
	.ds 2
_BallPos_y::
	.ds 2
_HitDir::
	.ds 1
_Ball_State::
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
;SpritePlayer.c:3: UINT8 bank_SPRITE_PLAYER = 2;
	ld	hl,#_bank_SPRITE_PLAYER
	ld	(hl),#0x02
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_2
;SpritePlayer.c:117: void Set_Power_Bar(int p){
;	---------------------------------
; Function Set_Power_Bar
; ---------------------------------
_Set_Power_Bar::
;SpritePlayer.c:118: if(p == 0){
	ldhl	sp,#3
	ld	a,(hl-)
	or	a,(hl)
	jr	NZ,00102$
;SpritePlayer.c:120: WIN_EDIT_TILE(3, 0, 47);WIN_EDIT_TILE(4, 0, 51);
	ld	hl,#0x2f00
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_WIN_EDIT_TILE
	add	sp, #3
	ld	hl,#0x3300
	push	hl
	ld	a,#0x04
	push	af
	inc	sp
	call	_WIN_EDIT_TILE
	add	sp, #3
;SpritePlayer.c:121: WIN_EDIT_TILE(3, 1, 48);WIN_EDIT_TILE(4, 1, 52);
	ld	hl,#0x3001
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_WIN_EDIT_TILE
	add	sp, #3
	ld	hl,#0x3401
	push	hl
	ld	a,#0x04
	push	af
	inc	sp
	call	_WIN_EDIT_TILE
	add	sp, #3
00102$:
;SpritePlayer.c:123: if(p == 1){
	ldhl	sp,#2
	ld	a,(hl)
	dec	a
	jp	NZ,00104$
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	NZ,00104$
;SpritePlayer.c:125: WIN_EDIT_TILE(3, 0, 49);WIN_EDIT_TILE(4, 0, 51);
	ld	hl,#0x3100
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_WIN_EDIT_TILE
	add	sp, #3
	ld	hl,#0x3300
	push	hl
	ld	a,#0x04
	push	af
	inc	sp
	call	_WIN_EDIT_TILE
	add	sp, #3
;SpritePlayer.c:126: WIN_EDIT_TILE(3, 1, 50);WIN_EDIT_TILE(4, 1, 52);
	ld	hl,#0x3201
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_WIN_EDIT_TILE
	add	sp, #3
	ld	hl,#0x3401
	push	hl
	ld	a,#0x04
	push	af
	inc	sp
	call	_WIN_EDIT_TILE
	add	sp, #3
00104$:
;SpritePlayer.c:128: if(p == 2){
	ldhl	sp,#2
	ld	a,(hl)
	sub	a, #0x02
	ret	NZ
	inc	hl
	ld	a,(hl)
	or	a, a
	ret	NZ
;SpritePlayer.c:130: WIN_EDIT_TILE(3, 0, 49);WIN_EDIT_TILE(4, 0, 53);
	ld	hl,#0x3100
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_WIN_EDIT_TILE
	add	sp, #3
	ld	hl,#0x3500
	push	hl
	ld	a,#0x04
	push	af
	inc	sp
	call	_WIN_EDIT_TILE
	add	sp, #3
;SpritePlayer.c:131: WIN_EDIT_TILE(3, 1, 50);WIN_EDIT_TILE(4, 1, 54);
	ld	hl,#0x3201
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_WIN_EDIT_TILE
	add	sp, #3
	ld	hl,#0x3601
	push	hl
	ld	a,#0x04
	push	af
	inc	sp
	call	_WIN_EDIT_TILE
	add	sp, #3
	ret
_anim_roll:
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
_anim_idle:
	.db #0x01	; 1
	.db #0x00	; 0
_Speed:
	.db #0xfe	; -2
	.db #0xfe	; -2
	.db #0xfe	; -2
	.db #0xfe	; -2
	.db #0xfe	; -2
	.db #0xfe	; -2
	.db #0xfe	; -2
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xfe	; -2
	.db #0xff	; -1
	.db #0xfe	; -2
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xfe	; -2
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x02	;  2
	.db #0x01	;  1
	.db #0x02	;  2
	.db #0x01	;  1
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x01	;  1
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x02	;  2
_Dir:
	.db #0x09	; 9
	.db #0x0c	; 12
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x09	; 9
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x07	; 7
	.db #0x0b	; 11
	.db #0x05	; 5
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x0b	; 11
	.db #0x07	; 7
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x0b	; 11
	.db #0x0e	; 14
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0b	; 11
	.db #0x0e	; 14
	.db #0x08	; 8
	.db #0x0e	; 14
	.db #0x06	; 6
	.db #0x0d	; 13
	.db #0x03	; 3
	.db #0x0b	; 11
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x0b	; 11
	.db #0x03	; 3
	.db #0x0d	; 13
	.db #0x05	; 5
	.db #0x0e	; 14
	.db #0x08	; 8
	.db #0x0e	; 14
	.db #0x0d	; 13
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x10	; 16
;SpritePlayer.c:135: void Start_SPRITE_PLAYER() {
;	---------------------------------
; Function Start_SPRITE_PLAYER
; ---------------------------------
_Start_SPRITE_PLAYER::
	add	sp, #-4
;SpritePlayer.c:136: struct BallInfo* data = (struct BallInfo*) THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0018
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#2
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
;SpritePlayer.c:137: THIS->coll_x = 4;
	ld	hl,#0x000c
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x04
	ld	(bc),a
;SpritePlayer.c:138: THIS->coll_y = 4;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x000d
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x04
	ld	(bc),a
;SpritePlayer.c:139: THIS->coll_w = 8; 
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x000e
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x08
	ld	(bc),a
;SpritePlayer.c:140: THIS->coll_h = 8; //box
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x000f
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x08
	ld	(bc),a
;SpritePlayer.c:142: data->vx = 0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;SpritePlayer.c:143: data->vy = 0;
	pop	bc
	push	bc
	inc	bc
	xor	a, a
	ld	(bc),a
;SpritePlayer.c:144: data->bx = 0;
	pop	de
	push	de
	ld	hl,#0x0009
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;SpritePlayer.c:145: data->by = 0;
	pop	de
	push	de
	ld	hl,#0x000a
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;SpritePlayer.c:146: data->state = 2; //INIT
	pop	de
	push	de
	ld	hl,#0x000c
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x02
	ld	(bc),a
;SpritePlayer.c:147: data->dir = 14;
	pop	de
	push	de
	ld	hl,#0x0005
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x0e
	ld	(bc),a
;SpritePlayer.c:148: data->force = 32;
	pop	de
	push	de
	ld	hl,#0x0008
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x20
	ld	(bc),a
;SpritePlayer.c:149: HitDir = 14;
	ld	hl,#_HitDir
	ld	(hl),#0x0e
;SpritePlayer.c:136: struct BallInfo* data = (struct BallInfo*) THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;SpritePlayer.c:151: BallPos_x = THIS->x;
	ld	hl,#0x0007
	add	hl,bc
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
	ld	hl,#_BallPos_x
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;SpritePlayer.c:152: BallPos_y = THIS->y;
	ld	hl,#0x0009
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	hl,#_BallPos_y
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;SpritePlayer.c:153: SpriteManagerAdd(SPRITE_POINTER, 0, 0);
	ld	hl,#0x0000
	push	hl
	ld	l, #0x00
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;SpritePlayer.c:155: THIS->flags = 0x00;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x000b
	add	hl,bc
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;SpritePlayer.c:156: TIMER = 0;
	ld	hl,#_TIMER
	ld	(hl),#0x00
	add	sp, #4
	ret
;SpritePlayer.c:160: void Update_SPRITE_PLAYER(){
;	---------------------------------
; Function Update_SPRITE_PLAYER
; ---------------------------------
_Update_SPRITE_PLAYER::
	add	sp, #-2
;SpritePlayer.c:162: BallPos_x = THIS->x;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0007
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	pop	de
	push	de
	ld	a,(de)
	ld	hl,#_BallPos_x
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;SpritePlayer.c:163: BallPos_y = THIS->y;
	ld	hl,#0x0009
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	hl,#_BallPos_y
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;SpritePlayer.c:166: if(KEY_PRESSED(J_RIGHT)) TranslateSprite(THIS,1,0);
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	0, c
	jr	Z,00102$
	ld	hl,#0x0001
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_TranslateSprite
	add	sp, #4
00102$:
;SpritePlayer.c:167: if(KEY_PRESSED(J_LEFT)) TranslateSprite(THIS,-1,0);
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	1, c
	jr	Z,00104$
	ld	hl,#0x00ff
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_TranslateSprite
	add	sp, #4
00104$:
;SpritePlayer.c:168: if(KEY_PRESSED(J_UP)) TranslateSprite(THIS,0,-1);
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	2, c
	jr	Z,00106$
	ld	hl,#0xff00
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_TranslateSprite
	add	sp, #4
00106$:
;SpritePlayer.c:169: if(KEY_PRESSED(J_DOWN)) TranslateSprite(THIS,0,1);
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	3, c
	jr	Z,00109$
	ld	hl,#0x0100
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_TranslateSprite
	add	sp, #4
00109$:
	add	sp, #2
	ret
;SpritePlayer.c:326: void Destroy_SPRITE_PLAYER() {
;	---------------------------------
; Function Destroy_SPRITE_PLAYER
; ---------------------------------
_Destroy_SPRITE_PLAYER::
;SpritePlayer.c:328: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
