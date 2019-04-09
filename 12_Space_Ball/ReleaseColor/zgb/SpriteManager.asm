;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module SpriteManager
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PopBank
	.globl _PushBank
	.globl _RefreshScroll
	.globl _DrawSprite
	.globl _InitSprite
	.globl _ClearOAMs
	.globl _SwapOAMs
	.globl _LoadSprite
	.globl _StackPop
	.globl _StackPush
	.globl _VectorRemovePos
	.globl _VectorAdd
	.globl _THIS
	.globl _THIS_IDX
	.globl _cachedSprite
	.globl _sprite_manager_removal_check
	.globl _sprite_manager_updatables
	.globl _sprite_manager_sprites_pool
	.globl _sprite_manager_sprites
	.globl _sprite_manager_sprites_mem
	.globl _SpriteManagerReset
	.globl _SpriteManagerLoad
	.globl _SpriteManagerAdd
	.globl _SpriteManagerRemove
	.globl _SpriteManagerRemoveSprite
	.globl _SpriteManagerFlushRemove
	.globl _SpriteManagerUpdate
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_sprite_manager_sprites_mem	=	0xcfa1
_sprite_manager_sprites::
	.ds 80
_sprite_manager_sprites_pool::
	.ds 41
_sprite_manager_updatables::
	.ds 41
_sprite_manager_removal_check::
	.ds 1
_cachedSprite::
	.ds 2
_THIS_IDX::
	.ds 1
_THIS::
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
;C:/gbdk/ZGB/common/src/SpriteManager.c:11: DECLARE_STACK(sprite_manager_sprites_pool, N_SPRITE_MANAGER_SPRITES);
	ld	hl,#_sprite_manager_sprites_pool
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/SpriteManager.c:14: DECLARE_VECTOR(sprite_manager_updatables, N_SPRITE_MANAGER_SPRITES);
	ld	hl,#_sprite_manager_updatables
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
;C:/gbdk/ZGB/common/src/SpriteManager.c:18: void SpriteManagerReset() {
;	---------------------------------
; Function SpriteManagerReset
; ---------------------------------
_SpriteManagerReset::
	add	sp, #-4
;C:/gbdk/ZGB/common/src/SpriteManager.c:22: for(i = 0u; i != sprite_manager_updatables[0]; ++ i) {
	ld	c,#0x00
00104$:
	ld	de, #_sprite_manager_updatables + 0
	ld	a,(de)
	ld	b,a
;C:/gbdk/ZGB/common/src/SpriteManager.c:23: THIS = sprite_manager_sprites[sprite_manager_updatables[i + 1]];
	ld	a,c
	cp	a,b
	jp	Z,00101$
	inc	a
	ldhl	sp,#1
	ld	(hl),a
	ld	de,#_sprite_manager_updatables
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_sprite_manager_sprites
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	hl,#_THIS
	ld	(hl+),a
	inc	de
	ld	a,(de)
;C:/gbdk/ZGB/common/src/SpriteManager.c:24: PUSH_BANK(spriteBanks[THIS->type]);
	ld	(hl-),a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0010
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(bc)
	add	a,#<(_spriteBanks)
	ld	c,a
	ld	a,#>(_spriteBanks)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	b,a
	push	bc
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/SpriteManager.c:25: spriteDestroyFuncs[THIS->type]();
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0010
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_spriteDestroyFuncs
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
	ld	l, c
	ld	h, b
	call	___sdcc_call_hl
;C:/gbdk/ZGB/common/src/SpriteManager.c:26: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/SpriteManager.c:22: for(i = 0u; i != sprite_manager_updatables[0]; ++ i) {
	ldhl	sp,#1
	ld	c,(hl)
	jp	00104$
00101$:
;C:/gbdk/ZGB/common/src/SpriteManager.c:30: sprite_manager_sprites_pool[0] = 0;
	ld	hl,#_sprite_manager_sprites_pool
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/SpriteManager.c:31: for(i = 0; i != N_SPRITE_MANAGER_SPRITES; ++i) {
	ldhl	sp,#0
	ld	(hl),#0x00
00106$:
;C:/gbdk/ZGB/common/src/SpriteManager.c:32: sprite_manager_sprites[i] = (struct Sprite*)&sprite_manager_sprites_mem[sizeof(struct Sprite) * (UINT16)i];
	ldhl	sp,#0
	ld	c,(hl)
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_sprite_manager_sprites
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#2
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#0
	ld	c,(hl)
	ld	b,#0x00
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	ld	hl,#_sprite_manager_sprites_mem
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#2
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
;C:/gbdk/ZGB/common/src/SpriteManager.c:33: StackPush(sprite_manager_sprites_pool, i);		
	ldhl	sp,#0
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#_sprite_manager_sprites_pool
	push	hl
	call	_StackPush
	add	sp, #3
;C:/gbdk/ZGB/common/src/SpriteManager.c:31: for(i = 0; i != N_SPRITE_MANAGER_SPRITES; ++i) {
	ldhl	sp,#0
	inc	(hl)
	ld	a,(hl)
	sub	a, #0x28
	jp	NZ,00106$
;C:/gbdk/ZGB/common/src/SpriteManager.c:35: ClearOAMs();
	call	_ClearOAMs
;C:/gbdk/ZGB/common/src/SpriteManager.c:38: sprite_manager_updatables[0] = 0;
	ld	hl,#_sprite_manager_updatables
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/SpriteManager.c:39: sprite_manager_removal_check = 0;
	ld	hl,#_sprite_manager_removal_check
	ld	(hl),#0x00
	add	sp, #4
	ret
;C:/gbdk/ZGB/common/src/SpriteManager.c:42: void SpriteManagerLoad(UINT8 sprite_type) {
;	---------------------------------
; Function SpriteManagerLoad
; ---------------------------------
_SpriteManagerLoad::
	add	sp, #-8
;C:/gbdk/ZGB/common/src/SpriteManager.c:43: spriteIdxs[sprite_type] = LoadSprite(spriteNumFrames[sprite_type], spriteDatas[sprite_type], spriteDataBanks[sprite_type], spriteFrameSizes[sprite_type], spritePalDatas[sprite_type]);
	ld	de,#_spriteIdxs
	ldhl	sp,#10
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#4
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#10
	ld	c,(hl)
	ld	b,#0x00
	sla	c
	rl	b
	ldhl	sp,#6
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	de,#_spritePalDatas
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ldhl	sp,#2
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ld	de,#_spriteFrameSizes
	ldhl	sp,#10
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ldhl	sp,#1
	ld	(hl),a
	ld	de,#_spriteDataBanks
	ldhl	sp,#10
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ldhl	sp,#0
	ld	(hl),a
	ld	de,#_spriteDatas
	ldhl	sp,#6
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ldhl	sp,#6
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ld	de,#_spriteNumFrames
	ldhl	sp,#10
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	b,a
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	ldhl	sp,#3
	ld	a,(hl)
	push	af
	inc	sp
	dec	hl
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#10
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	inc	sp
	call	_LoadSprite
	add	sp, #7
	ld	c,e
	ldhl	sp,#4
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	add	sp, #8
	ret
;C:/gbdk/ZGB/common/src/SpriteManager.c:47: struct Sprite* SpriteManagerAdd(UINT8 sprite_type, UINT16 x, UINT16 y) {
;	---------------------------------
; Function SpriteManagerAdd
; ---------------------------------
_SpriteManagerAdd::
	add	sp, #-8
;C:/gbdk/ZGB/common/src/SpriteManager.c:52: sprite_idx = StackPop(sprite_manager_sprites_pool);
	ld	hl,#_sprite_manager_sprites_pool
	push	hl
	call	_StackPop
	add	sp, #2
	ldhl	sp,#0
	ld	(hl),e
;C:/gbdk/ZGB/common/src/SpriteManager.c:53: sprite = sprite_manager_sprites[sprite_idx];
	ld	c,(hl)
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_sprite_manager_sprites
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ldhl	sp,#1
	ld	(hl+),a
	inc	de
	ld	a,(de)
;C:/gbdk/ZGB/common/src/SpriteManager.c:54: sprite->type = sprite_type;
	ld	(hl-),a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0010
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#6
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ldhl	sp,#10
	ld	a,(hl)
	ld	(de),a
;C:/gbdk/ZGB/common/src/SpriteManager.c:55: sprite->marked_for_removal = 0;
	ldhl	sp,#(2 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0011
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;C:/gbdk/ZGB/common/src/SpriteManager.c:56: sprite->lim_x = 32u;
	ldhl	sp,#(2 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0012
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x20
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
;C:/gbdk/ZGB/common/src/SpriteManager.c:57: sprite->lim_y = 32u;
	ldhl	sp,#(2 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0014
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x20
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
;C:/gbdk/ZGB/common/src/SpriteManager.c:58: sprite->flags = 0;
	ldhl	sp,#(2 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000b
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;C:/gbdk/ZGB/common/src/SpriteManager.c:60: VectorAdd(sprite_manager_updatables, sprite_idx);
	ldhl	sp,#0
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#_sprite_manager_updatables
	push	hl
	call	_VectorAdd
	add	sp, #3
;C:/gbdk/ZGB/common/src/SpriteManager.c:62: InitSprite(sprite, spriteFrameSizes[sprite_type], spriteIdxs[sprite_type]);
	ld	de,#_spriteIdxs
	ldhl	sp,#10
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ldhl	sp,#5
	ld	(hl),a
	ld	de,#_spriteFrameSizes
	ldhl	sp,#10
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	b,a
	ldhl	sp,#5
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,#3
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_InitSprite
	add	sp, #4
;C:/gbdk/ZGB/common/src/SpriteManager.c:63: sprite->x = x;
	ldhl	sp,#(2 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0007
	add	hl,de
	ld	c,l
	ld	b,h
	ldhl	sp,#11
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;C:/gbdk/ZGB/common/src/SpriteManager.c:64: sprite->y = y;
	ldhl	sp,#(2 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0009
	add	hl,de
	ld	c,l
	ld	b,h
	ldhl	sp,#13
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;C:/gbdk/ZGB/common/src/SpriteManager.c:67: cachedSprite = THIS;
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_cachedSprite
	ld	(hl+),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/SpriteManager.c:68: spriteIdxTmp = THIS_IDX;
	ld	hl,#_THIS_IDX
	ld	a,(hl)
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/SpriteManager.c:69: THIS = sprite;
	ldhl	sp,#1
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_THIS
	ld	(hl+),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/SpriteManager.c:70: THIS_IDX = sprite_manager_updatables[0] - 1;
	ld	a, (#_sprite_manager_updatables + 0)
	add	a,#0xff
	ld	hl,#_THIS_IDX
	ld	(hl),a
;C:/gbdk/ZGB/common/src/SpriteManager.c:71: PUSH_BANK(spriteBanks[sprite->type]);
	ldhl	sp,#(7 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	add	a,#<(_spriteBanks)
	ld	c,a
	ld	a,#>(_spriteBanks)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	b,a
	push	bc
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/SpriteManager.c:72: spriteStartFuncs[sprite->type]();
	ldhl	sp,#(7 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_spriteStartFuncs
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
	ld	l, c
	ld	h, b
	call	___sdcc_call_hl
;C:/gbdk/ZGB/common/src/SpriteManager.c:73: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/SpriteManager.c:75: THIS = cachedSprite;
	ld	hl,#_cachedSprite
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_THIS
	ld	(hl+),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/SpriteManager.c:76: THIS_IDX = spriteIdxTmp;
	push	hl
	ldhl	sp,#5
	ld	a,(hl)
	ld	hl,#_THIS_IDX
	ld	(hl),a
	pop	hl
;C:/gbdk/ZGB/common/src/SpriteManager.c:77: return sprite;
	ldhl	sp,#(2 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	add	sp, #8
	ret
;C:/gbdk/ZGB/common/src/SpriteManager.c:80: void SpriteManagerRemove(int idx) {
;	---------------------------------
; Function SpriteManagerRemove
; ---------------------------------
_SpriteManagerRemove::
;C:/gbdk/ZGB/common/src/SpriteManager.c:81: sprite_manager_removal_check = 1;
	ld	hl,#_sprite_manager_removal_check
	ld	(hl),#0x01
;C:/gbdk/ZGB/common/src/SpriteManager.c:82: sprite_manager_sprites[sprite_manager_updatables[idx + 1]]->marked_for_removal = 1;
	ldhl	sp,#2
	ld	c,(hl)
	inc	c
	ld	a,#<(_sprite_manager_updatables)
	add	a, c
	ld	c,a
	ld	a,#>(_sprite_manager_updatables)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_sprite_manager_sprites
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
	ld	hl,#0x0011
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x01
	ld	(bc),a
	ret
;C:/gbdk/ZGB/common/src/SpriteManager.c:85: void SpriteManagerRemoveSprite(struct Sprite* sprite) {
;	---------------------------------
; Function SpriteManagerRemoveSprite
; ---------------------------------
_SpriteManagerRemoveSprite::
	add	sp, #-2
;C:/gbdk/ZGB/common/src/SpriteManager.c:88: for(i = 0u; i != sprite_manager_updatables[0]; ++i) {
	ldhl	sp,#0
	ld	(hl),#0x00
00105$:
	ld	de, #_sprite_manager_updatables + 0
	ld	a,(de)
	ld	c,a
	ldhl	sp,#0
	ld	a,(hl)
	sub	a, c
	jp	Z,00107$
;C:/gbdk/ZGB/common/src/SpriteManager.c:89: s = sprite_manager_sprites[sprite_manager_updatables[i + 1]];
	ldhl	sp,#0
	ld	a,(hl)
	inc	a
	inc	hl
	ld	(hl),a
	ld	de,#_sprite_manager_updatables
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_sprite_manager_sprites
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
;C:/gbdk/ZGB/common/src/SpriteManager.c:90: if(s == sprite) {
	ldhl	sp,#4
	ld	a,(hl)
	sub	a, c
	jr	NZ,00106$
	inc	hl
	ld	a,(hl)
	sub	a, b
	jr	NZ,00106$
;C:/gbdk/ZGB/common/src/SpriteManager.c:91: SpriteManagerRemove(i);
	ldhl	sp,#0
	ld	c,(hl)
	ld	b,#0x00
	push	bc
	call	_SpriteManagerRemove
	add	sp, #2
;C:/gbdk/ZGB/common/src/SpriteManager.c:92: break;
	jr	00107$
00106$:
;C:/gbdk/ZGB/common/src/SpriteManager.c:88: for(i = 0u; i != sprite_manager_updatables[0]; ++i) {
	ldhl	sp,#1
	ld	c,(hl)
	dec	hl
	ld	(hl),c
	jp	00105$
00107$:
	add	sp, #2
	ret
;C:/gbdk/ZGB/common/src/SpriteManager.c:97: void SpriteManagerFlushRemove() {
;	---------------------------------
; Function SpriteManagerFlushRemove
; ---------------------------------
_SpriteManagerFlushRemove::
	dec	sp
;C:/gbdk/ZGB/common/src/SpriteManager.c:99: for(THIS_IDX = sprite_manager_updatables[0] - 1u; (UINT8)(THIS_IDX + 1u) != 0u; THIS_IDX --) {
	ld	a, (#_sprite_manager_updatables + 0)
	add	a,#0xff
	ld	hl,#_THIS_IDX
	ld	(hl),a
00105$:
	ld	hl,#_THIS_IDX
	ld	c,(hl)
	inc	c
	ld	a,c
	or	a, a
	jp	Z,00103$
;C:/gbdk/ZGB/common/src/SpriteManager.c:100: THIS = sprite_manager_sprites[sprite_manager_updatables[THIS_IDX + 1u]];
	ld	a,#<(_sprite_manager_updatables)
	add	a, c
	ld	c,a
	ld	a,#>(_sprite_manager_updatables)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ldhl	sp,#0
	ld	(hl),a
	ld	c,(hl)
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_sprite_manager_sprites
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	hl,#_THIS
	ld	(hl+),a
	inc	de
	ld	a,(de)
;C:/gbdk/ZGB/common/src/SpriteManager.c:101: if(THIS->marked_for_removal) {
	ld	(hl-),a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0011
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(bc)
	or	a, a
	jp	Z,00106$
;C:/gbdk/ZGB/common/src/SpriteManager.c:102: StackPush(sprite_manager_sprites_pool, sprite_manager_updatables[THIS_IDX + 1u]);
	ldhl	sp,#0
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#_sprite_manager_sprites_pool
	push	hl
	call	_StackPush
	add	sp, #3
;C:/gbdk/ZGB/common/src/SpriteManager.c:103: VectorRemovePos(sprite_manager_updatables, THIS_IDX);
	ld	hl,#_THIS_IDX
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#_sprite_manager_updatables
	push	hl
	call	_VectorRemovePos
	add	sp, #3
;C:/gbdk/ZGB/common/src/SpriteManager.c:105: PUSH_BANK(spriteBanks[THIS->type]);
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0010
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(bc)
	add	a,#<(_spriteBanks)
	ld	c,a
	ld	a,#>(_spriteBanks)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	b,a
	push	bc
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/SpriteManager.c:106: spriteDestroyFuncs[THIS->type]();
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0010
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_spriteDestroyFuncs
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
	ld	l, c
	ld	h, b
	call	___sdcc_call_hl
;C:/gbdk/ZGB/common/src/SpriteManager.c:107: POP_BANK;
	call	_PopBank
00106$:
;C:/gbdk/ZGB/common/src/SpriteManager.c:99: for(THIS_IDX = sprite_manager_updatables[0] - 1u; (UINT8)(THIS_IDX + 1u) != 0u; THIS_IDX --) {
	ld	hl,#_THIS_IDX
	dec	(hl)
	jp	00105$
00103$:
;C:/gbdk/ZGB/common/src/SpriteManager.c:110: sprite_manager_removal_check = 0;
	ld	hl,#_sprite_manager_removal_check
	ld	(hl),#0x00
	inc	sp
	ret
;C:/gbdk/ZGB/common/src/SpriteManager.c:118: void SpriteManagerUpdate() {
;	---------------------------------
; Function SpriteManagerUpdate
; ---------------------------------
_SpriteManagerUpdate::
	add	sp, #-2
;C:/gbdk/ZGB/common/src/SpriteManager.c:119: for(THIS_IDX = 0u; THIS_IDX != sprite_manager_updatables[0]; ++THIS_IDX) {
	ld	hl,#_THIS_IDX
	ld	(hl),#0x00
00109$:
	ld	de, #_sprite_manager_updatables + 0
	ld	a,(de)
	ld	c,a
	ld	hl,#_THIS_IDX
	ld	a,(hl)
	sub	a, c
	jp	Z,00105$
;C:/gbdk/ZGB/common/src/SpriteManager.c:120: THIS = sprite_manager_sprites[sprite_manager_updatables[THIS_IDX + 1]];
	ld	hl,#_THIS_IDX
	ld	c,(hl)
	inc	c
	ld	a,#<(_sprite_manager_updatables)
	add	a, c
	ld	c,a
	ld	a,#>(_sprite_manager_updatables)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_sprite_manager_sprites
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	hl,#_THIS
	ld	(hl+),a
	inc	de
	ld	a,(de)
;C:/gbdk/ZGB/common/src/SpriteManager.c:121: if(!THIS->marked_for_removal) {
	ld	(hl-),a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0011
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	pop	de
	push	de
	ld	a,(de)
	or	a, a
	jp	NZ,00110$
;C:/gbdk/ZGB/common/src/SpriteManager.c:123: PUSH_BANK(spriteBanks[THIS->type]);
	ld	hl,#0x0010
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(bc)
	add	a,#<(_spriteBanks)
	ld	c,a
	ld	a,#>(_spriteBanks)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	b,a
	push	bc
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/SpriteManager.c:124: spriteUpdateFuncs[THIS->type]();
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0010
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_spriteUpdateFuncs
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
	ld	l, c
	ld	h, b
	call	___sdcc_call_hl
;C:/gbdk/ZGB/common/src/SpriteManager.c:126: if(THIS == scroll_target)
	ld	hl,#_THIS
	ld	a,(hl)
	ld	hl,#_scroll_target
	sub	a, (hl)
	jr	NZ,00102$
	ld	hl,#_THIS + 1
	ld	a,(hl)
	ld	hl,#_scroll_target + 1
	sub	a, (hl)
	jr	NZ,00102$
;C:/gbdk/ZGB/common/src/SpriteManager.c:127: RefreshScroll();
	call	_RefreshScroll
00102$:
;C:/gbdk/ZGB/common/src/SpriteManager.c:129: DrawSprite(THIS); //this needs to be done using the sprite bank because the animation array is stored there
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_DrawSprite
	add	sp, #2
;C:/gbdk/ZGB/common/src/SpriteManager.c:131: POP_BANK;
	call	_PopBank
00110$:
;C:/gbdk/ZGB/common/src/SpriteManager.c:119: for(THIS_IDX = 0u; THIS_IDX != sprite_manager_updatables[0]; ++THIS_IDX) {
	ld	hl,#_THIS_IDX
	inc	(hl)
	jp	00109$
00105$:
;C:/gbdk/ZGB/common/src/SpriteManager.c:135: SwapOAMs();
	call	_SwapOAMs
;C:/gbdk/ZGB/common/src/SpriteManager.c:137: if(sprite_manager_removal_check) {
	ld	hl,#_sprite_manager_removal_check
	ld	a,(hl)
	or	a, a
	jr	Z,00111$
;C:/gbdk/ZGB/common/src/SpriteManager.c:138: SpriteManagerFlushRemove();
	call	_SpriteManagerFlushRemove
00111$:
	add	sp, #2
	ret
	.area _CODE
	.area _CABS (ABS)
