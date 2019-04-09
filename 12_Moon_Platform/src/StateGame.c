#pragma bank 2
#include "main.h"
UINT8 bank_STATE_GAME = 2;

#include "..\res\src\map_level1.h"
#include "..\res\src\map_level2.h"
#include "..\res\src\map_level4.h"
#include "..\res\src\map_level11.h"
#include "..\res\src\tiles_level1.h"
#include "..\res\src\tiles_level1_w_anim.h"
#include "..\res\src\tiles_level2.h"
#include "..\res\src\tiles_level11.h"

#include "..\res\src\player.h"


#include "ZGBMain.h"
#include "Scroll.h"
#include "BkgAnimation.h"
#include "SpriteManager.h"
#include "palette.h"
#include "carillon_player.h"
#include "Print.h"
#include "../res/src/font.h"

extern UINT8 Level;
UINT16 x = 0;
UINT8 del = 0;
TILE_ANIMATION Waterfall;
const UINT16 sp_palette[] = {PALETTE_FROM_HEADER(player)};
const UINT16 bg_palette[] = {PALETTE_FROM_HEADER(tiles_level1)};
const UINT16 bg2_palette[] = {PALETTE_FROM_HEADER(tiles_level2)};
const UINT16 bg11_palette[] = {PALETTE_FROM_HEADER(tiles_level11)};

UINT8 collision_tiles_down[] = {2,0};
UINT8 collision_tiles1[] = {16,17,18,19,127,0};
UINT8 collision_tiles2[] = {26,27,28,29,30,31,32,33,127,0};

void Start_STATE_GAME() {
	UINT8 i;

	SPRITES_8x16;
	SHOW_SPRITES;

	if (Level == 0){//GREEN PLACE
		SpriteManagerLoad(0);SpriteManagerLoad(4);SpriteManagerLoad(5);
		SetPalette(bg_palette, sp_palette, 2);
		scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 8*8, 8*15);

		InitScrollTiles(0, 240, tiles_level1, 3);
		InitScroll(map_level1Width, map_level1Height, map_level1PLN0, collision_tiles1, collision_tiles_down, 4, map_level1PLN1);
	}
	if (Level == 1){//CAVE WORLD
		SpriteManagerLoad(0);SpriteManagerLoad(4);SpriteManagerLoad(5);
		SetPalette(bg2_palette, sp_palette, 2);
		scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 2*8, 2*8);

		InitScrollTiles(0, 240, tiles_level2, 6);
		InitScroll(map_level2Width, map_level2Height, map_level2PLN0, collision_tiles2, collision_tiles_down, 5, map_level2PLN1);
	}
	if (Level == 2){//DEEP CAVE
	}
	if (Level == 3){//LEVITA LAND
		SpriteManagerLoad(0);SpriteManagerLoad(4);SpriteManagerLoad(5);
		SetPalette(bg_palette, sp_palette, 2);
		scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 1*8, 134*8);

		InitScrollTiles(0, 240, tiles_level1, 3);
		InitScroll(map_level4Width, map_level4Height, map_level4PLN0, collision_tiles1, collision_tiles_down, 7, map_level4PLN1);
	}
	if (Level == 4){//VILLAGE
		//Set variable for village 1 and village 2
		SetState(STATE_VILLAGE);
	}
	if (Level == 5){//SWAMPS
	}
	if (Level == 6){//RAIN TOPS
	}
	if (Level == 7){//ICE PLAINS
	}
	if (Level == 8){//ICE YORK
	}
	if (Level == 9){//SAND PLAIN
	}
	if (Level == 10){//DESERT BUNKER
	}
	if (Level == 11){//SEQUOIA
		SpriteManagerLoad(0);SpriteManagerLoad(4);SpriteManagerLoad(5);
		SetPalette(bg11_palette, sp_palette, 2);
		scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 2*8, 30*8);

		InitScrollTiles(0, 240, tiles_level11, 30);
		InitScroll(map_level11Width, map_level11Height, map_level11PLN0, collision_tiles1, collision_tiles_down, 29, map_level11PLN1);
	}
	if (Level == 12){//SEQUOIA TOP
	}
	if (Level == 5){//EVOLVER
		//SetState(STATE_EVOLVER);
	}
	LOAD_TILE_ANIM(&Waterfall, 1, 8, tiles_level1_w_anim, 3);
	
	//INIT WINDOW
	InitWindow(0, 0, 20, 1, map_level1PLN0, 4,map_level1PLN1);
	WY_REG = 17*8;
	SHOW_BKG;

	SHOW_WIN;
	INIT_FONT(font, 1, PRINT_WIN);
	PRINT_POS(1, 0);
	Printf("GEMS:%d", (int) 0);
	CP_LoadMusic(8,1);
}

void Update_STATE_GAME() {
	TILE_ANIMATE(&Waterfall, 45, 2);
}