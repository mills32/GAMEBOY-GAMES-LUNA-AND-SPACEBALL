;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module Fade
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FadeOut_b
	.globl _FadeIn_b
	.globl _PopBank
	.globl _PushBank
	.globl _FadeIn
	.globl _FadeOut
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
;C:/gbdk/ZGB/common/src/Fade.c:5: void FadeIn() {
;	---------------------------------
; Function FadeIn
; ---------------------------------
_FadeIn::
;C:/gbdk/ZGB/common/src/Fade.c:6: PUSH_BANK(fade_bank);
	ld	hl,#_fade_bank
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/Fade.c:7: FadeIn_b();
	call	_FadeIn_b
;C:/gbdk/ZGB/common/src/Fade.c:8: POP_BANK;
	jp	_PopBank
;C:/gbdk/ZGB/common/src/Fade.c:12: void FadeOut() {
;	---------------------------------
; Function FadeOut
; ---------------------------------
_FadeOut::
;C:/gbdk/ZGB/common/src/Fade.c:13: PUSH_BANK(fade_bank);
	ld	hl,#_fade_bank
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/Fade.c:14: FadeOut_b();
	call	_FadeOut_b
;C:/gbdk/ZGB/common/src/Fade.c:15: POP_BANK;
	jp	_PopBank
	.area _CODE
	.area _CABS (ABS)
