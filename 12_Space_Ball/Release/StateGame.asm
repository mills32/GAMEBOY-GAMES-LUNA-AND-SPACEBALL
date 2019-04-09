;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module StateGame
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Update_STATE_GAME
	.globl _Start_STATE_GAME
	.globl _bank_STATE_GAME
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_GAME::
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
;StateGame.c:6: UINT8 bank_STATE_GAME = 2;
	ld	hl,#_bank_STATE_GAME
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
;StateGame.c:15: void Start_STATE_GAME() {
;	---------------------------------
; Function Start_STATE_GAME
; ---------------------------------
_Start_STATE_GAME::
;StateGame.c:17: }
	ret
;StateGame.c:19: void Update_STATE_GAME() {
;	---------------------------------
; Function Update_STATE_GAME
; ---------------------------------
_Update_STATE_GAME::
;StateGame.c:22: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
