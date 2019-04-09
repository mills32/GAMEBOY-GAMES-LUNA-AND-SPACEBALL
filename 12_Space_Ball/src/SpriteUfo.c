#pragma bank 2

#include "ZGBMain.h"

UINT8 bank_SPRITE_UFO = 2;

#include "SpriteManager.h"

const UINT8 anim_ufo[] = {4, 0, 1, 2, 3};

void Start_SPRITE_UFO() {
	//THIS->lim_x = -100;
	//THIS->lim_y = 100;
	SetSpriteAnim(THIS, anim_ufo, 14);
	THIS->flags = 0x84;
	//THIS->x = 20;
	//THIS->y = 20;
}

void Update_SPRITE_UFO() {
	if (THIS->x == 180) THIS->x = -30;
	THIS->x ++;
	//THIS->y ++;
}

void Destroy_SPRITE_UFO() {
}