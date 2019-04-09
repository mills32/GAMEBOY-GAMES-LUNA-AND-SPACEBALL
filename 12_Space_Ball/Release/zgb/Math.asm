;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module Math
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _DespRight
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;C:/gbdk/ZGB/common/src/Math.c:3: INT16 DespRight(INT16 a, INT16 b) {
;	---------------------------------
; Function DespRight
; ---------------------------------
_DespRight::
;C:/gbdk/ZGB/common/src/Math.c:4: return a >> b;
	ldhl	sp,#4
	ld	a,(hl)
	push	af
	dec	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	pop	af
	inc	a
	jr	00104$
00103$:
	sra	d
	rr	e
00104$:
	dec	a
	jr	NZ,00103$
	ret
	.area _CODE
	.area _CABS (ABS)
