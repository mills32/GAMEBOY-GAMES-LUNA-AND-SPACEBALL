;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module Keys
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _keys
	.globl _previous_KEYS
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_previous_KEYS::
	.ds 1
_keys::
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
;C:/gbdk/ZGB/common/src/Keys.c:3: UBYTE previous_KEYS = 0;
	ld	hl,#_previous_KEYS
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Keys.c:4: UBYTE keys = 0;
	ld	hl,#_keys
	ld	(hl),#0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _CABS (ABS)
