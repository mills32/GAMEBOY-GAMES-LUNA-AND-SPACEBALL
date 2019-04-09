;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module sprite_rocket_b3
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _spriterocket
	.globl _spriterocketCGB
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
_spriterocketCGB:
	.db #0x07	; 7
_spriterocket:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0x9f	; 159
	.db #0x78	; 120	'x'
	.db #0x4f	; 79	'O'
	.db #0x3c	; 60
	.db #0x27	; 39
	.db #0x1e	; 30
	.db #0x13	; 19
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x38	; 56	'8'
	.db #0x3f	; 63
	.db #0x78	; 120	'x'
	.db #0x4f	; 79	'O'
	.db #0x78	; 120	'x'
	.db #0x4f	; 79	'O'
	.db #0xf8	; 248
	.db #0x8f	; 143
	.db #0xf0	; 240
	.db #0x9f	; 159
	.db #0xf1	; 241
	.db #0x9f	; 159
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0x3f	; 63
	.db #0xe0	; 224
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf1	; 241
	.db #0x9f	; 159
	.db #0xf0	; 240
	.db #0x9f	; 159
	.db #0xf8	; 248
	.db #0x8f	; 143
	.db #0x78	; 120	'x'
	.db #0x4f	; 79	'O'
	.db #0x78	; 120	'x'
	.db #0x4f	; 79	'O'
	.db #0x38	; 56	'8'
	.db #0x3f	; 63
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x1e	; 30
	.db #0x13	; 19
	.db #0x3c	; 60
	.db #0x27	; 39
	.db #0x78	; 120	'x'
	.db #0x4f	; 79	'O'
	.db #0xf0	; 240
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x10	; 16
	.db #0xf0	; 240
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
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xfe	; 254
	.db #0x0e	; 14
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xcc	; 204
	.db #0xff	; 255
	.db #0xf4	; 244
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x98	; 152
	.db #0xff	; 255
	.db #0x70	; 112	'p'
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
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xe8	; 232
	.db #0x38	; 56	'8'
	.db #0xc4	; 196
	.db #0x7c	; 124
	.db #0xce	; 206
	.db #0x7a	; 122	'z'
	.db #0xce	; 206
	.db #0x7a	; 122	'z'
	.db #0x9f	; 159
	.db #0xf1	; 241
	.db #0x9f	; 159
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x0e	; 14
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0xf1	; 241
	.db #0x9f	; 159
	.db #0xf1	; 241
	.db #0xce	; 206
	.db #0x7a	; 122	'z'
	.db #0xce	; 206
	.db #0x7a	; 122	'z'
	.db #0xc4	; 196
	.db #0x7c	; 124
	.db #0xe8	; 232
	.db #0x38	; 56	'8'
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
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
