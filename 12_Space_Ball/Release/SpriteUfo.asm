;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module SpriteUfo
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Destroy_SPRITE_UFO
	.globl _Update_SPRITE_UFO
	.globl _Start_SPRITE_UFO
	.globl _SetSpriteAnim
	.globl _bank_SPRITE_UFO
	.globl _anim_ufo
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_UFO::
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
;SpriteUfo.c:5: UINT8 bank_SPRITE_UFO = 2;
	ld	hl,#_bank_SPRITE_UFO
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
;SpriteUfo.c:11: void Start_SPRITE_UFO() {
;	---------------------------------
; Function Start_SPRITE_UFO
; ---------------------------------
_Start_SPRITE_UFO::
;SpriteUfo.c:14: SetSpriteAnim(THIS, anim_ufo, 14);
	ld	a,#0x0e
	push	af
	inc	sp
	ld	hl,#_anim_ufo
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
;SpriteUfo.c:15: THIS->flags = 0x84;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x000b
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x84
	ld	(bc),a
	ret
_anim_ufo:
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
;SpriteUfo.c:20: void Update_SPRITE_UFO() {
;	---------------------------------
; Function Update_SPRITE_UFO
; ---------------------------------
_Update_SPRITE_UFO::
	add	sp, #-2
;SpriteUfo.c:21: if (THIS->x == 180) THIS->x = -30;
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
	sub	a, #0xb4
	jr	NZ,00102$
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	NZ,00102$
	ld	a,#0xe2
	ld	(bc),a
	inc	bc
	ld	a,#0xff
	ld	(bc),a
00102$:
;SpriteUfo.c:22: THIS->x ++;
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
	inc	bc
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	add	sp, #2
	ret
;SpriteUfo.c:26: void Destroy_SPRITE_UFO() {
;	---------------------------------
; Function Destroy_SPRITE_UFO
; ---------------------------------
_Destroy_SPRITE_UFO::
;SpriteUfo.c:27: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
