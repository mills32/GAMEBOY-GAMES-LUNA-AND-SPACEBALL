;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module Stack
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _StackPush
	.globl _StackPop
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
;C:/gbdk/ZGB/common/src/Stack.c:3: void StackPush(UINT8* stack, UINT8 elem) {
;	---------------------------------
; Function StackPush
; ---------------------------------
_StackPush::
	dec	sp
;C:/gbdk/ZGB/common/src/Stack.c:4: stack[++ stack[0]] = elem;
	ldhl	sp,#(4 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(bc)
	inc	a
	ldhl	sp,#0
	ld	(hl),a
	ld	a,(hl)
	ld	(bc),a
	ld	l,(hl)
	ld	h,#0x00
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#5
	ld	a,(hl)
	ld	(bc),a
	inc	sp
	ret
;C:/gbdk/ZGB/common/src/Stack.c:7: UINT8 StackPop(UINT8* stack) {
;	---------------------------------
; Function StackPop
; ---------------------------------
_StackPop::
	dec	sp
;C:/gbdk/ZGB/common/src/Stack.c:8: return stack[(stack[0] --)];
	ldhl	sp,#(4 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(bc)
	ldhl	sp,#0
	ld	(hl),a
	ld	a,(hl)
	add	a,#0xff
	ld	(bc),a
	ld	l,(hl)
	ld	h,#0x00
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	e,a
	inc	sp
	ret
	.area _CODE
	.area _CABS (ABS)
