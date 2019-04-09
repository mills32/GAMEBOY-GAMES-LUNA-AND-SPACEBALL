;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module ZGBMain_Init
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _InitSprites
	.globl _Destroy_SPRITE_ROCKET
	.globl _Update_SPRITE_ROCKET
	.globl _Start_SPRITE_ROCKET
	.globl _Destroy_SPRITE_ARROW
	.globl _Update_SPRITE_ARROW
	.globl _Start_SPRITE_ARROW
	.globl _Destroy_SPRITE_UFO
	.globl _Update_SPRITE_UFO
	.globl _Start_SPRITE_UFO
	.globl _Destroy_SPRITE_SHIP
	.globl _Update_SPRITE_SHIP
	.globl _Start_SPRITE_SHIP
	.globl _Destroy_SPRITE_POINTER
	.globl _Update_SPRITE_POINTER
	.globl _Start_SPRITE_POINTER
	.globl _Destroy_SPRITE_PLAYER
	.globl _Update_SPRITE_PLAYER
	.globl _Start_SPRITE_PLAYER
	.globl _InitStates
	.globl _Update_STATE_LEVEL1
	.globl _Start_STATE_LEVEL1
	.globl _Update_STATE_CREDITS
	.globl _Start_STATE_CREDITS
	.globl _Update_STATE_GAME
	.globl _Start_STATE_GAME
	.globl _Update_STATE_MENU
	.globl _Start_STATE_MENU
	.globl _spritePalDatas
	.globl _spriteIdxs
	.globl _spriteNumFrames
	.globl _spriteFrameSizes
	.globl _spriteDataBanks
	.globl _spriteDatas
	.globl _spriteDestroyFuncs
	.globl _spriteUpdateFuncs
	.globl _spriteStartFuncs
	.globl _spriteBanks
	.globl _updateFuncs
	.globl _startFuncs
	.globl _stateBanks
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_stateBanks::
	.ds 4
_startFuncs::
	.ds 8
_updateFuncs::
	.ds 8
_spriteBanks::
	.ds 6
_spriteStartFuncs::
	.ds 12
_spriteUpdateFuncs::
	.ds 12
_spriteDestroyFuncs::
	.ds 12
_spriteDatas::
	.ds 12
_spriteDataBanks::
	.ds 6
_spriteFrameSizes::
	.ds 6
_spriteNumFrames::
	.ds 6
_spriteIdxs::
	.ds 6
_spritePalDatas::
	.ds 12
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
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:11: Void_Func_Void startFuncs[] = {STATES};
	ld	hl,#_startFuncs
	ld	(hl),#<(_Start_STATE_MENU)
	inc	hl
	ld	(hl),#>(_Start_STATE_MENU)
	ld	hl,#(_startFuncs + 0x0002)
	ld	(hl),#<(_Start_STATE_GAME)
	inc	hl
	ld	(hl),#>(_Start_STATE_GAME)
	ld	hl,#(_startFuncs + 0x0004)
	ld	(hl),#<(_Start_STATE_CREDITS)
	inc	hl
	ld	(hl),#>(_Start_STATE_CREDITS)
	ld	hl,#(_startFuncs + 0x0006)
	ld	(hl),#<(_Start_STATE_LEVEL1)
	inc	hl
	ld	(hl),#>(_Start_STATE_LEVEL1)
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:15: Void_Func_Void updateFuncs[] = {STATES};
	ld	hl,#_updateFuncs
	ld	(hl),#<(_Update_STATE_MENU)
	inc	hl
	ld	(hl),#>(_Update_STATE_MENU)
	ld	hl,#(_updateFuncs + 0x0002)
	ld	(hl),#<(_Update_STATE_GAME)
	inc	hl
	ld	(hl),#>(_Update_STATE_GAME)
	ld	hl,#(_updateFuncs + 0x0004)
	ld	(hl),#<(_Update_STATE_CREDITS)
	inc	hl
	ld	(hl),#>(_Update_STATE_CREDITS)
	ld	hl,#(_updateFuncs + 0x0006)
	ld	(hl),#<(_Update_STATE_LEVEL1)
	inc	hl
	ld	(hl),#>(_Update_STATE_LEVEL1)
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:40: Void_Func_Void spriteStartFuncs[] = {SPRITES};
	ld	hl,#_spriteStartFuncs
	ld	(hl),#<(_Start_SPRITE_PLAYER)
	inc	hl
	ld	(hl),#>(_Start_SPRITE_PLAYER)
	ld	hl,#(_spriteStartFuncs + 0x0002)
	ld	(hl),#<(_Start_SPRITE_POINTER)
	inc	hl
	ld	(hl),#>(_Start_SPRITE_POINTER)
	ld	hl,#(_spriteStartFuncs + 0x0004)
	ld	(hl),#<(_Start_SPRITE_SHIP)
	inc	hl
	ld	(hl),#>(_Start_SPRITE_SHIP)
	ld	hl,#(_spriteStartFuncs + 0x0006)
	ld	(hl),#<(_Start_SPRITE_UFO)
	inc	hl
	ld	(hl),#>(_Start_SPRITE_UFO)
	ld	hl,#(_spriteStartFuncs + 0x0008)
	ld	(hl),#<(_Start_SPRITE_ARROW)
	inc	hl
	ld	(hl),#>(_Start_SPRITE_ARROW)
	ld	hl,#(_spriteStartFuncs + 0x000a)
	ld	(hl),#<(_Start_SPRITE_ROCKET)
	inc	hl
	ld	(hl),#>(_Start_SPRITE_ROCKET)
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:44: Void_Func_Void spriteUpdateFuncs[] = {SPRITES};
	ld	hl,#_spriteUpdateFuncs
	ld	(hl),#<(_Update_SPRITE_PLAYER)
	inc	hl
	ld	(hl),#>(_Update_SPRITE_PLAYER)
	ld	hl,#(_spriteUpdateFuncs + 0x0002)
	ld	(hl),#<(_Update_SPRITE_POINTER)
	inc	hl
	ld	(hl),#>(_Update_SPRITE_POINTER)
	ld	hl,#(_spriteUpdateFuncs + 0x0004)
	ld	(hl),#<(_Update_SPRITE_SHIP)
	inc	hl
	ld	(hl),#>(_Update_SPRITE_SHIP)
	ld	hl,#(_spriteUpdateFuncs + 0x0006)
	ld	(hl),#<(_Update_SPRITE_UFO)
	inc	hl
	ld	(hl),#>(_Update_SPRITE_UFO)
	ld	hl,#(_spriteUpdateFuncs + 0x0008)
	ld	(hl),#<(_Update_SPRITE_ARROW)
	inc	hl
	ld	(hl),#>(_Update_SPRITE_ARROW)
	ld	hl,#(_spriteUpdateFuncs + 0x000a)
	ld	(hl),#<(_Update_SPRITE_ROCKET)
	inc	hl
	ld	(hl),#>(_Update_SPRITE_ROCKET)
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:48: Void_Func_Void spriteDestroyFuncs[] = {SPRITES};
	ld	hl,#_spriteDestroyFuncs
	ld	(hl),#<(_Destroy_SPRITE_PLAYER)
	inc	hl
	ld	(hl),#>(_Destroy_SPRITE_PLAYER)
	ld	hl,#(_spriteDestroyFuncs + 0x0002)
	ld	(hl),#<(_Destroy_SPRITE_POINTER)
	inc	hl
	ld	(hl),#>(_Destroy_SPRITE_POINTER)
	ld	hl,#(_spriteDestroyFuncs + 0x0004)
	ld	(hl),#<(_Destroy_SPRITE_SHIP)
	inc	hl
	ld	(hl),#>(_Destroy_SPRITE_SHIP)
	ld	hl,#(_spriteDestroyFuncs + 0x0006)
	ld	(hl),#<(_Destroy_SPRITE_UFO)
	inc	hl
	ld	(hl),#>(_Destroy_SPRITE_UFO)
	ld	hl,#(_spriteDestroyFuncs + 0x0008)
	ld	(hl),#<(_Destroy_SPRITE_ARROW)
	inc	hl
	ld	(hl),#>(_Destroy_SPRITE_ARROW)
	ld	hl,#(_spriteDestroyFuncs + 0x000a)
	ld	(hl),#<(_Destroy_SPRITE_ROCKET)
	inc	hl
	ld	(hl),#>(_Destroy_SPRITE_ROCKET)
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:52: UINT8* spriteDatas[] = {SPRITES};
	ld	hl,#_spriteDatas
	ld	(hl),#<(_player)
	inc	hl
	ld	(hl),#>(_player)
	ld	hl,#(_spriteDatas + 0x0002)
	ld	(hl),#<(_pointer)
	inc	hl
	ld	(hl),#>(_pointer)
	ld	hl,#(_spriteDatas + 0x0004)
	ld	(hl),#<(_spriteship)
	inc	hl
	ld	(hl),#>(_spriteship)
	ld	hl,#(_spriteDatas + 0x0006)
	ld	(hl),#<(_spriteufo)
	inc	hl
	ld	(hl),#>(_spriteufo)
	ld	hl,#(_spriteDatas + 0x0008)
	ld	(hl),#<(_spritearrow)
	inc	hl
	ld	(hl),#>(_spritearrow)
	ld	hl,#(_spriteDatas + 0x000a)
	ld	(hl),#<(_spriterocket)
	inc	hl
	ld	(hl),#>(_spriterocket)
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:56: UINT8 spriteDataBanks[] = {SPRITES};
	ld	hl,#_spriteDataBanks
	ld	(hl),#0x03
	ld	hl,#(_spriteDataBanks + 0x0001)
	ld	(hl),#0x03
	ld	hl,#(_spriteDataBanks + 0x0002)
	ld	(hl),#0x03
	ld	hl,#(_spriteDataBanks + 0x0003)
	ld	(hl),#0x03
	ld	hl,#(_spriteDataBanks + 0x0004)
	ld	(hl),#0x03
	ld	hl,#(_spriteDataBanks + 0x0005)
	ld	(hl),#0x03
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:60: FrameSize spriteFrameSizes[] = {SPRITES};
	ld	hl,#_spriteFrameSizes
	ld	(hl),#0x02
	ld	hl,#(_spriteFrameSizes + 0x0001)
	ld	(hl),#0x02
	ld	hl,#(_spriteFrameSizes + 0x0002)
	ld	(hl),#0x02
	ld	hl,#(_spriteFrameSizes + 0x0003)
	ld	(hl),#0x02
	ld	hl,#(_spriteFrameSizes + 0x0004)
	ld	(hl),#0x02
	ld	hl,#(_spriteFrameSizes + 0x0005)
	ld	(hl),#0x04
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:64: UINT8 spriteNumFrames[] = {SPRITES};
	ld	hl,#_spriteNumFrames
	ld	(hl),#0x0c
	ld	hl,#(_spriteNumFrames + 0x0001)
	ld	(hl),#0x10
	ld	hl,#(_spriteNumFrames + 0x0002)
	ld	(hl),#0x10
	ld	hl,#(_spriteNumFrames + 0x0003)
	ld	(hl),#0x10
	ld	hl,#(_spriteNumFrames + 0x0004)
	ld	(hl),#0x0c
	ld	hl,#(_spriteNumFrames + 0x0005)
	ld	(hl),#0x10
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:70: UINT8* spritePalDatas[] = {SPRITES};
	ld	hl,#_spritePalDatas
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_spritePalDatas + 0x0002)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_spritePalDatas + 0x0004)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_spritePalDatas + 0x0006)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_spritePalDatas + 0x0008)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_spritePalDatas + 0x000a)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_1
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:19: void InitStates() {
;	---------------------------------
; Function InitStates
; ---------------------------------
_InitStates::
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:20: STATES
	ld	de,#_stateBanks
	ld	hl,#_bank_STATE_MENU
	ld	a,(hl)
	ld	(de),a
	ld	de,#(_stateBanks + 0x0001)
	ld	hl,#_bank_STATE_GAME
	ld	a,(hl)
	ld	(de),a
	ld	de,#(_stateBanks + 0x0002)
	ld	hl,#_bank_STATE_CREDITS
	ld	a,(hl)
	ld	(de),a
	ld	de,#(_stateBanks + 0x0003)
	ld	hl,#_bank_STATE_LEVEL1
	ld	a,(hl)
	ld	(de),a
	ret
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:74: void InitSprites() {
;	---------------------------------
; Function InitSprites
; ---------------------------------
_InitSprites::
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:75: SPRITES
	ld	de,#_spriteBanks
	ld	hl,#_bank_SPRITE_PLAYER
	ld	a,(hl)
	ld	(de),a
	ld	de,#(_spriteBanks + 0x0001)
	ld	hl,#_bank_SPRITE_POINTER
	ld	a,(hl)
	ld	(de),a
	ld	de,#(_spriteBanks + 0x0002)
	ld	hl,#_bank_SPRITE_SHIP
	ld	a,(hl)
	ld	(de),a
	ld	de,#(_spriteBanks + 0x0003)
	ld	hl,#_bank_SPRITE_UFO
	ld	a,(hl)
	ld	(de),a
	ld	de,#(_spriteBanks + 0x0004)
	ld	hl,#_bank_SPRITE_ARROW
	ld	a,(hl)
	ld	(de),a
	ld	de,#(_spriteBanks + 0x0005)
	ld	hl,#_bank_SPRITE_ROCKET
	ld	a,(hl)
	ld	(de),a
	ret
	.area _CODE_1
	.area _CABS (ABS)
