;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module StateCredits
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Update_STATE_CREDITS
	.globl _Start_STATE_CREDITS
	.globl _bank_STATE_CREDITS
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_CREDITS::
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
;StateCredits.c:6: UINT8 bank_STATE_CREDITS = 2;
	ld	hl,#_bank_STATE_CREDITS
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
;StateCredits.c:15: void Start_STATE_CREDITS() {
;	---------------------------------
; Function Start_STATE_CREDITS
; ---------------------------------
_Start_STATE_CREDITS::
;StateCredits.c:17: }
	ret
;StateCredits.c:19: void Update_STATE_CREDITS() {
;	---------------------------------
; Function Update_STATE_CREDITS
; ---------------------------------
_Update_STATE_CREDITS::
;StateCredits.c:22: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
