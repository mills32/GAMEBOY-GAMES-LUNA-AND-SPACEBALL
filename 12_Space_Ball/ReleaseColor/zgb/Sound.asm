;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module Sound
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CP_Reset_Chan
	.globl _CP_Mute_Chan
	.globl _PopBank
	.globl _PushBank
	.globl _FX_ADDRESS
	.globl _FX_REG_SIZES
	.globl _PlayFx
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
;C:/gbdk/ZGB/common/src/Sound.c:17: void PlayFx(SOUND_CHANNEL channel, UINT8 mute_frames, ...) {
;	---------------------------------
; Function PlayFx
; ---------------------------------
_PlayFx::
	add	sp, #-9
;C:/gbdk/ZGB/common/src/Sound.c:19: UINT8* reg = (UINT8*)FX_ADDRESS[channel];
	ldhl	sp,#11
	ld	c,(hl)
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_FX_ADDRESS
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
	ldhl	sp,#2
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/Sound.c:22: CP_Muted_Chan = channel;
	push	hl
	ldhl	sp,#13
	ld	a,(hl)
	ld	hl,#_CP_Muted_Chan
	ld	(hl),a
	pop	hl
;C:/gbdk/ZGB/common/src/Sound.c:23: PUSH_BANK(1);
	ld	a,#0x01
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/Sound.c:24: CP_Mute_Chan(CP_Muted_Chan);
	ld	hl,#_CP_Muted_Chan
	ld	a,(hl)
	push	af
	inc	sp
	call	_CP_Mute_Chan
	inc	sp
;C:/gbdk/ZGB/common/src/Sound.c:25: CP_Reset_Chan(CP_Muted_Chan);
	ld	hl,#_CP_Muted_Chan
	ld	a,(hl)
	push	af
	inc	sp
	call	_CP_Reset_Chan
	inc	sp
;C:/gbdk/ZGB/common/src/Sound.c:26: POP_BANK;	
	call	_PopBank
;C:/gbdk/ZGB/common/src/Sound.c:28: va_start(list, mute_frames);
	ldhl	sp,#12
	ld	c,l
	ld	b,h
	inc	bc
	inc	sp
	inc	sp
	push	bc
;C:/gbdk/ZGB/common/src/Sound.c:29: for(i = 0; i < FX_REG_SIZES[channel]; ++i, ++reg) {
	ld	de,#_FX_REG_SIZES
	ldhl	sp,#11
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#5
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	dec	hl
	ld	(hl),#0x00
	dec	hl
	dec	hl
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#7
	ld	(hl+),a
	ld	(hl),e
00103$:
	ldhl	sp,#(6 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	dec	hl
	dec	hl
	ld	a,(hl)
	sub	a, c
	jr	NC,00101$
;C:/gbdk/ZGB/common/src/Sound.c:30: *reg = va_arg(list, INT16);
	pop	bc
	push	bc
	inc	bc
	inc	bc
	inc	sp
	inc	sp
	push	bc
	dec	bc
	dec	bc
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ldhl	sp,#7
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
;C:/gbdk/ZGB/common/src/Sound.c:29: for(i = 0; i < FX_REG_SIZES[channel]; ++i, ++reg) {
	ldhl	sp,#4
	inc	(hl)
	ldhl	sp,#7
	inc	(hl)
	jp	NZ,00103$
	inc	hl
	inc	(hl)
	jp	00103$
00101$:
;C:/gbdk/ZGB/common/src/Sound.c:35: music_mute_frames = mute_frames;
	push	hl
	ldhl	sp,#14
	ld	a,(hl)
	ld	hl,#_music_mute_frames
	ld	(hl),a
	pop	hl
	add	sp, #9
	ret
_FX_REG_SIZES:
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x03	; 3
_FX_ADDRESS:
	.dw #0xff10
	.dw #0xff16
	.dw #0xff1a
	.dw #0xff20
	.dw #0xff24
	.area _CODE
	.area _CABS (ABS)
