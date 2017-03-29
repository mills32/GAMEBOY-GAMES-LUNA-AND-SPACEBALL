#pragma bank=3
#include "StateLevel1.h"
UINT8 bank_STATE_LEVEL1 = 3;

#include "..\res\src\tiles_level1.h"
#include "..\res\src\map_level1.h"
#include "..\res\src\tiles_level1_waterfall.h"
#include "../res/src/font.h"

#include "ZGBMain.h"
#include "Scroll.h"
#include "SpriteManager.h"
#include "BkgAnimation.h"
#include "Print.h"

#include "carillon_player.h"


extern UINT8 n_sprite_types;
extern UWORD tiles_level1PAL[];
extern UWORD playerPAL[];

struct TILE_ANIMATION Waterfall;
struct TILE_ANIMATION Waterfall1;

UINT8 collision_tiles[] = {16,17,18,19,198,199,200,201,0};
UINT8 collision_tiles_down[] = {2,54,0};

void Start_STATE_LEVEL1() {
	UINT8 i;

	SPRITES_8x16;
	for(i = 0; i != n_sprite_types; ++ i) {
		SpriteManagerLoad(i);
	}
	SHOW_SPRITES;
	
	//Load palettes from bank 2!!!
	ZGB_set_colors(tiles_level1PAL,3,playerPAL,3);
	
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 8*8, 16*8);
	//SpriteManagerAdd(SPRITE_ENEMY, 5*8, 12*8);

	InitScrollTiles(0, 210, tiles_level1, 3);
	InitScroll(map_level1Width, map_level1Height, map_level1PLN0, collision_tiles, collision_tiles_down, 4, map_level1PLN1);

	//LOAD TILE ANIMATION - Waterfall , tiles 1, data *, frames 3
	LOAD_TILE_ANIM(&Waterfall, 1, 4, tiles_level1_w_anim, 3);
	LOAD_TILE_ANIM(&Waterfall1, 1, 4, tiles_level1_w_anim, 3);
	
	//INIT WINDOW
	InitWindow(0, 0, 20, 1, map_level1PLN0, 4,map_level1PLN1);
	WY_REG = 17*8;
	SHOW_BKG;
	SHOW_WIN;
	
	
	INIT_FONT(font, 3, PRINT_WIN);
	
	PRINT_POS(1, 0);
	Printf("GEMS:%d", (int) 0);
	
	CP_LoadMusic(7,0);
}

void Update_STATE_LEVEL1() {

	//TILE ANIMATION - Waterfall , tile 45, speed 4
	TILE_ANIMATE(&Waterfall, 45, 4);
}

