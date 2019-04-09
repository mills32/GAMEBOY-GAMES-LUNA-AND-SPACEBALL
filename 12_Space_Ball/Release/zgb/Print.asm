;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module Print
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _print_target
	.globl _font_idx
	.globl _print_y
	.globl _print_x
	.globl _UIntToString
	.globl _IntToString
	.globl _Printf
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_print_x::
	.ds 1
_print_y::
	.ds 1
_font_idx::
	.ds 1
_print_target::
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
;C:/gbdk/ZGB/common/src/Print.c:7: UINT8 print_x = 0;
	ld	hl,#_print_x
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Print.c:8: UINT8 print_y = 0;
	ld	hl,#_print_y
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/Print.c:9: UINT8 font_idx = 128;
	ld	hl,#_font_idx
	ld	(hl),#0x80
;C:/gbdk/ZGB/common/src/Print.c:10: UINT8 print_target = PRINT_BKG;
	ld	hl,#_print_target
	ld	(hl),#0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;C:/gbdk/ZGB/common/src/Print.c:12: void UIntToString(UINT16 n, unsigned char* str) {
;	---------------------------------
; Function UIntToString
; ---------------------------------
_UIntToString::
	add	sp, #-2
;C:/gbdk/ZGB/common/src/Print.c:13: UINT16 tmp = n;
	ldhl	sp,#(5 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;C:/gbdk/ZGB/common/src/Print.c:16: if(n == 0) {
	ld	a,d
	or	a,e
	jr	NZ,00114$
;C:/gbdk/ZGB/common/src/Print.c:17: str[0] ='0';
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x30
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Print.c:18: str[1] = '\0';
	inc	bc
	xor	a, a
	ld	(bc),a
	jp	00110$
;C:/gbdk/ZGB/common/src/Print.c:20: while(tmp) {
00114$:
	ldhl	sp,#0
	ld	(hl),#0x00
00101$:
	ld	a,d
	or	a,e
	jr	Z,00103$
;C:/gbdk/ZGB/common/src/Print.c:21: tmp /= 10;
	ld	hl,#0x000a
	push	hl
	push	de
	call	__divuint
	add	sp, #4
;C:/gbdk/ZGB/common/src/Print.c:22: size ++;
	ldhl	sp,#0
	inc	(hl)
	jr	00101$
00103$:
;C:/gbdk/ZGB/common/src/Print.c:24: str[size] = '\0';
	ldhl	sp,#(7 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ldhl	sp,#0
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Print.c:25: size --;
	ldhl	sp,#0
	ld	a,(hl)
	add	a,#0xff
	inc	hl
	ld	(hl),a
;C:/gbdk/ZGB/common/src/Print.c:27: while(n) {
00104$:
	ldhl	sp,#5
	ld	a,(hl-)
	or	a,(hl)
	jp	Z,00110$
;C:/gbdk/ZGB/common/src/Print.c:28: str[size] = (n % 10) + '0';
	ldhl	sp,#(7 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ldhl	sp,#1
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	push	bc
	ld	hl,#0x000a
	push	hl
	ldhl	sp,#8
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__moduint
	add	sp, #4
	pop	bc
	ld	a,e
	add	a, #0x30
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Print.c:29: n /= 10;
	ld	hl,#0x000a
	push	hl
	ldhl	sp,#6
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__divuint
	add	sp, #4
	ldhl	sp,#4
	ld	(hl),e
	inc	hl
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Print.c:30: size --;
	ldhl	sp,#1
	dec	(hl)
	jp	00104$
00110$:
	add	sp, #2
	ret
;C:/gbdk/ZGB/common/src/Print.c:35: void IntToString(INT16 n, unsigned char* str) {
;	---------------------------------
; Function IntToString
; ---------------------------------
_IntToString::
;C:/gbdk/ZGB/common/src/Print.c:39: if(n < 0){
	ldhl	sp,#2
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a,#0x00
	ld	e, a
	bit	7, e
	jr	Z,00109$
	bit	7, d
	jr	NZ,00110$
	cp	a, a
	jr	00110$
00109$:
	bit	7, d
	jr	Z,00110$
	scf
00110$:
	jr	NC,00102$
;C:/gbdk/ZGB/common/src/Print.c:40: n = 0xFFFF - n + 1; //I tried -n but it doesn't work
	pop	de
	pop	bc
	push	bc
	push	de
	xor	a, a
	sub	a, c
	ld	c,a
	ld	a, #0x00
	sbc	a, b
	ld	b,a
	ldhl	sp,#2
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/Print.c:41: str[0] = '-';
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x2d
	ld	(bc),a
;C:/gbdk/ZGB/common/src/Print.c:42: str ++;
	inc	bc
	dec	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
00102$:
;C:/gbdk/ZGB/common/src/Print.c:45: UIntToString(n, str);
	ldhl	sp,#4
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ldhl	sp,#4
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_UIntToString
	add	sp, #4
	ret
;C:/gbdk/ZGB/common/src/Print.c:48: void Printf(const char* txt, ...){
;	---------------------------------
; Function Printf
; ---------------------------------
_Printf::
	add	sp, #-23
;C:/gbdk/ZGB/common/src/Print.c:54: va_start(list, txt); 
	ldhl	sp,#25
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	ldhl	sp,#11
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/Print.c:55: while(*txt) {
	ldhl	sp,#0
	ld	a,l
	ld	d,h
	ldhl	sp,#13
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#17
	ld	(hl+),a
	ld	(hl),e
	ldhl	sp,#13
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#19
	ld	(hl+),a
	ld	(hl),e
	ldhl	sp,#13
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#21
	ld	(hl+),a
	ld	(hl),e
00133$:
	ldhl	sp,#(26 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(bc)
	ld	c,a
	or	a, a
	jp	Z,00136$
;C:/gbdk/ZGB/common/src/Print.c:56: if(*txt == ' ') {
	ld	a,c
	sub	a, #0x20
	jr	NZ,00128$
;C:/gbdk/ZGB/common/src/Print.c:57: c = font_idx;
	push	hl
	ld	hl,#_font_idx
	ld	a,(hl)
	ldhl	sp,#12
	ld	(hl),a
	pop	hl
	jp	00129$
00128$:
;C:/gbdk/ZGB/common/src/Print.c:58: } else if(*txt >= 'A' && *txt <= 'Z'){
	ld	a,c
	sub	a, #0x41
	jr	C,00124$
	ld	a,#0x5a
	sub	a, c
	jr	C,00124$
;C:/gbdk/ZGB/common/src/Print.c:59: c = font_idx +  1 + *txt - 'A';
	ld	a,c
	add	a, #0xc0
	ld	c,a
	ld	hl,#_font_idx
	ld	b,(hl)
	ld	a,c
	add	a, b
	ldhl	sp,#10
	ld	(hl),a
	jp	00129$
00124$:
;C:/gbdk/ZGB/common/src/Print.c:60: } else if(*txt >= 'a' && *txt <= 'z') {
	ldhl	sp,#(26 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(bc)
	ld	c,a
	sub	a, #0x61
	jr	C,00120$
	ld	a,#0x7a
	sub	a, c
	jr	C,00120$
;C:/gbdk/ZGB/common/src/Print.c:61: c = font_idx +  1 + *txt - 'a';
	ld	a,c
	add	a, #0xa0
	ld	c,a
	ld	hl,#_font_idx
	ld	b,(hl)
	ld	a,c
	add	a, b
	ldhl	sp,#10
	ld	(hl),a
	jp	00129$
00120$:
;C:/gbdk/ZGB/common/src/Print.c:62: } else if(*txt >= '0' && *txt <= '9') {
	ldhl	sp,#(26 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(bc)
	ld	c,a
	sub	a, #0x30
	jr	C,00116$
	ld	a,#0x39
	sub	a, c
	jr	C,00116$
;C:/gbdk/ZGB/common/src/Print.c:63: c = font_idx + 27 + *txt - '0';
	ld	a,c
	add	a, #0xeb
	ld	c,a
	ld	hl,#_font_idx
	ld	b,(hl)
	ld	a,c
	add	a, b
	ldhl	sp,#10
	ld	(hl),a
	jp	00129$
00116$:
;C:/gbdk/ZGB/common/src/Print.c:65: switch(*txt) {
	ldhl	sp,#(26 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(bc)
	ld	e,a
	sub	a, #0x21
	jr	Z,00101$
	ld	a,e
	cp	a,#0x25
	jp	Z,00109$
	cp	a,##0x27
	jr	Z,00102$
	cp	a,#0x28
	jr	Z,00103$
	cp	a,##0x29
	jr	Z,00104$
	cp	a,#0x2d
	jp	Z,00105$
	cp	a,##0x2e
	jp	Z,00106$
	cp	a,#0x3a
	jp	Z,00107$
	sub	a, #0x3f
	jp	Z,00108$
	jp	00129$
;C:/gbdk/ZGB/common/src/Print.c:66: case  '!': c= font_idx + 37; break;
00101$:
	ld	hl,#_font_idx
	ld	a,(hl)
	add	a, #0x25
	ldhl	sp,#10
	ld	(hl),a
	jp	00129$
;C:/gbdk/ZGB/common/src/Print.c:67: case '\'': c= font_idx + 38; break;
00102$:
	ld	hl,#_font_idx
	ld	a,(hl)
	add	a, #0x26
	ldhl	sp,#10
	ld	(hl),a
	jp	00129$
;C:/gbdk/ZGB/common/src/Print.c:68: case  '(': c= font_idx + 39; break;
00103$:
	ld	hl,#_font_idx
	ld	a,(hl)
	add	a, #0x27
	ldhl	sp,#10
	ld	(hl),a
	jp	00129$
;C:/gbdk/ZGB/common/src/Print.c:69: case  ')': c= font_idx + 40; break;
00104$:
	ld	hl,#_font_idx
	ld	a,(hl)
	add	a, #0x28
	ldhl	sp,#10
	ld	(hl),a
	jp	00129$
;C:/gbdk/ZGB/common/src/Print.c:70: case  '-': c= font_idx + 41; break;
00105$:
	ld	hl,#_font_idx
	ld	a,(hl)
	add	a, #0x29
	ldhl	sp,#10
	ld	(hl),a
	jp	00129$
;C:/gbdk/ZGB/common/src/Print.c:71: case  '.': c= font_idx + 42; break;
00106$:
	ld	hl,#_font_idx
	ld	a,(hl)
	add	a, #0x2a
	ldhl	sp,#10
	ld	(hl),a
	jp	00129$
;C:/gbdk/ZGB/common/src/Print.c:72: case  ':': c= font_idx + 43; break;
00107$:
	ld	hl,#_font_idx
	ld	a,(hl)
	add	a, #0x2b
	ldhl	sp,#10
	ld	(hl),a
	jp	00129$
;C:/gbdk/ZGB/common/src/Print.c:73: case  '?': c= font_idx + 44; break;
00108$:
	ld	hl,#_font_idx
	ld	a,(hl)
	add	a, #0x2c
	ldhl	sp,#10
	ld	(hl),a
	jp	00129$
;C:/gbdk/ZGB/common/src/Print.c:74: case  '%':
00109$:
;C:/gbdk/ZGB/common/src/Print.c:75: switch(*(txt + 1)) {
	inc	bc
	ld	a,(bc)
	ld	c,a
	sub	a, #0x64
	jr	Z,00111$
	ld	a,c
	cp	a,#0x69
	jr	Z,00111$
	sub	a, #0x75
	jp	Z,00112$
	jp	00129$
;C:/gbdk/ZGB/common/src/Print.c:77: case 'i':
00111$:
;C:/gbdk/ZGB/common/src/Print.c:78: IntToString(va_arg(list, INT16), tmp);
	ldhl	sp,#13
	ld	a,(hl+)
	ld	e, (hl)
	inc	hl
	ld	(hl+),a
	ld	(hl),e
	ldhl	sp,#(12 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	dec	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	dec	bc
	dec	bc
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ldhl	sp,#15
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	call	_IntToString
	add	sp, #4
;C:/gbdk/ZGB/common/src/Print.c:79: Printf(tmp);
	ldhl	sp,#(18 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	bc
	call	_Printf
	add	sp, #2
;C:/gbdk/ZGB/common/src/Print.c:80: txt += 2;
	ldhl	sp,#(26 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0002
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#25
	ld	(hl+),a
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Print.c:81: continue;
	jp	00133$
;C:/gbdk/ZGB/common/src/Print.c:83: case 'u':
00112$:
;C:/gbdk/ZGB/common/src/Print.c:84: UIntToString(va_arg(list, UINT16), tmp);
	ldhl	sp,#19
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#15
	ld	(hl+),a
	ld	(hl),e
	ldhl	sp,#(12 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	dec	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	dec	bc
	dec	bc
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ldhl	sp,#15
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	call	_UIntToString
	add	sp, #4
;C:/gbdk/ZGB/common/src/Print.c:85: Printf(tmp);
	ldhl	sp,#(22 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	bc
	call	_Printf
	add	sp, #2
;C:/gbdk/ZGB/common/src/Print.c:86: txt += 2;
	ldhl	sp,#(26 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0002
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#25
	ld	(hl+),a
	ld	(hl),d
;C:/gbdk/ZGB/common/src/Print.c:90: }
00129$:
;C:/gbdk/ZGB/common/src/Print.c:92: if(print_target == PRINT_BKG)
	ld	hl,#_print_target
	ld	a,(hl)
	or	a, a
	jr	NZ,00131$
;C:/gbdk/ZGB/common/src/Print.c:93: set_bkg_tiles(0x1F & (print_x + scroll_offset_x), 0x1F & (print_y + scroll_offset_y), 1, 1, &c);
	ldhl	sp,#10
	ld	c,l
	ld	b,h
	ld	hl,#_print_y
	ld	a,(hl)
	ld	hl,#_scroll_offset_y
	add	a, (hl)
	and	a, #0x1f
	ld	e,a
	ld	hl,#_print_x
	ld	a,(hl)
	ld	hl,#_scroll_offset_x
	add	a, (hl)
	and	a, #0x1f
	ld	d,a
	push	bc
	ld	hl,#0x0101
	push	hl
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00132$
00131$:
;C:/gbdk/ZGB/common/src/Print.c:95: set_win_tiles(print_x, print_y, 1, 1, &c);
	ldhl	sp,#10
	ld	c,l
	ld	b,h
	push	bc
	ld	hl,#0x0101
	push	hl
	ld	hl,#_print_y
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#_print_x
	ld	a,(hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
00132$:
;C:/gbdk/ZGB/common/src/Print.c:97: print_x ++;
	ld	hl,#_print_x
	inc	(hl)
;C:/gbdk/ZGB/common/src/Print.c:98: txt ++;
	ldhl	sp,#25
	inc	(hl)
	jp	NZ,00133$
	inc	hl
	inc	(hl)
	jp	00133$
00136$:
	add	sp, #23
	ret
	.area _CODE
	.area _CABS (ABS)
