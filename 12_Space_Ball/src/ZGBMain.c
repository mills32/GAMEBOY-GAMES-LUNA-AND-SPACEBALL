#include "ZGBMain.h"

//Load this scene
UINT8 next_state = STATE_MENU;

UINT8 SCENE = 1; 

#include "Math.h"
UINT8 GetTileReplacement(UINT8* tile_ptr, UINT8* tile) {
	if(current_state == STATE_LEVEL1) {
		if(U_LESS_THAN(255 - (UINT16)*tile_ptr, N_SPRITE_TYPES)) {
			*tile = 0;
			return 255 - (UINT16)*tile_ptr;
		}
		*tile = *tile_ptr;
	}
	return 255u;
}

