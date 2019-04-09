;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module SpriteArrow
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Destroy_SPRITE_ARROW
	.globl _Update_SPRITE_ARROW
	.globl _Start_SPRITE_ARROW
	.globl _SetState
	.globl _SetSpriteAnim
	.globl _delay
	.globl _bank_SPRITE_ARROW
	.globl _arrow_WRONG
	.globl _arrow_OK
	.globl _arrow_idle
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_ARROW::
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
;SpriteArrow.c:3: UINT8 bank_SPRITE_ARROW = 2;
	ld	hl,#_bank_SPRITE_ARROW
	ld	(hl),#0x02
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_2
;SpriteArrow.c:19: void Start_SPRITE_ARROW() {
;	---------------------------------
; Function Start_SPRITE_ARROW
; ---------------------------------
_Start_SPRITE_ARROW::
;SpriteArrow.c:20: struct ArrowInfo* data = (struct ArrowInfo*)THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0018
	add	hl,bc
	ld	c,l
	ld	b,h
;SpriteArrow.c:21: data->state = 0;
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc),a
;SpriteArrow.c:22: THIS->flags = 0x00;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x000b
	add	hl,bc
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
	ret
_arrow_idle:
	.db #0x01	; 1
	.db #0x00	; 0
_arrow_OK:
	.db #0x01	; 1
	.db #0x01	; 1
_arrow_WRONG:
	.db #0x01	; 1
	.db #0x02	; 2
;SpriteArrow.c:25: void Update_SPRITE_ARROW() {
;	---------------------------------
; Function Update_SPRITE_ARROW
; ---------------------------------
_Update_SPRITE_ARROW::
	add	sp, #-2
;SpriteArrow.c:28: if ((THIS->x < 150) && (KEY_PRESSED(J_RIGHT))) THIS->x ++;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0007
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	pop	de
	push	de
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	a,c
	sub	a, #0x96
	ld	a,b
	sbc	a, #0x00
	jr	NC,00102$
	ld	hl,#_keys
	ld	e,(hl)
	ld	d,#0x00
	bit	0, e
	jr	Z,00102$
	inc	bc
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
00102$:
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0007
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	pop	de
	push	de
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;SpriteArrow.c:29: if ((THIS->x > 10) && (KEY_PRESSED(J_LEFT)))   THIS->x --;
	ld	a,#0x0a
	cp	a, c
	ld	a,#0x00
	sbc	a, b
	jr	NC,00105$
	ld	hl,#_keys
	ld	e,(hl)
	ld	d,#0x00
	bit	1, e
	jr	Z,00105$
	dec	bc
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
00105$:
;SpriteArrow.c:28: if ((THIS->x < 150) && (KEY_PRESSED(J_RIGHT))) THIS->x ++;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;SpriteArrow.c:30: if ((THIS->y > 10) && (KEY_PRESSED(J_UP)))     THIS->y --;
	ld	hl,#0x0009
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	pop	de
	push	de
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	a,#0x0a
	cp	a, c
	ld	a,#0x00
	sbc	a, b
	jr	NC,00108$
	ld	hl,#_keys
	ld	e,(hl)
	ld	d,#0x00
	bit	2, e
	jr	Z,00108$
	dec	bc
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
00108$:
;SpriteArrow.c:28: if ((THIS->x < 150) && (KEY_PRESSED(J_RIGHT))) THIS->x ++;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;SpriteArrow.c:30: if ((THIS->y > 10) && (KEY_PRESSED(J_UP)))     THIS->y --;
	ld	hl,#0x0009
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	pop	de
	push	de
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;SpriteArrow.c:31: if ((THIS->y < 140) && (KEY_PRESSED(J_DOWN)))  THIS->y ++;
	ld	a,c
	sub	a, #0x8c
	ld	a,b
	sbc	a, #0x00
	jr	NC,00111$
	ld	hl,#_keys
	ld	e,(hl)
	ld	d,#0x00
	bit	3, e
	jr	Z,00111$
	inc	bc
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
00111$:
;SpriteArrow.c:34: SetSpriteAnim(THIS, arrow_idle, 15);
	ld	a,#0x0f
	push	af
	inc	sp
	ld	hl,#_arrow_idle
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
;SpriteArrow.c:35: THIS->flags = 0x00;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x000b
	add	hl,bc
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;SpriteArrow.c:28: if ((THIS->x < 150) && (KEY_PRESSED(J_RIGHT))) THIS->x ++;
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
	pop	de
	push	de
	ld	hl,#0x0007
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;SpriteArrow.c:37: if ((THIS->x > 3*8) && (THIS->x < 8*8) && (THIS->y > 3*8) && (THIS->y < 8*8))
	ld	a,#0x18
	cp	a, c
	ld	a,#0x00
	sbc	a, b
	jp	NC,00116$
	ld	a,c
	sub	a, #0x40
	ld	a,b
	sbc	a, #0x00
	jp	NC,00116$
;SpriteArrow.c:30: if ((THIS->y > 10) && (KEY_PRESSED(J_UP)))     THIS->y --;
	pop	de
	push	de
	ld	hl,#0x0009
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;SpriteArrow.c:37: if ((THIS->x > 3*8) && (THIS->x < 8*8) && (THIS->y > 3*8) && (THIS->y < 8*8))
	ld	a,#0x18
	cp	a, c
	ld	a,#0x00
	sbc	a, b
	jp	NC,00116$
	ld	a,c
	sub	a, #0x40
	ld	a,b
	sbc	a, #0x00
	jp	NC,00116$
;SpriteArrow.c:39: THIS->flags = 0x02;
	pop	de
	push	de
	ld	hl,#0x000b
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x02
	ld	(bc),a
;SpriteArrow.c:40: SetSpriteAnim(THIS, arrow_OK, 15);
	ld	a,#0x0f
	push	af
	inc	sp
	ld	hl,#_arrow_OK
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
;SpriteArrow.c:41: if (KEY_PRESSED(J_A)) SetState(STATE_LEVEL1);
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	4, c
	jr	Z,00116$
	ld	a,#0x03
	push	af
	inc	sp
	call	_SetState
	inc	sp
00116$:
;SpriteArrow.c:28: if ((THIS->x < 150) && (KEY_PRESSED(J_RIGHT))) THIS->x ++;
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
	pop	de
	push	de
	ld	hl,#0x0007
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;SpriteArrow.c:44: if ((THIS->x > 13*8) && (THIS->x < 17*8) && (THIS->y > 9*8) && (THIS->y < 13*8))
	ld	a,#0x68
	cp	a, c
	ld	a,#0x00
	sbc	a, b
	jp	NC,00123$
	ld	a,c
	sub	a, #0x88
	ld	a,b
	sbc	a, #0x00
	jp	NC,00123$
;SpriteArrow.c:30: if ((THIS->y > 10) && (KEY_PRESSED(J_UP)))     THIS->y --;
	pop	de
	push	de
	ld	hl,#0x0009
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;SpriteArrow.c:44: if ((THIS->x > 13*8) && (THIS->x < 17*8) && (THIS->y > 9*8) && (THIS->y < 13*8))
	ld	a,#0x48
	cp	a, c
	ld	a,#0x00
	sbc	a, b
	jp	NC,00123$
	ld	a,c
	sub	a, #0x68
	ld	a,b
	sbc	a, #0x00
	jp	NC,00123$
;SpriteArrow.c:46: THIS->flags = 0x02;
	pop	de
	push	de
	ld	hl,#0x000b
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x02
	ld	(bc),a
;SpriteArrow.c:47: SetSpriteAnim(THIS, arrow_OK, 15);
	ld	a,#0x0f
	push	af
	inc	sp
	ld	hl,#_arrow_OK
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
;SpriteArrow.c:48: if (KEY_PRESSED(J_A)) {
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	4, c
	jp	Z,00123$
;SpriteArrow.c:49: Menu_Mode = 4;
	ld	hl,#_Menu_Mode
	ld	(hl),#0x04
;SpriteArrow.c:50: delay(20);
	ld	hl,#0x0014
	push	hl
	call	_delay
	add	sp, #2
;SpriteArrow.c:51: THIS->x = 200;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0007
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0xc8
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
;SpriteArrow.c:52: THIS->y = 200;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0009
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0xc8
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
00123$:
;SpriteArrow.c:28: if ((THIS->x < 150) && (KEY_PRESSED(J_RIGHT))) THIS->x ++;
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
	pop	de
	push	de
	ld	hl,#0x0007
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;SpriteArrow.c:56: if ((THIS->x > 2*8) && (THIS->x < 7*8) && (THIS->y > 11*8) && (THIS->y < 16*8))
	ld	a,#0x10
	cp	a, c
	ld	a,#0x00
	sbc	a, b
	jp	NC,00134$
	ld	a,c
	sub	a, #0x38
	ld	a,b
	sbc	a, #0x00
	jp	NC,00134$
;SpriteArrow.c:30: if ((THIS->y > 10) && (KEY_PRESSED(J_UP)))     THIS->y --;
	pop	de
	push	de
	ld	hl,#0x0009
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;SpriteArrow.c:56: if ((THIS->x > 2*8) && (THIS->x < 7*8) && (THIS->y > 11*8) && (THIS->y < 16*8))
	ld	a,#0x58
	cp	a, c
	ld	a,#0x00
	sbc	a, b
	jp	NC,00134$
	ld	a,c
	sub	a, #0x80
	ld	a,b
	sbc	a, #0x00
	jp	NC,00134$
;SpriteArrow.c:58: THIS->flags = 0x02;
	pop	de
	push	de
	ld	hl,#0x000b
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x02
	ld	(bc),a
;SpriteArrow.c:59: SetSpriteAnim(THIS, arrow_OK, 15);
	ld	a,#0x0f
	push	af
	inc	sp
	ld	hl,#_arrow_OK
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
;SpriteArrow.c:60: if (KEY_PRESSED(J_A)) {
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	4, c
	jp	Z,00134$
;SpriteArrow.c:61: Menu_Mode = 7;
	ld	hl,#_Menu_Mode
	ld	(hl),#0x07
;SpriteArrow.c:62: delay(20);
	ld	hl,#0x0014
	push	hl
	call	_delay
	add	sp, #2
;SpriteArrow.c:63: THIS->x = 200;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0007
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0xc8
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
;SpriteArrow.c:64: THIS->y = 200;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0009
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0xc8
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
00134$:
	add	sp, #2
	ret
;SpriteArrow.c:69: void Destroy_SPRITE_ARROW() {
;	---------------------------------
; Function Destroy_SPRITE_ARROW
; ---------------------------------
_Destroy_SPRITE_ARROW::
;SpriteArrow.c:70: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
