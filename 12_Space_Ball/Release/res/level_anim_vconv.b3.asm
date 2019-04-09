;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module level_anim_vconv_b3
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _level_anim_vconv
	.globl _level_anim_vconvCGB
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
	.area _CODE
	.area _CODE_3
_level_anim_vconvCGB:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_level_anim_vconv:
	.db #0x18	; 24
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x81	; 129
	.area _CABS (ABS)
