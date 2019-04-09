#pragma bank 1

#include "..\res\src\rocket.h"
#include "Scroll.h"
#include "SpriteManager.h"

UINT8 bank_SPRITE_ROCKET = 1;

void Start_SPRITE_ROCKET() {
	THIS->flags = 0x02;
}

void Update_SPRITE_ROCKET() {
	THIS->x--;
}

void Destroy_SPRITE_ROCKET() {
	
}