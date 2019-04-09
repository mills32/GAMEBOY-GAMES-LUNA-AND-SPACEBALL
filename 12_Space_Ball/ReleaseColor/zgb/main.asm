;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _MusicUpdate
	.globl _InitSprites
	.globl _InitStates
	.globl _vbl_update
	.globl _CP_Reset_Chan
	.globl _CP_Mute_Chan
	.globl _CP_UpdateMusic
	.globl _DMA_TRANSFER
	.globl _FadeOut
	.globl _FadeIn
	.globl _PopBank
	.globl _PushBank
	.globl _SpriteManagerUpdate
	.globl _SpriteManagerReset
	.globl _display_off
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _disable_interrupts
	.globl _enable_interrupts
	.globl _joypad
	.globl _add_TIM
	.globl _add_VBL
	.globl _cpu_fast
	.globl _set_sprite_palette
	.globl _set_bkg_palette
	.globl _default_palette
	.globl _music_mute_frames
	.globl _old_scroll_y
	.globl _old_scroll_x
	.globl _vbl_count
	.globl _last_music
	.globl _state_running
	.globl _current_state
	.globl _delta_time
	.globl _CP_Muted_Chan
	.globl _SetState
	.globl _SetPalette
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_CP_Muted_Chan::
	.ds 1
_delta_time::
	.ds 1
_current_state::
	.ds 1
_state_running::
	.ds 1
_last_music::
	.ds 2
_vbl_count::
	.ds 1
_old_scroll_x::
	.ds 2
_old_scroll_y::
	.ds 2
_music_mute_frames::
	.ds 1
_default_palette::
	.ds 8
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
;C:/gbdk/ZGB/common/src/main.c:30: UINT8 state_running = 0;
	ld	hl,#_state_running
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/main.c:37: void* last_music = 0;
	ld	hl,#_last_music
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/main.c:42: UINT8 music_mute_frames = 0;
	ld	hl,#_music_mute_frames
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/main.c:103: UINT16 default_palette[] = {RGB(31, 31, 31), RGB(20, 20, 20), RGB(10, 10, 10), RGB(0, 0, 0)};
	ld	hl,#_default_palette
	ld	(hl),#0xff
	inc	hl
	ld	(hl),#0x7f
	ld	hl,#(_default_palette + 0x0002)
	ld	(hl),#0x94
	inc	hl
	ld	(hl),#0x52
	ld	hl,#(_default_palette + 0x0004)
	ld	(hl),#0x4a
	inc	hl
	ld	(hl),#0x29
	ld	hl,#(_default_palette + 0x0006)
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
	.area _CODE
;C:/gbdk/ZGB/common/src/main.c:32: void SetState(UINT8 state) {
;	---------------------------------
; Function SetState
; ---------------------------------
_SetState::
;C:/gbdk/ZGB/common/src/main.c:33: state_running = 0;
	ld	hl,#_state_running
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/main.c:34: next_state = state;
	push	hl
	ldhl	sp,#4
	ld	a,(hl)
	ld	hl,#_next_state
	ld	(hl),a
	pop	hl
	ret
;C:/gbdk/ZGB/common/src/main.c:43: void vbl_update() {
;	---------------------------------
; Function vbl_update
; ---------------------------------
_vbl_update::
;C:/gbdk/ZGB/common/src/main.c:44: vbl_count ++;
	ld	hl,#_vbl_count
	inc	(hl)
;C:/gbdk/ZGB/common/src/main.c:46: if (ZGB_Parallax == 1){
	ld	hl,#_ZGB_Parallax
	ld	a,(hl)
	dec	a
	jr	NZ,00102$
;C:/gbdk/ZGB/common/src/main.c:47: DMA_TRANSFER((UINT16*)0xD000,(UINT16*)0x8800);//tile 128
	ld	hl,#0x8800
	push	hl
	ld	h, #0xd0
	push	hl
	call	_DMA_TRANSFER
	add	sp, #4
00102$:
;C:/gbdk/ZGB/common/src/main.c:52: if(old_scroll_x < scroll_x)
	ld	hl,#_old_scroll_x
	ld	d, h
	ld	e, l
	ld	hl,#_scroll_x
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z,00137$
	bit	7, d
	jr	NZ,00138$
	cp	a, a
	jr	00138$
00137$:
	bit	7, d
	jr	Z,00138$
	scf
00138$:
	jr	NC,00106$
;C:/gbdk/ZGB/common/src/main.c:53: old_scroll_x += (scroll_x - old_scroll_x + 1) >> 1;
	ld	hl,#_scroll_x
	ld	a,(hl)
	ld	hl,#_old_scroll_x
	sub	a, (hl)
	ld	c,a
	ld	hl,#_scroll_x + 1
	ld	a,(hl)
	ld	hl,#_old_scroll_x + 1
	sbc	a, (hl)
	ld	b,a
	inc	bc
	sra	b
	rr	c
	dec	hl
	ld	a,(hl)
	add	a, c
	ld	(hl+),a
	ld	a,(hl)
	adc	a, b
	ld	(hl),a
	jp	00107$
00106$:
;C:/gbdk/ZGB/common/src/main.c:54: else if(old_scroll_x > scroll_x)
	ld	hl,#_scroll_x
	ld	d, h
	ld	e, l
	ld	hl,#_old_scroll_x
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z,00139$
	bit	7, d
	jr	NZ,00140$
	cp	a, a
	jr	00140$
00139$:
	bit	7, d
	jr	Z,00140$
	scf
00140$:
	jr	NC,00107$
;C:/gbdk/ZGB/common/src/main.c:55: old_scroll_x -= (old_scroll_x - scroll_x + 1) >> 1;
	ld	hl,#_old_scroll_x
	ld	a,(hl)
	ld	hl,#_scroll_x
	sub	a, (hl)
	ld	c,a
	ld	hl,#_old_scroll_x + 1
	ld	a,(hl)
	ld	hl,#_scroll_x + 1
	sbc	a, (hl)
	ld	b,a
	inc	bc
	sra	b
	rr	c
	ld	hl,#_old_scroll_x
	ld	a,(hl)
	sub	a, c
	ld	(hl+),a
	ld	a,(hl)
	sbc	a, b
	ld	(hl),a
00107$:
;C:/gbdk/ZGB/common/src/main.c:56: SCX_REG = old_scroll_x + (scroll_offset_x << 3);
	ld	hl,#_old_scroll_x
	ld	c,(hl)
	ld	hl,#_scroll_offset_x
	ld	a,(hl)
	swap	a
	rrca
	and	a,#0xf8
	ld	b, a
	add	a,c
	ld	de,#0xff43
	ld	(de),a
;C:/gbdk/ZGB/common/src/main.c:58: if(old_scroll_y < scroll_y)
	ld	hl,#_old_scroll_y
	ld	d, h
	ld	e, l
	ld	hl,#_scroll_y
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z,00141$
	bit	7, d
	jr	NZ,00142$
	cp	a, a
	jr	00142$
00141$:
	bit	7, d
	jr	Z,00142$
	scf
00142$:
	jr	NC,00111$
;C:/gbdk/ZGB/common/src/main.c:59: old_scroll_y += (scroll_y - old_scroll_y + 1) >> 1;
	ld	hl,#_scroll_y
	ld	a,(hl)
	ld	hl,#_old_scroll_y
	sub	a, (hl)
	ld	c,a
	ld	hl,#_scroll_y + 1
	ld	a,(hl)
	ld	hl,#_old_scroll_y + 1
	sbc	a, (hl)
	ld	b,a
	inc	bc
	sra	b
	rr	c
	dec	hl
	ld	a,(hl)
	add	a, c
	ld	(hl+),a
	ld	a,(hl)
	adc	a, b
	ld	(hl),a
	jp	00112$
00111$:
;C:/gbdk/ZGB/common/src/main.c:60: else if(old_scroll_y > scroll_y)
	ld	hl,#_scroll_y
	ld	d, h
	ld	e, l
	ld	hl,#_old_scroll_y
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z,00143$
	bit	7, d
	jr	NZ,00144$
	cp	a, a
	jr	00144$
00143$:
	bit	7, d
	jr	Z,00144$
	scf
00144$:
	jr	NC,00112$
;C:/gbdk/ZGB/common/src/main.c:61: old_scroll_y -= (old_scroll_y - scroll_y + 1) >> 1;
	ld	hl,#_old_scroll_y
	ld	a,(hl)
	ld	hl,#_scroll_y
	sub	a, (hl)
	ld	c,a
	ld	hl,#_old_scroll_y + 1
	ld	a,(hl)
	ld	hl,#_scroll_y + 1
	sbc	a, (hl)
	ld	b,a
	inc	bc
	sra	b
	rr	c
	ld	hl,#_old_scroll_y
	ld	a,(hl)
	sub	a, c
	ld	(hl+),a
	ld	a,(hl)
	sbc	a, b
	ld	(hl),a
00112$:
;C:/gbdk/ZGB/common/src/main.c:62: SCY_REG = old_scroll_y + (scroll_offset_y << 3);
	ld	hl,#_old_scroll_y
	ld	c,(hl)
	ld	hl,#_scroll_offset_y
	ld	a,(hl)
	swap	a
	rrca
	and	a,#0xf8
	ld	b, a
	add	a,c
	ld	de,#0xff42
	ld	(de),a
	ret
;C:/gbdk/ZGB/common/src/main.c:69: void MusicUpdate() {
;	---------------------------------
; Function MusicUpdate
; ---------------------------------
_MusicUpdate::
;C:/gbdk/ZGB/common/src/main.c:70: if (ZGB_CP_ON == 1) {
	ld	hl,#_ZGB_CP_ON
	ld	a,(hl)
	dec	a
	jr	NZ,00102$
;C:/gbdk/ZGB/common/src/main.c:71: CP_UpdateMusic();
	call	_CP_UpdateMusic
00102$:
;C:/gbdk/ZGB/common/src/main.c:73: if(music_mute_frames != 0){
	ld	hl,#_music_mute_frames
	ld	a,(hl)
	or	a, a
	jr	Z,00106$
;C:/gbdk/ZGB/common/src/main.c:74: PUSH_BANK(1);
	ld	a,#0x01
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/main.c:75: CP_Mute_Chan(CP_Muted_Chan);
	ld	hl,#_CP_Muted_Chan
	ld	a,(hl)
	push	af
	inc	sp
	call	_CP_Mute_Chan
	inc	sp
;C:/gbdk/ZGB/common/src/main.c:76: if(music_mute_frames == 1){
	ld	hl,#_music_mute_frames
	ld	a,(hl)
	dec	a
	jr	NZ,00104$
;C:/gbdk/ZGB/common/src/main.c:77: CP_Reset_Chan(CP_Muted_Chan);
	ld	hl,#_CP_Muted_Chan
	ld	a,(hl)
	push	af
	inc	sp
	call	_CP_Reset_Chan
	inc	sp
00104$:
;C:/gbdk/ZGB/common/src/main.c:79: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/main.c:81: music_mute_frames --;
	ld	hl,#_music_mute_frames
	dec	(hl)
00106$:
;C:/gbdk/ZGB/common/src/main.c:83: REFRESH_BANK;
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
;C:/gbdk/ZGB/common/src/main.c:89: void SetPalette(UWORD *bpal, UWORD *spal, UINT8 bbank){
;	---------------------------------
; Function SetPalette
; ---------------------------------
_SetPalette::
	add	sp, #-3
;C:/gbdk/ZGB/common/src/main.c:93: PUSH_BANK(bbank);	
	ldhl	sp,#9
	ld	a,(hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/main.c:94: for(i = 0; i != 32; ++i) ZGB_Fading_BPal[i] = bpal[i];
	ldhl	sp,#0
	ld	(hl),#0x00
00103$:
	ldhl	sp,#0
	ld	c,(hl)
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_ZGB_Fading_BPal
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#5
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
	ldhl	sp,#1
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ldhl	sp,#0
	inc	(hl)
	ld	a,(hl)
	sub	a, #0x20
	jp	NZ,00103$
;C:/gbdk/ZGB/common/src/main.c:95: for(i = 0; i != 32; ++i) ZGB_Fading_SPal[i] = spal[i];
	ldhl	sp,#0
	ld	(hl),#0x00
00105$:
	ldhl	sp,#0
	ld	c,(hl)
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_ZGB_Fading_SPal
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#7
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
	ldhl	sp,#1
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ldhl	sp,#0
	inc	(hl)
	ld	a,(hl)
	sub	a, #0x20
	jp	NZ,00105$
;C:/gbdk/ZGB/common/src/main.c:96: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/main.c:98: set_bkg_palette(0, 8, bpal);
	ldhl	sp,#5
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x0800
	push	hl
	call	_set_bkg_palette
	add	sp, #4
;C:/gbdk/ZGB/common/src/main.c:99: set_sprite_palette(0, 8, spal);	
	ldhl	sp,#7
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x0800
	push	hl
	call	_set_sprite_palette
	add	sp, #4
	add	sp, #3
	ret
;C:/gbdk/ZGB/common/src/main.c:104: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;C:/gbdk/ZGB/common/src/main.c:106: cpu_fast();
	call	_cpu_fast
;C:/gbdk/ZGB/common/src/main.c:109: PUSH_BANK(1);
	ld	a,#0x01
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/main.c:110: InitStates();
	call	_InitStates
;C:/gbdk/ZGB/common/src/main.c:111: InitSprites();
	call	_InitSprites
;C:/gbdk/ZGB/common/src/main.c:112: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/main.c:114: disable_interrupts();
	call	_disable_interrupts
;C:/gbdk/ZGB/common/src/main.c:115: add_VBL(vbl_update);
	ld	hl,#_vbl_update
	push	hl
	call	_add_VBL
	add	sp, #2
;C:/gbdk/ZGB/common/src/main.c:116: add_TIM(MusicUpdate);
	ld	hl,#_MusicUpdate
	push	hl
	call	_add_TIM
	add	sp, #2
;C:/gbdk/ZGB/common/src/main.c:118: TMA_REG = _cpu == CGB_TYPE ? 120U : 0xBCU;
	ld	hl,#__cpu
	ld	a,(hl)
	sub	a, #0x11
	jr	NZ,00113$
	ld	bc,#0x0078
	jr	00114$
00113$:
	ld	bc,#0x00bc
00114$:
	ld	hl,#0xff06
	ld	(hl),c
;C:/gbdk/ZGB/common/src/main.c:122: TAC_REG = 0x04U;
	ld	l, #0x07
	ld	(hl),#0x04
;C:/gbdk/ZGB/common/src/main.c:124: set_interrupts(VBL_IFLAG | TIM_IFLAG);
	ld	a,#0x05
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;C:/gbdk/ZGB/common/src/main.c:125: enable_interrupts();
	call	_enable_interrupts
;C:/gbdk/ZGB/common/src/main.c:128: while (state_running) {
00103$:
	ld	hl,#_state_running
	ld	a,(hl)
	or	a, a
	jp	Z,00105$
;C:/gbdk/ZGB/common/src/main.c:129: if(!vbl_count)
	ld	hl,#_vbl_count
	ld	a,(hl)
	or	a, a
	jr	NZ,00102$
;C:/gbdk/ZGB/common/src/main.c:130: wait_vbl_done();
	call	_wait_vbl_done
00102$:
;C:/gbdk/ZGB/common/src/main.c:131: delta_time = vbl_count == 1u ? 0u : 1u;
	ld	hl,#_vbl_count
	ld	a,(hl)
	dec	a
	jr	NZ,00115$
	ld	bc,#0x0000
	jr	00116$
00115$:
	ld	bc,#0x0001
00116$:
	ld	hl,#_delta_time
	ld	(hl),c
;C:/gbdk/ZGB/common/src/main.c:132: vbl_count = 0;
	ld	hl,#_vbl_count
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/main.c:133: UPDATE_KEYS();
	push	hl
	ld	hl,#_keys
	ld	a,(hl)
	ld	hl,#_previous_keys
	ld	(hl),a
	pop	hl
	call	_joypad
	ld	hl,#_keys
	ld	(hl),e
;C:/gbdk/ZGB/common/src/main.c:134: PUSH_BANK(stateBanks[current_state]);
	ld	a,#<(_stateBanks)
	ld	hl,#_current_state
	add	a, (hl)
	ld	c,a
	ld	a,#>(_stateBanks)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	b,a
	push	bc
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/main.c:135: updateFuncs[current_state]();
	ld	hl,#_current_state
	ld	c,(hl)
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_updateFuncs
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
;C:/gbdk/ZGB/common/src/main.c:136: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/main.c:137: SpriteManagerUpdate();
	call	_SpriteManagerUpdate
	jp	00103$
00105$:
;C:/gbdk/ZGB/common/src/main.c:140: FadeIn();
	call	_FadeIn
;C:/gbdk/ZGB/common/src/main.c:141: DISPLAY_OFF
	call	_display_off
;C:/gbdk/ZGB/common/src/main.c:143: last_music = 0;
	ld	hl,#_last_music
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/main.c:145: last_sprite_loaded = 0;
	ld	hl,#_last_sprite_loaded
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/main.c:146: SpriteManagerReset();
	call	_SpriteManagerReset
;C:/gbdk/ZGB/common/src/main.c:147: state_running = 1;
	ld	hl,#_state_running
	ld	(hl),#0x01
;C:/gbdk/ZGB/common/src/main.c:148: current_state = next_state;
	push	hl
	ld	hl,#_next_state
	ld	a,(hl)
	ld	hl,#_current_state
	ld	(hl),a
	pop	hl
;C:/gbdk/ZGB/common/src/main.c:149: scroll_target = 0;
	ld	hl,#_scroll_target
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;C:/gbdk/ZGB/common/src/main.c:157: BGP_REG = OBP0_REG = OBP1_REG = PAL_DEF(0, 1, 2, 3);
	ld	hl,#0xff49
	ld	(hl),#0xe4
	ld	l, #0x48
	ld	(hl),#0xe4
	ld	l, #0x47
	ld	(hl),#0xe4
;C:/gbdk/ZGB/common/src/main.c:159: PUSH_BANK(stateBanks[current_state]);
	ld	a,#<(_stateBanks)
	ld	hl,#_current_state
	add	a, (hl)
	ld	c,a
	ld	a,#>(_stateBanks)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	b,a
	push	bc
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/main.c:160: (startFuncs[current_state])();
	ld	hl,#_current_state
	ld	c,(hl)
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_startFuncs
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
;C:/gbdk/ZGB/common/src/main.c:161: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/main.c:162: old_scroll_x = scroll_x;
	ld	hl,#_scroll_x
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_old_scroll_x
	ld	(hl+),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/main.c:163: old_scroll_y = scroll_y;
	ld	hl,#_scroll_y
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_old_scroll_y
	ld	(hl+),a
	ld	(hl),e
;C:/gbdk/ZGB/common/src/main.c:165: if(state_running) {
	ld	hl,#_state_running
	ld	a,(hl)
	or	a, a
	jp	Z,00103$
;C:/gbdk/ZGB/common/src/main.c:166: DISPLAY_ON;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	7, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;C:/gbdk/ZGB/common/src/main.c:167: FadeOut();
	call	_FadeOut
	jp	00103$
	ret
	.area _CODE
	.area _CABS (ABS)
