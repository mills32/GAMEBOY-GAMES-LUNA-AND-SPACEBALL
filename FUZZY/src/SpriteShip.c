#pragma bank=2
#include "SpriteShip.h"
UINT8 bank_SPRITE_SHIP = 2;

#include "ZGBMain.h"
#include "SpriteManager.h"

const UINT8 anim_ship[] = {4, 0, 1, 2, 3};

void Start_SPRITE_SHIP() {
	//THIS->lim_x = -100;
	//THIS->lim_y = 100;
	SetSpriteAnim(THIS, anim_ship, 10);
	THIS->flags = 0x85;
	//THIS->x = 20;
	//THIS->y = 20;
}

void Update_SPRITE_SHIP() {
	if (THIS->x == -30) THIS->x = 180;
	THIS->x --;
	//THIS->y ++;
}

void Destroy_SPRITE_SHIP() {
}