;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module BankManager
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _StackPop
	.globl _StackPush
	.globl _bank_stack
	.globl _PushBank
	.globl _PopBank
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_stack::
	.ds 11
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
;C:/gbdk/ZGB/common/src/BankManager.c:3: DECLARE_STACK(bank_stack, N_PUSH_BANKS);
	ld	hl,#_bank_stack
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
;C:/gbdk/ZGB/common/src/BankManager.c:5: void PushBank(UINT8 b) {
;	---------------------------------
; Function PushBank
; ---------------------------------
_PushBank::
;C:/gbdk/ZGB/common/src/BankManager.c:6: StackPush(bank_stack, b); 
	ldhl	sp,#2
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#_bank_stack
	push	hl
	call	_StackPush
	add	sp, #3
;C:/gbdk/ZGB/common/src/BankManager.c:7: SWITCH_ROM_MBC1(b);
	ld	de,#0x2000
	ldhl	sp,#2
	ld	a,(hl)
	ld	(de),a
	ret
;C:/gbdk/ZGB/common/src/BankManager.c:10: void PopBank() {
;	---------------------------------
; Function PopBank
; ---------------------------------
_PopBank::
;C:/gbdk/ZGB/common/src/BankManager.c:11: StackPop(bank_stack);
	ld	hl,#_bank_stack
	push	hl
	call	_StackPop
	add	sp, #2
;C:/gbdk/ZGB/common/src/BankManager.c:12: REFRESH_BANK;
	ld	de, #_bank_stack + 0
	ld	a,(de)
	add	a,#<(_bank_stack)
	ld	c,a
	ld	a,#>(_bank_stack)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	de,#0x2000
	ld	(de),a
	ret
	.area _CODE
	.area _CABS (ABS)
