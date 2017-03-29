#pragma bank=2
#include "ZGBMain.h"
#include "SpritePlayer.h"
#include "Scroll.h"
#include "Sound.h"
#include "Keys.h"
#include "SpriteManager.h"
#include "Print.h"
#include "BkgAnimation.h"
UINT8 bank_SPRITE_PLAYER = 2;

const UINT8 player_idle[] = {4, 0, 1, 2, 1};
const UINT8 player_walk[] = {6, 3, 4, 5, 6, 7, 8};
const UINT8 player_jump[] = {1, 3};
const UINT8 player_climb[] = {4, 12, 9, 13, 9};
const UINT8 player_climb_idle[] = {4, 10, 9, 11, 9};

//Float speeds
const UINT8 s0[] = {-2,-2,-2,-2}; //-2
const UINT8 s1[] = {-1,-2,-1,-2}; //-1.5

const UINT8 s2[] = {-2,-2,-2,-2}; //-1
const UINT8 s3[] = {-1,-2,-1,-2}; //-0.5
const UINT8 s4[] = {-1,0,-1,0}; //-0.25   
const UINT8 s5[] = {0,0,0,0}; //0 
const UINT8 s6[] = {1,0,1,0}; //0.25    
const UINT8 s7[] = {1,2,1,2}; //0.5
const UINT8 s8[] = {2,2,2,2}; //1

const UINT8 s9[] = {1,2,1,2}; //1.5
const UINT8 s10[] = {2,2,2,2}; //2
const int * SpeedY[] ={s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,0x0000};

struct PlayerInfo { //Speeds and stuff
    INT8 vx; //speed
	INT8 vy;
	INT8 dir; //0-L 1-R
	INT8 sp; //Speed Po
	INT8 tile; //tile ground Pos
	INT8 tileg; //tile gem Pos
	INT8 state; 
	INT8 ground;
	INT8 fl; //float
	INT8 fr; //jump frame
	INT8 jumping; //jump
	INT8 climb; //
	INT8 colected_gems;
	INT8 colect_pos[];
};

void Start_SPRITE_PLAYER() {
	struct PlayerInfo* data = THIS->custom_data;
	UINT8 i;
	data->tile = 0;
	data->tileg = 0;
	data->jumping = 0;
	data->sp = 2;
	data->fr = 0;
	data->fl = 1; 
	data->colected_gems = 0;
	for(i = 0; i != 6; ++ i) data->colect_pos[i] = 0;
	SetSpriteAnim(THIS, player_idle, 5);
	
	THIS->coll_x = 4;
	THIS->coll_y = 0;
	THIS->coll_w = 10; 
	THIS->coll_h = 16; //box
	
	THIS->flags = 0x00;
	
	THIS->lim_x = 0;
	
	NR52_REG = 0x80; //Enables sound, you should always setup this first
    NR51_REG = 0xFF; //Enables all channels (left and right)
    NR50_REG = 0x77; //Max volume
}

void Update_SPRITE_PLAYER() {
    UINT8 i;
    struct Sprite* spr;
	struct PlayerInfo* data = THIS->custom_data;
	
	//float
	if (data->fl == 4) data->fl = 0;
	
	//FALL
	if ((data->jumping == 0)&&(data->climb == 0)) data->tile = TranslateSprite(THIS, 0, 1 << delta_time);	
	
	//Gem detector
	data->tileg = GetScrollTile((THIS->x + 8) >> 3, ((THIS->y + 9) >> 3));
	
	if (data->tile > 0)
	{	
		data->jumping = 0;
		data->ground = 1;
		data->sp = 2;
		data->fr = 0; 
	}
	else data->ground = 0;
	
	//MOVE
	if(KEY_PRESSED(J_RIGHT)) {
		THIS->flags = 0x00;
		//END
		if ((TranslateSprite(THIS, 1, 0) > 197)&&(TranslateSprite(THIS, 1, 0)) < 202){
			if (data->colected_gems == 6) SetState(STATE_MENU);
			if (data->colected_gems < 6) { 
				PRINT_POS(8, 0);
				Printf("FIND 6 GEMS");
			}
		}
		if (data->ground == 1) SetSpriteAnim(THIS, player_walk, 30);
	}
	if(KEY_PRESSED(J_LEFT)) {
		
		THIS->flags = 0x20;
		//END
		if ((TranslateSprite(THIS, -1, 0) > 197)&&(TranslateSprite(THIS, -1, 0)) < 202){
			if (data->colected_gems == 6) SetState(STATE_MENU);
			if (data->colected_gems < 6) { 
				PRINT_POS(8, 0);
				Printf("FIND 6 GEMS");
			}
		}
		if (data->jumping == 0) SetSpriteAnim(THIS, player_walk, 30);
	}
	//CLIMB
	if ((data->tileg == 61)||(data->tileg == 71)){
		if (KEY_PRESSED(J_UP)){
			data->ground = 1;
			data->climb = 1;
			data->jumping = 0;
		}
	}
	else data->climb = 0;
	if ((data->climb == 1)&&(KEY_PRESSED(J_UP))){
		TranslateSprite(THIS, 0, -1);
		SetSpriteAnim(THIS, player_climb, 15);
	}
	if ((data->climb == 1)&&(KEY_PRESSED(J_DOWN))){
		TranslateSprite(THIS, 0, 1);
		SetSpriteAnim(THIS, player_climb, 15);
	}
	
	//JUMP
	if ((data->ground == 1)&&(data->jumping == 0)&&(KEY_TICKED(J_A))){
		data->jumping = 1;
		data->climb = 0;
		PlayFx(CHANNEL_1, 32, 0x27, 0xC5, 0xF8, 0x73, 0xC6);
		SetSpriteAnim(THIS, player_jump, 20);
	}
	if (data->jumping == 1){
		//jumping speed
		if (data->fr == 11) {data->sp++; data->fr = 0;}
		if (data->sp == 9) {data->sp = 2; data->fr = 0; data->jumping = 0;}
		if (TranslateSprite(THIS, 0, SpeedY[data->sp][data->fl]) > 0) {data->sp = 2; data->fr = 0; data->jumping = 0;}
		data->fr++;
		if (data->sp != 5) data->tile = 0;
		if (data->climb == 1){data->sp = 2; data->fr = 0; data->jumping = 0;}
	}
	
	//WATER...DIE..LIMITS
	if ((data->tileg == 20) || (data->tileg == 208)) SetState(STATE_LEVEL1);
	
    if(keys == 0) {
        if (data->climb == 0) SetSpriteAnim(THIS, player_idle, 5);
		else SetSpriteAnim(THIS, player_climb_idle, 5);
    }

	//COLLISION ENEMIES
    SPRITEMANAGER_ITERATE(i, spr) {
        if(spr->type == SPRITE_ENEMY) {
            if(CheckCollision(THIS, spr)) {
                SetState(STATE_LEVEL1);
            }
        }
    }

	//COLECTABLE THINGS
	for(i = 0; i != 6; ++ i){
		if ((data->tileg == 202+i)&&(data->colect_pos[i] == 0)){
			BKG_COLLECT_ITEM(202+i, 1, 0);
			data->colected_gems++;
			data->colect_pos[i]++;
			PRINT_POS(1, 0);
			Printf("GEMS:%d", (int) data->colected_gems);
			PlayFx(CHANNEL_1, 32, 0x15, 0x83, 0xF8, 0x73, 0xC6);
		}
	}
	data->fl++; 
	
}

void Destroy_SPRITE_PLAYER() {
	
}