#pragma bank 2
#include "ZGBMain.h"
UINT8 bank_SPRITE_ARROW = 2;

#include "main.h"
#include "SpriteManager.h"
#include "Keys.h"

extern UINT8 Menu_Mode;
	const UINT8 arrow_idle[] = {1, 0};
	const UINT8 arrow_OK[] = {1, 1};
	const UINT8 arrow_WRONG[] = {1, 2};
struct ArrowInfo { //stuff
    INT8 zx; //
	INT8 zy;
	INT8 state; 
};

void Start_SPRITE_ARROW() {
	struct ArrowInfo* data = (struct ArrowInfo*)THIS->custom_data;
	data->state = 0;
	THIS->flags = 0x00;
}

void Update_SPRITE_ARROW() {
	struct ArrowInfo* data = (struct ArrowInfo*)THIS->custom_data;
	
	if ((THIS->x < 150) && (KEY_PRESSED(J_RIGHT))) THIS->x ++;
	if ((THIS->x > 10) && (KEY_PRESSED(J_LEFT)))   THIS->x --;
	if ((THIS->y > 10) && (KEY_PRESSED(J_UP)))     THIS->y --;
	if ((THIS->y < 140) && (KEY_PRESSED(J_DOWN)))  THIS->y ++;
	
	//IDLE
	SetSpriteAnim(THIS, arrow_idle, 15);
	THIS->flags = 0x00;
	//GO
	if ((THIS->x > 3*8) && (THIS->x < 8*8) && (THIS->y > 3*8) && (THIS->y < 8*8))
	{
		THIS->flags = 0x02;
		SetSpriteAnim(THIS, arrow_OK, 15);
		if (KEY_PRESSED(J_A)) SetState(STATE_LEVEL1);
	}
	//INFO
	if ((THIS->x > 13*8) && (THIS->x < 17*8) && (THIS->y > 9*8) && (THIS->y < 13*8))
	{
		THIS->flags = 0x02;
		SetSpriteAnim(THIS, arrow_OK, 15);
		if (KEY_PRESSED(J_A)) {
			Menu_Mode = 4;
			delay(20);
			THIS->x = 200;
			THIS->y = 200;
		}
	}
	//SETTINGS	   
	if ((THIS->x > 2*8) && (THIS->x < 7*8) && (THIS->y > 11*8) && (THIS->y < 16*8))
	{
		THIS->flags = 0x02;
		SetSpriteAnim(THIS, arrow_OK, 15);
		if (KEY_PRESSED(J_A)) {
			Menu_Mode = 7;
			delay(20);
			THIS->x = 200;
			THIS->y = 200;
		}
	}	
}

void Destroy_SPRITE_ARROW() {
}