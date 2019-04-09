;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module SpritePointer
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Destroy_SPRITE_POINTER
	.globl _Update_SPRITE_POINTER
	.globl _Start_SPRITE_POINTER
	.globl _bank_SPRITE_POINTER
	.globl _Point_Dir
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_POINTER::
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
;SpritePointer.c:4: UINT8 bank_SPRITE_POINTER = 2;
	ld	hl,#_bank_SPRITE_POINTER
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
;SpritePointer.c:38: void Start_SPRITE_POINTER() {
;	---------------------------------
; Function Start_SPRITE_POINTER
; ---------------------------------
_Start_SPRITE_POINTER::
	add	sp, #-2
;SpritePointer.c:39: THIS->x = BallPos_x + Point_Dir[HitDir];
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
	ld	a,#<(_Point_Dir)
	ld	hl,#_HitDir
	add	a, (hl)
	ld	c,a
	ld	a,#>(_Point_Dir)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	c,a
	rla
	sbc	a, a
	ld	b,a
	ld	a,c
	ld	hl,#_BallPos_x
	add	a, (hl)
	ld	c,a
	ld	a,b
	inc	hl
	adc	a, (hl)
	ld	b,a
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;SpritePointer.c:40: THIS->y = BallPos_y + Point_Dir[1+HitDir];
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0009
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	ld	hl,#_HitDir
	ld	c,(hl)
	inc	c
	ld	a,#<(_Point_Dir)
	add	a, c
	ld	c,a
	ld	a,#>(_Point_Dir)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	c,a
	rla
	sbc	a, a
	ld	b,a
	ld	a,c
	ld	hl,#_BallPos_y
	add	a, (hl)
	ld	c,a
	ld	a,b
	inc	hl
	adc	a, (hl)
	ld	b,a
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	add	sp, #2
	ret
_Point_Dir:
	.db #0x05	;  5
	.db #0x0f	;  15
	.db #0x0b	;  11
	.db #0x0b	;  11
	.db #0x0f	;  15
	.db #0x05	;  5
	.db #0x10	;  16
	.db #0x00	;  0
	.db #0x0f	;  15
	.db #0xfb	; -5
	.db #0x0b	;  11
	.db #0xf5	; -11
	.db #0x05	;  5
	.db #0xf1	; -15
	.db #0x00	;  0
	.db #0xf0	; -16
	.db #0xfb	; -5
	.db #0xf1	; -15
	.db #0xf5	; -11
	.db #0xf5	; -11
	.db #0xf1	; -15
	.db #0xfb	; -5
	.db #0xf0	; -16
	.db #0x00	;  0
	.db #0xf1	; -15
	.db #0x05	;  5
	.db #0xf5	; -11
	.db #0x0b	;  11
	.db #0xfb	; -5
	.db #0x0f	;  15
	.db #0x00	;  0
	.db #0x10	;  16
;SpritePointer.c:43: void Update_SPRITE_POINTER() {
;	---------------------------------
; Function Update_SPRITE_POINTER
; ---------------------------------
_Update_SPRITE_POINTER::
	add	sp, #-2
;SpritePointer.c:45: THIS->x = BallPos_x + Point_Dir[HitDir];
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
	ld	a,#<(_Point_Dir)
	ld	hl,#_HitDir
	add	a, (hl)
	ld	c,a
	ld	a,#>(_Point_Dir)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	c,a
	rla
	sbc	a, a
	ld	b,a
	ld	a,c
	ld	hl,#_BallPos_x
	add	a, (hl)
	ld	c,a
	ld	a,b
	inc	hl
	adc	a, (hl)
	ld	b,a
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;SpritePointer.c:46: THIS->y = BallPos_y + Point_Dir[1+HitDir];
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0009
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	ld	hl,#_HitDir
	ld	c,(hl)
	inc	c
	ld	a,#<(_Point_Dir)
	add	a, c
	ld	c,a
	ld	a,#>(_Point_Dir)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	c,a
	rla
	sbc	a, a
	ld	b,a
	ld	a,c
	ld	hl,#_BallPos_y
	add	a, (hl)
	ld	c,a
	ld	a,b
	inc	hl
	adc	a, (hl)
	ld	b,a
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;SpritePointer.c:48: if (Ball_State == 1) {THIS->x = 1000; THIS->y = 1000;}
	ld	hl,#_Ball_State
	ld	a,(hl)
	dec	a
	jr	NZ,00103$
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0007
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0xe8
	ld	(bc),a
	inc	bc
	ld	a,#0x03
	ld	(bc),a
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0009
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0xe8
	ld	(bc),a
	inc	bc
	ld	a,#0x03
	ld	(bc),a
00103$:
	add	sp, #2
	ret
;SpritePointer.c:51: void Destroy_SPRITE_POINTER() {
;	---------------------------------
; Function Destroy_SPRITE_POINTER
; ---------------------------------
_Destroy_SPRITE_POINTER::
;SpritePointer.c:52: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
