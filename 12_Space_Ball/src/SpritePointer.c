#pragma bank 2
#include "ZGBMain.h"

UINT8 bank_SPRITE_POINTER = 2;

#include "SpriteManager.h"

//const UINT8 anim_Pointer[] = {4, 0, 1, 2, 3};
extern UINT16 BallPos_x;
extern UINT16 BallPos_y;
extern INT8 HitDir;
extern UINT8 Ball_State;
const INT8 Point_Dir[] =
{
	5,15,   /* \ (X+)*/ //0
	11,11,  /* \ */ 
	15,5,   /* \ */	
	16,0,   /* ->*/ 
	15,-5,  /* / */
	11,-11, /* / */
	5,-15,  /* / */
	0,-16,  /* | UP*/
	-5,-15, /* \ (X-)*/ //16
	-11,-11,/* \ */ 
    -15,-5, /* \ */
	-16,0,  /* <-*/  
	-15,5,  /* / */
	-11,11, /* / */
	-5,15,  /* / */
	0,16    /* | DOWN*/
};
struct PointInfo { //Speeds and stuff
    INT8 x; //speed
	INT8 y;
	INT8 state;
};

void Start_SPRITE_POINTER() {
	THIS->x = BallPos_x + Point_Dir[HitDir];
	THIS->y = BallPos_y + Point_Dir[1+HitDir];
}

void Update_SPRITE_POINTER() {
	
	THIS->x = BallPos_x + Point_Dir[HitDir];
	THIS->y = BallPos_y + Point_Dir[1+HitDir];
	
	if (Ball_State == 1) {THIS->x = 1000; THIS->y = 1000;}
}

void Destroy_SPRITE_POINTER() {
}