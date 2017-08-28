#pragma bank=2
#include "SpritePlayer.h"
UINT8 bank_SPRITE_PLAYER = 2;

#include "ZGBMain.h"
#include "Sound.h"
#include "Scroll.h"
#include "Print.h"
#include "Keys.h"
#include "SpriteManager.h"
#include "BkgAnimation.h"
extern UINT8 Menu_Mode;

const UINT8 anim_roll[] = {3, 0, 1, 2};
const UINT8 anim_idle[] = {1, 0};

UINT8 TIMER;
UINT16 BallPos_x;
UINT16 BallPos_y;
UINT16 HitDir;
UINT16 Ball_State;
struct BallInfo { //Speeds and stuff
    INT8 vx; //speed
	INT8 vy;
	INT8 fl; //float simulator for speeds
	INT8 rz; //friction speed
	INT8 sl; //slope speed 
	INT8 dir; //direction from 0 to 16
	INT8 sx; //Speed Po
	INT8 sy;
	INT8 force; //Hit Force
	INT8 bx; //Invert
	INT8 by;
	INT8 tile; //tile Pos
	INT8 state; 
	INT8 col;
	INT8 strokes;
};

//Float speeds
const UINT8 s0[] = {-2,-2,-2,-2}; //-2
const UINT8 s1[] = {-2,-2,-2,-1}; //-1.75
const UINT8 s2[] = {-1,-2,-1,-2}; //-1.5
const UINT8 s3[] = {-1,-1,-1,-2}; //-1.25
const UINT8 s4[] = {-1,-1,-1,-1}; //-1
const UINT8 s5[] = {-1,-1,-1,0}; //-0.75
const UINT8 s6[] = {-1,0,-1,0}; //-0.5
const UINT8 s7[] = {0,0,0,-1}; //-0.25
const UINT8 s8[] = {0,0,0,0}; //0     
const UINT8 s9[] = {0,0,0,1}; //0.25
const UINT8 s10[] = {1,0,1,0}; //0.5
const UINT8 s11[] = {1,1,1,0}; //0.75
const UINT8 s12[] = {1,1,1,1}; //1
const UINT8 s13[] = {1,1,1,2}; //1.25
const UINT8 s14[] = {1,2,1,2}; //1.5
const UINT8 s15[] = {2,2,2,1}; //1.75
const UINT8 s16[] = {2,2,2,2}; //2
const unsigned UINT8 * Speed[] = {s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,0x0000};
const unsigned UINT8 Dir[] = 
	{
		//Speed 1
		9, 12,/* \ (X+)*/ //0
		11,11,/* \ */ 
		12,9, /* \ */	
		12,8, /* ->*/  ////// 3
		12,7, /* / */
		11,5, /* / */
		9, 4, /* / */
		8, 4, /* | UP*/
		7, 4, /* \ (X-)*/ //16
		5, 5, /* \ */ 
		4, 7, /* \ */
		4, 8, /* <-*/  ///// 11
		4, 9, /* / */
		5, 11,/* / */
		7, 12,/* / */
		8, 12,/* | DOWN*/
		//Speed 2
		11,14,/* \ (X+)*/ 
		13,13,/* \ */ 
		14,11,/* \ */	
		14,8, /* ->*/  
		14,6, /* / */
		13,3, /* / */
		11,2, /* / */
		8, 2, /* | UP*/
		5, 2, /* \ (X-)*/ 
		3, 3, /* \ */ 
		2, 5, /* \ */
		2, 8, /* <-*/  
		2, 11, /* / */
		3, 13,/* / */
		5, 14,/* / */
		8, 14,/* | DOWN*/
		//Speed 3
		13,16,/* \ (X+)*/ 
		15,15,/* \ */ 
		16,13,/* \ */
		16,8, /* ->*/ 
		16,4, /* / */
		15,1, /* / */
		13,0, /* / */
		8, 0, /* | UP*/
		3, 0, /* \ (X-)*/ 
		1, 1, /* \ */ 
		0, 3, /* \ */
		0, 8, /* <-*/ 
		0, 13, /* / */
		1, 15,/* / */
		2, 16,/* / */
		8, 16,/* | DOWN*/
	};

void Set_Power_Bar(int p){
	if(p == 0){
		//POWER BAR = 0
		WIN_EDIT_TILE(3, 0, 47);WIN_EDIT_TILE(4, 0, 51);
		WIN_EDIT_TILE(3, 1, 48);WIN_EDIT_TILE(4, 1, 52);
	}
	if(p == 1){
		//POWER BAR = 1
		WIN_EDIT_TILE(3, 0, 49);WIN_EDIT_TILE(4, 0, 51);
		WIN_EDIT_TILE(3, 1, 50);WIN_EDIT_TILE(4, 1, 52);
	}
	if(p == 2){
		//POWER BAR = 2
		WIN_EDIT_TILE(3, 0, 49);WIN_EDIT_TILE(4, 0, 53);
		WIN_EDIT_TILE(3, 1, 50);WIN_EDIT_TILE(4, 1, 54);
	}
}
	
void Start_SPRITE_PLAYER() {
	struct BallInfo* data = THIS->custom_data;
	THIS->coll_x = 2;
	THIS->coll_y = 2;
	THIS->coll_w = 12; 
	THIS->coll_h = 12; //box
	
    data->vx = 0;
	data->vy = 0;
    data->bx = 0;
	data->by = 0;
    data->state = 2; //INIT
	data->dir = 14;
	data->force = 32;
	HitDir = 14;
	
	SpriteManagerAdd(SPRITE_POINTER, 0, 0);
	
	THIS->flags = 0x00;
	TIMER = 0;


}	

void Update_SPRITE_PLAYER(){
	struct BallInfo* data = THIS->custom_data;
	BallPos_x = THIS->x;
	BallPos_y = THIS->y;

	//ROLLING BALL
	if (data->state == 1){
		//Tile detector
		data->tile = GetScrollTile((THIS->x + 8) >> 3, (THIS->y + 8) >> 3);
		
		//Float simulator
		if (data->fl == 4)data->fl = 0;
		
		//Friction Speed
		if (data->rz == 20)data->rz = 0;
		//Slope Speed
		if (data->sl == 7)data->sl = 0;
		
		//check if speeds are + or - or 0
		if (data->sx < 8) data->bx = 0;
		if (data->sx > 8) data->bx = 1;
		if (data->sy < 8) data->by = 0;
		if (data->sy > 8) data->by = 1;
		if (data->sx == 8) data->bx = 2;
		if (data->sy == 8) data->by = 2;
		// if speeds are 0, reset ball, reload pointer
		if ((data->bx == 2)&&(data->by == 2)&&(data->tile<18)) {
			data->vx = 0;
			data->vy = 0;
			data->dir = 14;
			data->state = 0;
			HitDir = 14;
			Ball_State = 0;
			data->strokes--;
			SpriteManagerAdd(SPRITE_POINTER, 0, 0); 
			//POWER BAR = 0
			Set_Power_Bar(data->force/32);
			PRINT_POS(16, 1);
			Printf("%d ", (int) data->strokes);
		}
		//Bounce X
		data->col = TranslateSprite(THIS,data->vx, 0);
		if((data->col == 1)||(data->col == 2)||(data->col == 3)||(data->col == 4)||(data->col == 5)||(data->col == 6)){
			if (data->bx == 0) data->sx = data->sx - 2*(data->sx -8);
			if (data->bx == 1) data->sx = data->sx + 2*(8-data->sx);
			//Bounce sound
			PlayFx(CHANNEL_1, 14, 0x27, 0x01, 0xfe, 0x73, 0xc6);	
		}
		//Bounce Y
		data->col = TranslateSprite(THIS,0, data->vy);
		if((data->col == 1)||(data->col == 2)||(data->col == 3)||(data->col == 4)||(data->col == 7)||(data->col == 8)){
			if (data->by == 0) data->sy = data->sy - 2*(data->sy -8);
			if (data->by == 1) data->sy = data->sy + 2*(8-data->sy);
			//Bounce sound
			PlayFx(CHANNEL_1, 14, 0x27, 0x01, 0xfe, 0x73, 0xc6);		
		}
		//Slope Up
		if ((data->tile > 22)&&(data->tile < 25)&&(data->sl == 6)&&(data->sy > 0)) data->sy--;
		//Slope Down
		if ((data->tile > 19)&&(data->tile < 22)&&(data->sl == 6)&&(data->sy < 14)) data->sy++;
		//Conv Down
		if ((data->tile > 41)&&(data->tile < 44)&&(data->sl == 6)&&(data->sy < 14)) data->sy+=2;
		//Slope Right
		if ((data->tile > 25)&&(data->tile < 28)&&(data->sl == 6)&&(data->sx < 14)) data->sx++;
		//Conv Right
		if ((data->tile > 39)&&(data->tile < 42)&&(data->sl == 6)&&(data->sx < 14)) data->sx+=2;
		//Slope Left
		if ((data->tile > 28)&&(data->tile < 31)&&(data->sl == 6)&&(data->sx > 0)) data->sx--;
		
		//Friction
		if ((data->tile > 12)&&(data->tile < 18)&&(data->rz == 19)){
			if (data->bx == 0) data->sx++;
			if (data->bx == 1) data->sx--;
			if (data->by == 0) data->sy++;
			if (data->by == 1) data->sy--;
		}
		
		data->vx = Speed[data->sx][data->fl];
		data->vy = Speed[data->sy][data->fl];
		
		if (data->vx !=0){
			if (data->vx > 2) data->vx = 2;
			if (data->vx < -2) data->vx = -2;
		}
		if (data->vy !=0){
			if (data->vy > 2) data->vy = 2;
			if (data->vy < -2) data->vy = -2;			
		}		
		//HOLE
		if ((data->tile > 31)&&(data->tile < 36)){ 
			data->state = 3;
			//In_Hole sound: 
			PlayFx(CHANNEL_1, 14, 0x15, 0x82, 0xf0, 0x14, 0x85);
		}
		data->fl++; data->rz++; data->sl++;
	}
	//STOPPED BALL
	if (data->state == 0){
		if(data->dir > 30) data->dir = 0;
		if(data->dir < 0) data->dir = 30;
		
		//CHANGE DIR
		if(KEY_TICKED(J_RIGHT)){data->dir-=2;HitDir -=2;}
		if(KEY_TICKED(J_LEFT)){data->dir+=2;HitDir +=2;}
		//CHANGE FORCE
		if((KEY_TICKED(J_UP))&&(data->force < 64)){
			data->force+=32;
			Set_Power_Bar(data->force/32);
		}
		if((KEY_TICKED(J_DOWN))&&(data->force > 0)){
			data->force-=32;
			Set_Power_Bar(data->force/32);
		}
		
		//HIT BALL
		if(KEY_TICKED(J_A)){
			data->sx = Dir[data->force+data->dir];
			data->sy = Dir[data->force+1+data->dir];
			data->state = 1;
			Ball_State = 1;
		}
	}
	if(KEY_PRESSED(J_B)){
		//Menu_Mode = 0;
		//SetState(STATE_MENU);
	}
	//GO TO MENU
	if (data->strokes == 0){
		Menu_Mode = 2;
		SetState(STATE_MENU);
		HIDE_WIN;
	}
	
	if (data->state == 2){ //INIT
		data->strokes = 9; // 
		Set_Power_Bar(data->force/32);
		PRINT_POS(12, 1);
		Printf("STR:%d ", (int) data->strokes);
		data->state = 0;
		SpriteManagerAdd(SPRITE_POINTER, 0, 0); 
	}
	
	if (data->state == 3){ //HOLE IN
		if (TIMER == 80){
			TIMER == 0;
			Menu_Mode = 2;
			HIDE_WIN;
			SetState(STATE_MENU);	
		}
		TIMER++;
	}
}

void Destroy_SPRITE_PLAYER() {
	
}