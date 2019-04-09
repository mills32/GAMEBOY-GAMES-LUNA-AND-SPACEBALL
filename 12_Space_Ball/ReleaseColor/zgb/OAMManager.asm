;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module OAMManager
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PopBank
	.globl _PushBank
	.globl _set_sprite_data
	.globl _oam1
	.globl _oam0
	.globl _oam
	.globl _oam_mirror
	.globl _sprites_pal
	.globl _last_sprite_loaded
	.globl _LoadSprite
	.globl _SwapOAMs
	.globl _ClearOAMs
	.globl _DrawOAMSprite
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_last_sprite_loaded::
	.ds 1
_sprites_pal::
	.ds 256
_oam_mirror	=	0xcf00
_oam::
	.ds 2
_oam0::
	.ds 2
_oam1::
	.ds 2
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
;C:/gbdk/ZGB/common/src/OAMManager.c:5: UINT8 last_sprite_loaded = 0;
	ld	hl,#_last_sprite_loaded
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/OAMManager.c:28: UINT8* oam  = (__REG)0xC000;
	ld	hl,#_oam
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xc0
;C:/gbdk/ZGB/common/src/OAMManager.c:29: UINT8* oam0 = (__REG)0xC000;
	ld	hl,#_oam0
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xc0
;C:/gbdk/ZGB/common/src/OAMManager.c:30: UINT8* oam1 = (__REG)0xCF00;
	ld	hl,#_oam1
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xcf
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;C:/gbdk/ZGB/common/src/OAMManager.c:8: UINT8 LoadSprite(UINT8 n_tiles, unsigned char* data, UINT8 bank, UINT8 frame_size, unsigned char* palette_idx) {
;	---------------------------------
; Function LoadSprite
; ---------------------------------
_LoadSprite::
	add	sp, #-4
;C:/gbdk/ZGB/common/src/OAMManager.c:10: UINT8* sprites_pal_ptr = &sprites_pal[last_sprite_loaded];
	ld	a,#<(_sprites_pal)
	ld	hl,#_last_sprite_loaded
	add	a, (hl)
	ld	c,a
	ld	a,#>(_sprites_pal)
	adc	a, #0x00
	ld	b,a
;C:/gbdk/ZGB/common/src/OAMManager.c:12: PUSH_BANK(bank);
	push	bc
	ldhl	sp,#11
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	bc
;C:/gbdk/ZGB/common/src/OAMManager.c:13: set_sprite_data(last_sprite_loaded, n_tiles, data);
	push	bc
	ldhl	sp,#9
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ldhl	sp,#10
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#_last_sprite_loaded
	ld	a,(hl)
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
	pop	bc
;C:/gbdk/ZGB/common/src/OAMManager.c:14: last_sprite_loaded += n_tiles;
	ld	hl,#_last_sprite_loaded
	ld	a,(hl)
	ldhl	sp,#6
	add	a, (hl)
	ld	hl,#_last_sprite_loaded
	ld	(hl),a
;C:/gbdk/ZGB/common/src/OAMManager.c:16: for(i = 0; i != n_tiles; ++i, sprites_pal_ptr ++) {
	ldhl	sp,#0
	ld	(hl),#0x00
00106$:
	ldhl	sp,#6
	ld	a,(hl)
	ldhl	sp,#0
	sub	a, (hl)
	jp	Z,00104$
;C:/gbdk/ZGB/common/src/OAMManager.c:17: if(palette_idx)
	ldhl	sp,#12
	ld	a,(hl-)
	or	a,(hl)
	jp	Z,00102$
;C:/gbdk/ZGB/common/src/OAMManager.c:18: *sprites_pal_ptr = *(palette_idx + (i >> frame_size)); 
	dec	hl
	ld	a,(hl)
	push	af
	ldhl	sp,#2
	ld	a,(hl)
	ldhl	sp,#5
	ld	(hl),a
	pop	af
	inc	a
	jr	00125$
00124$:
	ldhl	sp,#3
	srl	(hl)
00125$:
	dec	a
	jr	NZ,00124$
	ldhl	sp,#(12 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ldhl	sp,#3
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	(bc),a
	jr	00107$
00102$:
;C:/gbdk/ZGB/common/src/OAMManager.c:20: *sprites_pal_ptr = 0; 
	xor	a, a
	ld	(bc),a
00107$:
;C:/gbdk/ZGB/common/src/OAMManager.c:16: for(i = 0; i != n_tiles; ++i, sprites_pal_ptr ++) {
	ldhl	sp,#0
	inc	(hl)
	inc	bc
	jp	00106$
00104$:
;C:/gbdk/ZGB/common/src/OAMManager.c:22: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/OAMManager.c:24: return last_sprite_loaded - n_tiles;
	ld	hl,#_last_sprite_loaded
	ld	a,(hl)
	ldhl	sp,#6
	sub	a, (hl)
	ld	e,a
	add	sp, #4
	ret
;C:/gbdk/ZGB/common/src/OAMManager.c:31: void SwapOAMs() {
;	---------------------------------
; Function SwapOAMs
; ---------------------------------
_SwapOAMs::
;C:/gbdk/ZGB/common/src/OAMManager.c:33: UINT8* cached_oam = ((UINT8*)((UINT16)oam & 0xFF00) == (__REG)0xC000) ? oam0 : oam1;
	ld	hl,#_oam + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	c,#0x00
	ld	a,c
	or	a, a
	jr	NZ,00109$
	ld	a,b
	sub	a, #0xc0
	jr	NZ,00109$
	ld	hl,#_oam0 + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	jr	00110$
00109$:
	ld	hl,#_oam1 + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
00110$:
;C:/gbdk/ZGB/common/src/OAMManager.c:34: while(oam < cached_oam) {
00101$:
	ld	hl,#_oam
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	jr	NC,00103$
;C:/gbdk/ZGB/common/src/OAMManager.c:35: *oam = 200;
	ld	hl,#_oam + 1
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0xc8
	ld	(de),a
;C:/gbdk/ZGB/common/src/OAMManager.c:36: oam += 4;
	dec	hl
	ld	a,(hl)
	add	a, #0x04
	ld	(hl+),a
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
	jr	00101$
00103$:
;C:/gbdk/ZGB/common/src/OAMManager.c:39: if((0xFF00 & (UINT16)oam) == 0xC000) {
	ld	hl,#_oam + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	c,#0x00
	ld	a,c
	or	a, a
	jr	NZ,00105$
	ld	a,b
	sub	a, #0xc0
	jr	NZ,00105$
;C:/gbdk/ZGB/common/src/OAMManager.c:40: *(__REG)0xFF81 = 0xC0;
	ld	hl,#0xff81
	ld	(hl),#0xc0
;C:/gbdk/ZGB/common/src/OAMManager.c:41: oam0 = oam;
	ld	hl,#_oam
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_oam0
	ld	(hl+),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/OAMManager.c:42: oam = oam1;
	ld	hl,#_oam1
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_oam
	ld	(hl+),a
	ld	(hl),e
	jr	00106$
00105$:
;C:/gbdk/ZGB/common/src/OAMManager.c:44: *(__REG)0xFF81 = 0xCF;
	ld	hl,#0xff81
	ld	(hl),#0xcf
;C:/gbdk/ZGB/common/src/OAMManager.c:45: oam1 = oam;
	ld	hl,#_oam
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_oam1
	ld	(hl+),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/OAMManager.c:46: oam = oam0;
	ld	hl,#_oam0
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_oam
	ld	(hl+),a
	ld	(hl),e
00106$:
;C:/gbdk/ZGB/common/src/OAMManager.c:48: oam = (UINT8*)((UINT16)oam & 0xFF00);
	ld	hl,#_oam + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	c,#0x00
	dec	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ret
;C:/gbdk/ZGB/common/src/OAMManager.c:51: void ClearOAMs() {
;	---------------------------------
; Function ClearOAMs
; ---------------------------------
_ClearOAMs::
;C:/gbdk/ZGB/common/src/OAMManager.c:53: oam0 = (__REG)0xC000;
	ld	hl,#_oam0
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xc0
;C:/gbdk/ZGB/common/src/OAMManager.c:54: oam1 = (__REG)0xCF00;
	ld	hl,#_oam1
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xcf
;C:/gbdk/ZGB/common/src/OAMManager.c:55: for(i = 0; i < 40; ++i, oam0 += 4, oam1 += 4) {
	ld	c,#0x00
00102$:
;C:/gbdk/ZGB/common/src/OAMManager.c:56: *oam0 = 200;
	ld	hl,#_oam0 + 1
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0xc8
	ld	(de),a
;C:/gbdk/ZGB/common/src/OAMManager.c:57: *oam1 = 200;
	ld	hl,#_oam1 + 1
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0xc8
	ld	(de),a
;C:/gbdk/ZGB/common/src/OAMManager.c:55: for(i = 0; i < 40; ++i, oam0 += 4, oam1 += 4) {
	inc	c
	ld	hl,#_oam0
	ld	a,(hl)
	add	a, #0x04
	ld	(hl+),a
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
	ld	hl,#_oam1
	ld	a,(hl)
	add	a, #0x04
	ld	(hl+),a
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
	ld	a,c
	sub	a, #0x28
	jp	C,00102$
	ret
;C:/gbdk/ZGB/common/src/OAMManager.c:61: void DrawOAMSprite(UINT8 y, UINT8 x, UINT8 idx, UINT8 flags) {
;	---------------------------------
; Function DrawOAMSprite
; ---------------------------------
_DrawOAMSprite::
;C:/gbdk/ZGB/common/src/OAMManager.c:91: __endasm;
;store	in bc the address stored in oam ptr
	ld	hl,#_oam
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;store	in hl the beginning of data (pointer to first param)
	ldhl	sp,#2
;OAMManager.c:35:	*(oam ++) = y;
	ld	a,(hl+)
	ld	(bc),a
	inc	c
;OAMManager.c:36:	*(oam ++) = x;
	ld	a,(hl+)
	ld	(bc),a
	inc	c
;OAMManager.c:37:	*(oam ++) = idx;
	ld	a,(hl+)
	ld	(bc),a
	inc	c
;OAMManager.c:38:	*(oam ++) = flags;
	ld	a,(hl+)
	ld	(bc),a
	inc	c
;refresh	oam value
	ld	hl,#_oam
	ld	(hl), c
	ret
	.area _CODE
	.area _CABS (ABS)
