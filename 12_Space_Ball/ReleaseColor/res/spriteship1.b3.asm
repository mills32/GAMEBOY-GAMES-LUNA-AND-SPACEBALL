;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module spriteship1_b3
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _spriteship1
	.globl _spriteship1CGB
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
_spriteship1CGB:
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x03	; 3
_spriteship1:
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xbf	; 191
	.db #0xd8	; 216
	.db #0x9f	; 159
	.db #0xf8	; 248
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x30	; 48	'0'
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x17	; 23
	.db #0x17	; 23
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x5f	; 95
	.db #0x5f	; 95
	.db #0xaf	; 175
	.db #0xa9	; 169
	.db #0x5f	; 95
	.db #0x51	; 81	'Q'
	.db #0xff	; 255
	.db #0xe1	; 225
	.db #0xfd	; 253
	.db #0x03	; 3
	.db #0xf9	; 249
	.db #0x07	; 7
	.db #0xf1	; 241
	.db #0xaf	; 175
	.db #0xe2	; 226
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0x8f	; 143
	.db #0xf0	; 240
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x30	; 48	'0'
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x17	; 23
	.db #0x17	; 23
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x5f	; 95
	.db #0x5f	; 95
	.db #0xaf	; 175
	.db #0xa9	; 169
	.db #0x5f	; 95
	.db #0x51	; 81	'Q'
	.db #0xff	; 255
	.db #0xe1	; 225
	.db #0xfd	; 253
	.db #0x03	; 3
	.db #0xf9	; 249
	.db #0x07	; 7
	.db #0xf1	; 241
	.db #0xaf	; 175
	.db #0xe2	; 226
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _CABS (ABS)
