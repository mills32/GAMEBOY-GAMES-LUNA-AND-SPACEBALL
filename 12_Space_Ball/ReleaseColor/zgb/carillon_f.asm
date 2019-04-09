;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module carillon_f
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CP_StopMusic
	.globl _CP_UpdateMusic
	.globl _CP_LoadMusic
	.globl _PopBank
	.globl _PushBank
	.globl _CP_VARS
	.globl _ZGB_CP_ON
	.globl _ZGB_CPSong
	.globl _ZGB_CPBank
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_ZGB_CPBank::
	.ds 1
_ZGB_CPSong::
	.ds 1
_ZGB_CP_ON::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
	.org 0xC7C0
_CP_VARS::
	.ds 32
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;C:/gbdk/ZGB/common/src/carillon_f.c:4: UINT8 ZGB_CPBank = 0; 
	ld	hl,#_ZGB_CPBank
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/carillon_f.c:5: UINT8 ZGB_CPSong = 0;
	ld	hl,#_ZGB_CPSong
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/carillon_f.c:10: UINT8 __at (0xc7c0) CP_VARS[32] = {
	ld	hl,#_CP_VARS
	ld	(hl),#0x01
	ld	hl,#(_CP_VARS + 0x0001)
	ld	(hl),#0x02
	ld	hl,#(_CP_VARS + 0x0002)
	ld	(hl),#0x03
	ld	hl,#(_CP_VARS + 0x0003)
	ld	(hl),#0x04
	ld	hl,#(_CP_VARS + 0x0004)
	ld	(hl),#0x01
	ld	hl,#(_CP_VARS + 0x0005)
	ld	(hl),#0x02
	ld	hl,#(_CP_VARS + 0x0006)
	ld	(hl),#0x03
	ld	hl,#(_CP_VARS + 0x0007)
	ld	(hl),#0x04
	ld	hl,#(_CP_VARS + 0x0008)
	ld	(hl),#0x01
	ld	hl,#(_CP_VARS + 0x0009)
	ld	(hl),#0x02
	ld	hl,#(_CP_VARS + 0x000a)
	ld	(hl),#0x03
	ld	hl,#(_CP_VARS + 0x000b)
	ld	(hl),#0x04
	ld	hl,#(_CP_VARS + 0x000c)
	ld	(hl),#0x01
	ld	hl,#(_CP_VARS + 0x000d)
	ld	(hl),#0x02
	ld	hl,#(_CP_VARS + 0x000e)
	ld	(hl),#0x03
	ld	hl,#(_CP_VARS + 0x000f)
	ld	(hl),#0x04
	ld	hl,#(_CP_VARS + 0x0010)
	ld	(hl),#0x01
	ld	hl,#(_CP_VARS + 0x0011)
	ld	(hl),#0x02
	ld	hl,#(_CP_VARS + 0x0012)
	ld	(hl),#0x03
	ld	hl,#(_CP_VARS + 0x0013)
	ld	(hl),#0x04
	ld	hl,#(_CP_VARS + 0x0014)
	ld	(hl),#0x01
	ld	hl,#(_CP_VARS + 0x0015)
	ld	(hl),#0x02
	ld	hl,#(_CP_VARS + 0x0016)
	ld	(hl),#0x03
	ld	hl,#(_CP_VARS + 0x0017)
	ld	(hl),#0x04
	ld	hl,#(_CP_VARS + 0x0018)
	ld	(hl),#0x01
	ld	hl,#(_CP_VARS + 0x0019)
	ld	(hl),#0x02
	ld	hl,#(_CP_VARS + 0x001a)
	ld	(hl),#0x03
	ld	hl,#(_CP_VARS + 0x001b)
	ld	(hl),#0x04
	ld	hl,#(_CP_VARS + 0x001c)
	ld	(hl),#0x01
	ld	hl,#(_CP_VARS + 0x001d)
	ld	(hl),#0x02
	ld	hl,#(_CP_VARS + 0x001e)
	ld	(hl),#0x03
	ld	hl,#(_CP_VARS + 0x001f)
	ld	(hl),#0x04
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;C:/gbdk/ZGB/common/src/carillon_f.c:15: void CP_LoadMusic(UINT8 bank, UINT8 song){ 
;	---------------------------------
; Function CP_LoadMusic
; ---------------------------------
_CP_LoadMusic::
;C:/gbdk/ZGB/common/src/carillon_f.c:16: ZGB_CP_ON = 1;
	ld	hl,#_ZGB_CP_ON
	ld	(hl),#0x01
;C:/gbdk/ZGB/common/src/carillon_f.c:17: ZGB_CPBank = bank;
	push	hl
	ldhl	sp,#4
	ld	a,(hl)
	ld	hl,#_ZGB_CPBank
	ld	(hl),a
	pop	hl
;C:/gbdk/ZGB/common/src/carillon_f.c:18: ZGB_CPSong = song;
	push	hl
	ldhl	sp,#5
	ld	a,(hl)
	ld	hl,#_ZGB_CPSong
	ld	(hl),a
	pop	hl
;C:/gbdk/ZGB/common/src/carillon_f.c:19: PUSH_BANK(ZGB_CPBank);
	ld	hl,#_ZGB_CPBank
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/carillon_f.c:30: __endasm;
	push	BC
	call	0x4000
	pop	BC
	push	BC
	call	0x4003
	pop	BC
	LDA	HL,2(SP)
	LD	A,(_ZGB_CPSong)
	call	0x400c
;C:/gbdk/ZGB/common/src/carillon_f.c:31: POP_BANK;
	jp	_PopBank
;C:/gbdk/ZGB/common/src/carillon_f.c:33: void CP_UpdateMusic(){
;	---------------------------------
; Function CP_UpdateMusic
; ---------------------------------
_CP_UpdateMusic::
;C:/gbdk/ZGB/common/src/carillon_f.c:34: PUSH_BANK(ZGB_CPBank);
	ld	hl,#_ZGB_CPBank
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/carillon_f.c:37: __endasm;
	call	0x4100
;C:/gbdk/ZGB/common/src/carillon_f.c:38: POP_BANK;
	jp	_PopBank
;C:/gbdk/ZGB/common/src/carillon_f.c:40: void CP_StopMusic(){
;	---------------------------------
; Function CP_StopMusic
; ---------------------------------
_CP_StopMusic::
;C:/gbdk/ZGB/common/src/carillon_f.c:41: if (ZGB_CP_ON == 1){
	ld	hl,#_ZGB_CP_ON
	ld	a,(hl)
	dec	a
	ret	NZ
;C:/gbdk/ZGB/common/src/carillon_f.c:42: PUSH_BANK(ZGB_CPBank);
	ld	hl,#_ZGB_CPBank
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/carillon_f.c:45: __endasm;
	call	0x4006
;C:/gbdk/ZGB/common/src/carillon_f.c:46: ZGB_CPBank = 0;
	ld	hl,#_ZGB_CPBank
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/carillon_f.c:47: ZGB_CP_ON = 0;
	ld	hl,#_ZGB_CP_ON
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/carillon_f.c:48: POP_BANK;
	jp	_PopBank
	.area _CODE
	.area _CABS (ABS)
