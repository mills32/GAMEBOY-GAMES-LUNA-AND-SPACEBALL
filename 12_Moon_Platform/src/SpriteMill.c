#pragma bank 1

#include "..\res\src\Village_Mill.h"
#include "Scroll.h"
#include "SpriteManager.h"

UINT8 bank_SPRITE_MILL = 1;
const UINT8 mill_rotate[] = {8, 0, 1, 2, 3, 4, 5, 6, 7};
void Start_SPRITE_MILL() {
	THIS->flags = 0x06;
	SetSpriteAnim(THIS, mill_rotate, 40);
}

void Update_SPRITE_MILL() {

}

void Destroy_SPRITE_MILL() {
	
}