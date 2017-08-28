#pragma bank=4
#include "StateLevel1.h"
UINT8 bank_STATE_LEVEL1 = 4;

#include "..\res\src\tiles_level1.h"
#include "..\res\src\map_level1.h"
#include "..\res\src\win_level1.h"
#include "..\res\src\level_anim_hconv.h"
#include "..\res\src\level_anim_vconv.h"

#include "ZGBMain.h"
#include "../res/src/font.h"
#include "Print.h"
#include "Scroll.h"
#include "Keys.h"
#include "SpriteManager.h"

#include "BkgAnimation.h"


extern Menu_Mode;
extern UWORD tiles_level1PAL[];
extern UWORD playerPAL[];
extern UINT8 n_sprite_types;

extern struct TILE_ANIMATION Tile_items[2];

void Start_STATE_LEVEL1() {
	UINT8 i;
	const UINT8 collision_tiles[] = {1,2,3,4,5,6,7,8,9,10,11,12,0};
	
	SPRITES_8x16;
	for(i = 0; i != n_sprite_types; ++ i) {
		SpriteManagerLoad(i);
	}
	SHOW_SPRITES;

	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 58*8, 58*8);
	
	InitScrollTiles(0, 255, tiles_level1, 4);
	InitScroll(map_level1Width, map_level1Height, map_level1PLN0, collision_tiles, 0, 5,map_level1PLN1);
	
	ZGB_set_colors(tiles_level1PAL,4,playerPAL,3);
	
	InitWindow(0, 0, win_level1Width, win_level1Height, win_level1PLN0, 4, win_level1PLN1);
	WY_REG = 16*8;
	SHOW_BKG;
	SHOW_WIN;
	
	INIT_FONT(font, 3, PRINT_WIN);
	
	LOAD_TILE_ANIM(&Tile_items[0], 1, 8, level_anim_hconv, 3);
	LOAD_TILE_ANIM(&Tile_items[1], 1, 8, level_anim_vconv, 3);	

}

void Update_STATE_LEVEL1() {

	if (KEY_PRESSED(J_SELECT)) {
		Menu_Mode = 2;
		SetState(STATE_MENU);
	}
	
	TILE_ANIMATE(&Tile_items[0], 40, 3);
	TILE_ANIMATE(&Tile_items[1], 42, 3);	
}