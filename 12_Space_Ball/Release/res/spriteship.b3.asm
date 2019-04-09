;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module spriteship_b3
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _spriteship
	.globl _spriteshipCGB
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
_spriteshipCGB:
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
_spriteship:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x30	; 48	'0'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0xc7	; 199
	.db #0xb8	; 184
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0x65	; 101	'e'
	.db #0xdf	; 223
	.db #0x7f	; 127
	.db #0xc8	; 200
	.db #0x78	; 120	'x'
	.db #0x8b	; 139
	.db #0xfb	; 251
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x3d	; 61
	.db #0xff	; 255
	.db #0xc5	; 197
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x0b	; 11
	.db #0xfb	; 251
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x31	; 49	'1'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0xc7	; 199
	.db #0xb8	; 184
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x4f	; 79	'O'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xa7	; 167
	.db #0xe7	; 231
	.db #0xdf	; 223
	.db #0x7d	; 125
	.db #0xcf	; 207
	.db #0x7f	; 127
	.db #0xcb	; 203
	.db #0x7b	; 123
	.db #0x85	; 133
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x1d	; 29
	.db #0xff	; 255
	.db #0xe5	; 229
	.db #0xff	; 255
	.db #0x0b	; 11
	.db #0xfb	; 251
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x33	; 51	'3'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0xc7	; 199
	.db #0xb8	; 184
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0x7f	; 127
	.db #0x4e	; 78	'N'
	.db #0x7f	; 127
	.db #0x21	; 33
	.db #0x3f	; 63
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0x7d	; 125
	.db #0xcf	; 207
	.db #0x7f	; 127
	.db #0xc5	; 197
	.db #0x7f	; 127
	.db #0x85	; 133
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x35	; 53	'5'
	.db #0xff	; 255
	.db #0xcb	; 203
	.db #0xfb	; 251
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x31	; 49	'1'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0xc7	; 199
	.db #0xb8	; 184
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x4f	; 79	'O'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xa7	; 167
	.db #0xe7	; 231
	.db #0xdf	; 223
	.db #0x7d	; 125
	.db #0xcf	; 207
	.db #0x7f	; 127
	.db #0xcb	; 203
	.db #0x7b	; 123
	.db #0x85	; 133
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x1d	; 29
	.db #0xff	; 255
	.db #0xe5	; 229
	.db #0xff	; 255
	.db #0x0b	; 11
	.db #0xfb	; 251
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xc0	; 192
	.area _CABS (ABS)
