;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module Fade_b
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FadeOut_b
	.globl _FadeOutColor
	.globl _FadeOutDMG
	.globl _FadeIn_b
	.globl _FadeInCOLOR
	.globl _FadeStepColor
	.globl _UpdateColor
	.globl _FadeInDMG
	.globl _FadeDMG
	.globl _FadeInOp
	.globl _DespRight
	.globl _delay
	.globl _set_sprite_palette
	.globl _set_bkg_palette
	.globl _ZGB_Fading_SPal
	.globl _ZGB_Fading_BPal
	.globl _fade_bank
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_fade_bank::
	.ds 1
_ZGB_Fading_BPal::
	.ds 64
_ZGB_Fading_SPal::
	.ds 64
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
;C:/gbdk/ZGB/common/src/Fade_b.c:3: UINT8 fade_bank = 1;
	ld	hl,#_fade_bank
	ld	(hl),#0x01
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_1
;C:/gbdk/ZGB/common/src/Fade_b.c:12: UINT8 FadeInOp(UINT16 c, UINT16 i) {
;	---------------------------------
; Function FadeInOp
; ---------------------------------
_FadeInOp::
;C:/gbdk/ZGB/common/src/Fade_b.c:13: return U_LESS_THAN(c, i) ? 0: (c - i);
	ldhl	sp,#(3 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	a,e
	sub	a,l
	ld	e,a
	ld	a,d
	sbc	a,h
	ld	b,a
	ld	c,e
	bit	7, b
	jr	Z,00103$
	ld	a,#0x00
	jr	00104$
00103$:
	ldhl	sp,#2
	ld	c,(hl)
	inc	hl
	inc	hl
	ld	b,(hl)
	ld	a,c
	sub	a, b
00104$:
	ld	e,a
	ret
;C:/gbdk/ZGB/common/src/Fade_b.c:16: void FadeDMG(UINT8 fadeout) {
;	---------------------------------
; Function FadeDMG
; ---------------------------------
_FadeDMG::
	add	sp, #-39
;C:/gbdk/ZGB/common/src/Fade_b.c:18: UINT8* pals[] = {(UINT8*)0xFF47, (UINT8*)0xFF48, (UINT8*)0xFF49};
	ldhl	sp,#16
	ld	a,l
	ld	d,h
	ldhl	sp,#27
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x47
	inc	hl
	ld	(hl),#0xff
	ldhl	sp,#(28 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0002
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#24
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x48
	inc	hl
	ld	(hl),#0xff
	ldhl	sp,#(28 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#35
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x49
	inc	hl
	ld	(hl),#0xff
;C:/gbdk/ZGB/common/src/Fade_b.c:20: UINT8* c = colors;
	ldhl	sp,#0
	ld	a,l
	ld	d,h
	ldhl	sp,#22
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#33
	ld	(hl+),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/Fade_b.c:24: for(i = 0; i != 3; ++i) {
	ldhl	sp,#14
	ld	(hl),#0x00
00106$:
;C:/gbdk/ZGB/common/src/Fade_b.c:25: p = (UINT8)*(pals[i]);
	ldhl	sp,#14
	ld	c,(hl)
	ld	b,#0x00
	sla	c
	rl	b
	ldhl	sp,#27
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	a,(bc)
	ldhl	sp,#26
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Fade_b.c:26: for(j = 0; j != 8; j += 2, ++c) {
	ldhl	sp,#15
	ld	(hl),#0x00
	ldhl	sp,#(34 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
00104$:
;C:/gbdk/ZGB/common/src/Fade_b.c:27: *c = (DespRight(p, j)) & 0x3;
	ldhl	sp,#15
	ld	a,(hl)
	ldhl	sp,#29
	ld	(hl+),a
	ld	(hl),#0x00
	ldhl	sp,#26
	ld	e,(hl)
	ld	d,#0x00
	push	bc
	ldhl	sp,#31
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	de
	call	_DespRight
	add	sp, #4
	pop	bc
	ld	a,e
	and	a, #0x03
	ld	e,a
	ld	d,#0x00
	ld	a,e
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Fade_b.c:26: for(j = 0; j != 8; j += 2, ++c) {
	ldhl	sp,#15
	inc	(hl)
	inc	(hl)
	inc	bc
	ld	a,(hl)
	sub	a, #0x08
	jp	NZ,00104$
;C:/gbdk/ZGB/common/src/Fade_b.c:24: for(i = 0; i != 3; ++i) {
	ldhl	sp,#33
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ldhl	sp,#14
	inc	(hl)
	ld	a,(hl)
	sub	a, #0x03
	jp	NZ,00106$
;C:/gbdk/ZGB/common/src/Fade_b.c:31: for(i = 0; i != 4; ++i) {
	ldhl	sp,#(23 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#29
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#14
	ld	(hl),#0x00
00108$:
;C:/gbdk/ZGB/common/src/Fade_b.c:32: p = fadeout ? 3 - i : i;
	ldhl	sp,#41
	ld	a,(hl)
	or	a, a
	jr	Z,00112$
	ld	a,#0x03
	ldhl	sp,#14
	sub	a, (hl)
	ld	c,a
	jr	00113$
00112$:
	ldhl	sp,#14
	ld	c,(hl)
00113$:
;C:/gbdk/ZGB/common/src/Fade_b.c:33: c = &colors[1 << 2];
	ldhl	sp,#29
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#12
	ld	(hl+),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/Fade_b.c:34: *pals[0] = PAL_DEF(FadeInOp(c[0], p), FadeInOp(c[1], p), FadeInOp(c[2], p), FadeInOp(c[3], p));
	ldhl	sp,#(28 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#33
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ld	b,#0x00
	ldhl	sp,#(13 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0003
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#22
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	push	bc
	push	bc
	push	de
	call	_FadeInOp
	add	sp, #4
	pop	bc
	ld	a,e
	swap	a
	and	a,#0xf0
	add	a, a
	add	a, a
	ldhl	sp,#26
	ld	(hl),a
	ldhl	sp,#(13 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0002
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#37
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	push	bc
	push	bc
	push	de
	call	_FadeInOp
	add	sp, #4
	pop	bc
	ld	a,e
	swap	a
	and	a,#0xf0
	ldhl	sp,#26
	or	a, (hl)
	ld	(hl),a
	ldhl	sp,#(13 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0001
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#31
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	push	bc
	push	bc
	push	de
	call	_FadeInOp
	add	sp, #4
	pop	bc
	ld	a,e
	add	a, a
	add	a, a
	ldhl	sp,#26
	or	a, (hl)
	ld	(hl),a
	ldhl	sp,#(13 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	push	bc
	push	bc
	push	de
	call	_FadeInOp
	add	sp, #4
	pop	bc
	ldhl	sp,#26
	ld	a,(hl)
	or	a, e
	ldhl	sp,#(34 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
;C:/gbdk/ZGB/common/src/Fade_b.c:36: *pals[1] = PAL_DEF(FadeInOp(c[2], p), FadeInOp(c[0], p), FadeInOp(c[1], p), FadeInOp(c[3], p));
	ldhl	sp,#(25 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#33
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#(23 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	push	bc
	push	bc
	push	de
	call	_FadeInOp
	add	sp, #4
	pop	bc
	ld	a,e
	swap	a
	and	a,#0xf0
	add	a, a
	add	a, a
	ldhl	sp,#26
	ld	(hl),a
	ldhl	sp,#(32 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	push	bc
	push	bc
	push	de
	call	_FadeInOp
	add	sp, #4
	pop	bc
	ld	a,e
	swap	a
	and	a,#0xf0
	ldhl	sp,#26
	or	a, (hl)
	ld	(hl),a
	ldhl	sp,#(13 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	push	bc
	push	bc
	push	de
	call	_FadeInOp
	add	sp, #4
	pop	bc
	ld	a,e
	add	a, a
	add	a, a
	ldhl	sp,#26
	or	a, (hl)
	ld	(hl),a
	ldhl	sp,#(38 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	push	bc
	push	bc
	push	de
	call	_FadeInOp
	add	sp, #4
	pop	bc
	ldhl	sp,#26
	ld	a,(hl)
	or	a, e
	ldhl	sp,#(34 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
;C:/gbdk/ZGB/common/src/Fade_b.c:37: *pals[2] = PAL_DEF(FadeInOp(c[2], p), FadeInOp(c[0], p), FadeInOp(c[1], p), FadeInOp(c[3], p));
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#33
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ldhl	sp,#(23 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	push	bc
	push	bc
	push	de
	call	_FadeInOp
	add	sp, #4
	pop	bc
	ld	a,e
	swap	a
	and	a,#0xf0
	add	a, a
	add	a, a
	ldhl	sp,#26
	ld	(hl),a
	ldhl	sp,#(32 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	push	bc
	push	bc
	push	de
	call	_FadeInOp
	add	sp, #4
	pop	bc
	ld	a,e
	swap	a
	and	a,#0xf0
	ldhl	sp,#26
	or	a, (hl)
	ldhl	sp,#31
	ld	(hl),a
	ldhl	sp,#(13 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	push	bc
	push	bc
	push	de
	call	_FadeInOp
	add	sp, #4
	pop	bc
	ld	a,e
	add	a, a
	add	a, a
	ldhl	sp,#31
	or	a, (hl)
	ld	(hl),a
	ldhl	sp,#(38 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	push	bc
	push	de
	call	_FadeInOp
	add	sp, #4
	ldhl	sp,#31
	ld	a,(hl)
	or	a, e
	ld	c,a
	inc	hl
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
;C:/gbdk/ZGB/common/src/Fade_b.c:38: delay(50);
	ld	hl,#0x0032
	push	hl
	call	_delay
	add	sp, #2
;C:/gbdk/ZGB/common/src/Fade_b.c:31: for(i = 0; i != 4; ++i) {
	ldhl	sp,#14
	inc	(hl)
	ld	a,(hl)
	sub	a, #0x04
	jp	NZ,00108$
	add	sp, #39
	ret
;C:/gbdk/ZGB/common/src/Fade_b.c:42: void FadeInDMG() {
;	---------------------------------
; Function FadeInDMG
; ---------------------------------
_FadeInDMG::
;C:/gbdk/ZGB/common/src/Fade_b.c:43: FadeDMG(0);
	xor	a, a
	push	af
	inc	sp
	call	_FadeDMG
	inc	sp
	ret
;C:/gbdk/ZGB/common/src/Fade_b.c:46: UWORD UpdateColor(UINT8 i, UWORD col) {
;	---------------------------------
; Function UpdateColor
; ---------------------------------
_UpdateColor::
	add	sp, #-4
;C:/gbdk/ZGB/common/src/Fade_b.c:48: return RGB2(PAL_RED(col) | DespRight(0x1F, 5 - i), PAL_GREEN(col) | DespRight(0x1F, 5 - i), PAL_BLUE(col) | DespRight(0x1F, 5 - i));
	ldhl	sp,#7
	ld	a,(hl)
	and	a, #0x1f
	ldhl	sp,#2
	ld	(hl+),a
	ld	(hl),#0x00
	ldhl	sp,#6
	ld	c,(hl)
	ld	b,#0x00
	ld	a,#0x05
	sub	a, c
	ld	c,a
	ld	a,#0x00
	sbc	a, b
	ld	b,a
	push	bc
	push	bc
	ld	hl,#0x001f
	push	hl
	call	_DespRight
	add	sp, #4
	pop	bc
	ldhl	sp,#2
	ld	a,(hl)
	or	a, e
	ld	(hl+),a
	ld	a,(hl)
	or	a, d
	ld	(hl),a
	ldhl	sp,#(8 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ld	a,e
	and	a, #0x1f
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),#0x00
	push	bc
	push	bc
	ld	hl,#0x001f
	push	hl
	call	_DespRight
	add	sp, #4
	pop	bc
	ld	a,e
	ldhl	sp,#0
	or	a, (hl)
	ld	e,a
	ld	a,d
	inc	hl
	or	a, (hl)
	ld	d,a
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	inc	hl
	ld	a,(hl)
	or	a, e
	dec	hl
	dec	hl
	ld	(hl),a
	ldhl	sp,#3
	ld	a,(hl)
	or	a, d
	dec	hl
	dec	hl
	ld	(hl),a
	ldhl	sp,#8
	ld	a,(hl)
	rrca
	rrca
	and	a,#0x3f
	ld	d,a
	ld	e,#0x00
	ld	a,d
	and	a, #0x1f
	ld	d,a
	ld	e,#0x00
	push	de
	push	bc
	ld	hl,#0x001f
	push	hl
	call	_DespRight
	add	sp, #4
	ld	c,e
	ld	b,d
	pop	de
	ld	a,d
	or	a, c
	ld	d,a
	ld	a,e
	or	a, b
	ld	c,a
	ld	c,#0x00
	sla	c
	rl	d
	sla	c
	rl	d
	ldhl	sp,#0
	ld	a,(hl)
	or	a, c
	ld	e,a
	inc	hl
	ld	a,(hl)
	or	a, d
	ld	d,a
	add	sp, #4
	ret
;C:/gbdk/ZGB/common/src/Fade_b.c:51: void FadeStepColor(UINT8 i) {
;	---------------------------------
; Function FadeStepColor
; ---------------------------------
_FadeStepColor::
	add	sp, #-36
;C:/gbdk/ZGB/common/src/Fade_b.c:55: UWORD* col = ZGB_Fading_BPal;
	ld	bc,#_ZGB_Fading_BPal
;C:/gbdk/ZGB/common/src/Fade_b.c:56: UWORD* col_s = ZGB_Fading_SPal;
	ldhl	sp,#0
	ld	(hl),#<(_ZGB_Fading_SPal)
	inc	hl
	ld	(hl),#>(_ZGB_Fading_SPal)
;C:/gbdk/ZGB/common/src/Fade_b.c:58: for(pal = 0; pal < 8; pal ++) {
	ldhl	sp,#2
	ld	a,l
	ld	d,h
	ldhl	sp,#30
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#12
	ld	a,l
	ld	d,h
	ldhl	sp,#28
	ld	(hl+),a
	ld	(hl),d
	inc	hl
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#24
	ld	(hl+),a
	ld	(hl),e
	ldhl	sp,#28
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#22
	ld	(hl+),a
	ld	(hl),e
	ldhl	sp,#11
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Fade_b.c:59: for(c = 0; c < 4; ++c, ++col, ++col_s) {
00109$:
	ldhl	sp,#10
	ld	(hl),#0x00
	ldhl	sp,#32
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ldhl	sp,#0
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#26
	ld	(hl+),a
	ld	(hl),e
00103$:
;C:/gbdk/ZGB/common/src/Fade_b.c:60: palette[c] = UpdateColor(i, *col);
	ldhl	sp,#10
	ld	c,(hl)
	ld	b,#0x00
	sla	c
	rl	b
	ldhl	sp,#20
	ld	(hl),c
	inc	hl
	ld	(hl),b
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ldhl	sp,#30
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#34
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	dec	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	push	bc
	ldhl	sp,#40
	ld	a,(hl)
	push	af
	inc	sp
	call	_UpdateColor
	add	sp, #3
	ld	c,e
	ld	b,d
	ldhl	sp,#34
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/Fade_b.c:61: palette_s[c] = UpdateColor(i, *col_s);
	ldhl	sp,#(21 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ldhl	sp,#28
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#34
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#(27 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	push	bc
	ldhl	sp,#40
	ld	a,(hl)
	push	af
	inc	sp
	call	_UpdateColor
	add	sp, #3
	ld	c,e
	ld	b,d
	ldhl	sp,#34
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/Fade_b.c:59: for(c = 0; c < 4; ++c, ++col, ++col_s) {
	ldhl	sp,#10
	inc	(hl)
	ldhl	sp,#(33 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0002
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#32
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#(27 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0002
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#26
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#10
	ld	a,(hl)
	sub	a, #0x04
	jp	C,00103$
;C:/gbdk/ZGB/common/src/Fade_b.c:63: set_bkg_palette(pal, 1, palette);
	ldhl	sp,#(33 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ldhl	sp,#26
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
	ldhl	sp,#(25 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	push	de
	ld	a,#0x01
	push	af
	inc	sp
	ldhl	sp,#16
	ld	a,(hl)
	push	af
	inc	sp
	call	_set_bkg_palette
	add	sp, #4
	pop	bc
;C:/gbdk/ZGB/common/src/Fade_b.c:64: set_sprite_palette(pal, 1, palette_s);
	ldhl	sp,#(23 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	push	de
	ld	a,#0x01
	push	af
	inc	sp
	ldhl	sp,#16
	ld	a,(hl)
	push	af
	inc	sp
	call	_set_sprite_palette
	add	sp, #4
	pop	bc
;C:/gbdk/ZGB/common/src/Fade_b.c:58: for(pal = 0; pal < 8; pal ++) {
	ldhl	sp,#11
	inc	(hl)
	ld	a,(hl)
	sub	a, #0x08
	jp	C,00109$
;C:/gbdk/ZGB/common/src/Fade_b.c:66: delay(20);
	ld	hl,#0x0014
	push	hl
	call	_delay
	add	sp, #2
	add	sp, #36
	ret
;C:/gbdk/ZGB/common/src/Fade_b.c:69: void FadeInCOLOR() {
;	---------------------------------
; Function FadeInCOLOR
; ---------------------------------
_FadeInCOLOR::
;C:/gbdk/ZGB/common/src/Fade_b.c:71: for(i = 0; i != 6; i ++) {
	ld	b,#0x00
00102$:
;C:/gbdk/ZGB/common/src/Fade_b.c:72: FadeStepColor(i);	
	push	bc
	push	bc
	inc	sp
	call	_FadeStepColor
	inc	sp
	pop	bc
;C:/gbdk/ZGB/common/src/Fade_b.c:71: for(i = 0; i != 6; i ++) {
	inc	b
	ld	a,b
	sub	a, #0x06
	jr	NZ,00102$
	ret
;C:/gbdk/ZGB/common/src/Fade_b.c:76: void FadeIn_b() {
;	---------------------------------
; Function FadeIn_b
; ---------------------------------
_FadeIn_b::
;C:/gbdk/ZGB/common/src/Fade_b.c:78: if (_cpu == CGB_TYPE) {
	ld	hl,#__cpu
	ld	a,(hl)
	sub	a, #0x11
	jr	NZ,00102$
;C:/gbdk/ZGB/common/src/Fade_b.c:79: FadeInCOLOR();
	jp	_FadeInCOLOR
00102$:
;C:/gbdk/ZGB/common/src/Fade_b.c:82: FadeInDMG();
	jp	_FadeInDMG
;C:/gbdk/ZGB/common/src/Fade_b.c:85: void FadeOutDMG() {
;	---------------------------------
; Function FadeOutDMG
; ---------------------------------
_FadeOutDMG::
;C:/gbdk/ZGB/common/src/Fade_b.c:86: FadeDMG(1);
	ld	a,#0x01
	push	af
	inc	sp
	call	_FadeDMG
	inc	sp
	ret
;C:/gbdk/ZGB/common/src/Fade_b.c:89: void FadeOutColor() {
;	---------------------------------
; Function FadeOutColor
; ---------------------------------
_FadeOutColor::
;C:/gbdk/ZGB/common/src/Fade_b.c:91: for(i = 5; i != 0xFF; -- i) {
	ld	b,#0x05
00102$:
;C:/gbdk/ZGB/common/src/Fade_b.c:92: FadeStepColor(i);	
	push	bc
	push	bc
	inc	sp
	call	_FadeStepColor
	inc	sp
	pop	bc
;C:/gbdk/ZGB/common/src/Fade_b.c:91: for(i = 5; i != 0xFF; -- i) {
	dec	b
	ld	a,b
	inc	a
	jr	NZ,00102$
	ret
;C:/gbdk/ZGB/common/src/Fade_b.c:96: void FadeOut_b() {
;	---------------------------------
; Function FadeOut_b
; ---------------------------------
_FadeOut_b::
;C:/gbdk/ZGB/common/src/Fade_b.c:98: if (_cpu == CGB_TYPE) {
	ld	hl,#__cpu
	ld	a,(hl)
	sub	a, #0x11
	jr	NZ,00102$
;C:/gbdk/ZGB/common/src/Fade_b.c:99: FadeOutColor();
	jp	_FadeOutColor
00102$:
;C:/gbdk/ZGB/common/src/Fade_b.c:102: FadeOutDMG();
	jp	_FadeOutDMG
	.area _CODE_1
	.area _CABS (ABS)
