;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module SpriteShip
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Destroy_SPRITE_SHIP
	.globl _Update_SPRITE_SHIP
	.globl _Start_SPRITE_SHIP
	.globl _SetSpriteAnim
	.globl _bank_SPRITE_SHIP
	.globl _anim_ship
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_SHIP::
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
;SpriteShip.c:5: UINT8 bank_SPRITE_SHIP = 2;
	ld	hl,#_bank_SPRITE_SHIP
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
;SpriteShip.c:11: void Start_SPRITE_SHIP() {
;	---------------------------------
; Function Start_SPRITE_SHIP
; ---------------------------------
_Start_SPRITE_SHIP::
;SpriteShip.c:14: SetSpriteAnim(THIS, anim_ship, 10);
	ld	a,#0x0a
	push	af
	inc	sp
	ld	hl,#_anim_ship
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
;SpriteShip.c:15: THIS->flags = 0x85;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x000b
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x85
	ld	(bc),a
	ret
_anim_ship:
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
;SpriteShip.c:20: void Update_SPRITE_SHIP() {
;	---------------------------------
; Function Update_SPRITE_SHIP
; ---------------------------------
_Update_SPRITE_SHIP::
	add	sp, #-2
;SpriteShip.c:21: if (THIS->x == -30) THIS->x = 180;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0007
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ldhl	sp,#0
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl-),a
	ld	a,(hl)
	sub	a, #0xe2
	jr	NZ,00102$
	inc	hl
	ld	a,(hl)
	inc	a
	jr	NZ,00102$
	ld	a,#0xb4
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
00102$:
;SpriteShip.c:22: THIS->x --;
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
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	dec	bc
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	add	sp, #2
	ret
;SpriteShip.c:26: void Destroy_SPRITE_SHIP() {
;	---------------------------------
; Function Destroy_SPRITE_SHIP
; ---------------------------------
_Destroy_SPRITE_SHIP::
;SpriteShip.c:27: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
