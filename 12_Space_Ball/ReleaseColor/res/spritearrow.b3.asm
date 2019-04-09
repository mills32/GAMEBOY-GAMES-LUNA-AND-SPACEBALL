;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module spritearrow_b3
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _spritearrow
	.globl _spritearrowCGB
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
_spritearrowCGB:
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x05	; 5
_spritearrow:
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0x8f	; 143
	.db #0xf0	; 240
	.db #0x87	; 135
	.db #0xf8	; 248
	.db #0x83	; 131
	.db #0xfc	; 252
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x42	; 66	'B'
	.db #0x7f	; 127
	.db #0x45	; 69	'E'
	.db #0x7d	; 125
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x90	; 144
	.db #0x78	; 120	'x'
	.db #0x88	; 136
	.db #0x3c	; 60
	.db #0xc4	; 196
	.db #0x1c	; 28
	.db #0xe4	; 228
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x84	; 132
	.db #0xfc	; 252
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0x8f	; 143
	.db #0xf0	; 240
	.db #0x87	; 135
	.db #0xf8	; 248
	.db #0x83	; 131
	.db #0xfc	; 252
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0xfe	; 254
	.db #0x47	; 71	'G'
	.db #0x7c	; 124
	.db #0x4f	; 79	'O'
	.db #0x78	; 120	'x'
	.db #0x47	; 71	'G'
	.db #0x7c	; 124
	.db #0x3b	; 59
	.db #0x3a	; 58
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf4	; 244
	.db #0x14	; 20
	.db #0xee	; 238
	.db #0x2a	; 42
	.db #0x7f	; 127
	.db #0x91	; 145
	.db #0xff	; 255
	.db #0xa0	; 160
	.db #0xff	; 255
	.db #0x41	; 65	'A'
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x0c	; 12
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0x8f	; 143
	.db #0xf0	; 240
	.db #0x87	; 135
	.db #0xf8	; 248
	.db #0x83	; 131
	.db #0xfc	; 252
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0x87	; 135
	.db #0xfc	; 252
	.db #0x87	; 135
	.db #0xfc	; 252
	.db #0x83	; 131
	.db #0xfe	; 254
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x42	; 66	'B'
	.db #0x7f	; 127
	.db #0x45	; 69	'E'
	.db #0x7d	; 125
	.db #0x3b	; 59
	.db #0x3a	; 58
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x17	; 23
	.db #0xef	; 239
	.db #0xa9	; 169
	.db #0xff	; 255
	.db #0x51	; 81	'Q'
	.db #0xfe	; 254
	.db #0x22	; 34
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x8c	; 140
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfe	; 254
	.db #0x22	; 34
	.db #0xff	; 255
	.db #0x71	; 113	'q'
	.db #0x8f	; 143
	.db #0x89	; 137
	.db #0x07	; 7
	.db #0x07	; 7
	.area _CABS (ABS)
