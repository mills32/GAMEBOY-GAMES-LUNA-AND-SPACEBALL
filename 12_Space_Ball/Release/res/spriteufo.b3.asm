;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module spriteufo_b3
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _spriteufo
	.globl _spriteufoCGB
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
_spriteufoCGB:
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
_spriteufo:
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x21	; 33
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x38	; 56	'8'
	.db #0x3f	; 63
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0xfc	; 252
	.db #0x54	; 84	'T'
	.db #0xfc	; 252
	.db #0xac	; 172
	.db #0xfc	; 252
	.db #0x54	; 84	'T'
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x21	; 33
	.db #0x3f	; 63
	.db #0x3a	; 58
	.db #0x47	; 71	'G'
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x30	; 48	'0'
	.db #0x3f	; 63
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xf8	; 248
	.db #0x58	; 88	'X'
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0xfc	; 252
	.db #0x54	; 84	'T'
	.db #0xfc	; 252
	.db #0xac	; 172
	.db #0xfc	; 252
	.db #0x54	; 84	'T'
	.db #0xfc	; 252
	.db #0xbc	; 188
	.db #0xe2	; 226
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x38	; 56	'8'
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x21	; 33
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x38	; 56	'8'
	.db #0x3f	; 63
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0xfc	; 252
	.db #0x54	; 84	'T'
	.db #0xfc	; 252
	.db #0xac	; 172
	.db #0xfc	; 252
	.db #0x54	; 84	'T'
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x27	; 39
	.db #0x38	; 56	'8'
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x3c	; 60
	.db #0x3f	; 63
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xf8	; 248
	.db #0x58	; 88	'X'
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0xfc	; 252
	.db #0x54	; 84	'T'
	.db #0xfc	; 252
	.db #0xac	; 172
	.db #0xfc	; 252
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x1c	; 28
	.db #0xfc	; 252
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.area _CABS (ABS)
