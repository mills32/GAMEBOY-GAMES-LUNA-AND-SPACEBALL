#pragma bank 1

#include "..\res\src\dol.h"
#include "Scroll.h"
#include "SpriteManager.h"

UINT8 bank_SPRITE_DOL = 1;
const UINT8 dol_float[] = {2, 0, 1};

struct DolInfo {
	INT8 mode;
    INT8 vx;
	INT8 dir;
};
void Start_SPRITE_DOL() {
	THIS->flags = 0x06;

}

void Update_SPRITE_DOL() {
	struct DolInfo* data = (struct DolInfo*) THIS->custom_data;
	if(data->mode == 0){
		if (THIS->x>80) THIS->x--;
	}
	if(data->mode == 2){
		if (THIS->x>80) THIS->x++;
	}
}

void Destroy_SPRITE_DOL() {
	
}