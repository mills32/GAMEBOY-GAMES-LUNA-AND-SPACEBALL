;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module SpriteRocket
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Destroy_SPRITE_ROCKET
	.globl _Update_SPRITE_ROCKET
	.globl _Start_SPRITE_ROCKET
	.globl _bank_SPRITE_ROCKET
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_ROCKET::
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
;SpriteRocket.c:4: UINT8 bank_SPRITE_ROCKET = 2;
	ld	hl,#_bank_SPRITE_ROCKET
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
;SpriteRocket.c:9: void Start_SPRITE_ROCKET() {
;	---------------------------------
; Function Start_SPRITE_ROCKET
; ---------------------------------
_Start_SPRITE_ROCKET::
;SpriteRocket.c:11: }
	ret
;SpriteRocket.c:13: void Update_SPRITE_ROCKET() {
;	---------------------------------
; Function Update_SPRITE_ROCKET
; ---------------------------------
_Update_SPRITE_ROCKET::
	add	sp, #-2
;SpriteRocket.c:14: THIS->x --;
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
;SpriteRocket.c:17: void Destroy_SPRITE_ROCKET() {
;	---------------------------------
; Function Destroy_SPRITE_ROCKET
; ---------------------------------
_Destroy_SPRITE_ROCKET::
;SpriteRocket.c:18: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
