#pragma bank 4

#include "main.h"
#include "ZGBMain.h"

UINT8 bank_STATE_LEVEL1 = 4;

#include "..\res\src\tiles_level1.h"
#include "..\res\src\map_level1.h"
#include "..\res\src\win_level1.h"
#include "..\res\src\map_level0.h"
#include "..\res\src\level1_parallaxtiles.h"

#include "..\res\src\level_anim_hconv.h"
#include "..\res\src\level_anim_vconv.h"

#include "../res/src/player.h"
#include "../res/src/spritepointer.h"

#include "../res/src/font.h"


#include "Print.h"
#include "Scroll.h"
#include "Keys.h"
#include "SpriteManager.h"
#include "palette.h"

#include "BkgAnimation.h"

#include "carillon_player.h"

UINT8 Level = 0;

extern UINT8 Menu_Mode;
const UINT16 tiles_level1PAL[] = {PALETTE_FROM_HEADER(tiles_level1)};
const UINT16 playerPAL[] = {PALETTE_FROM_HEADER(player)};

extern TILE_ANIMATION Tile_items[2];

void Start_STATE_LEVEL1() {
	UINT8 i;
	const UINT8 collision_tiles[] = {1,2,3,4,5,6,7,8,9,10,11,12,36,37,38,39,0};
	
	CP_LoadMusic(6,2);
	ZGB_Parallax = 1;
	SPRITES_8x16;
	for(i = 0; i != N_SPRITE_TYPES; ++ i) {
		SpriteManagerLoad(i);
	}
	SHOW_SPRITES;
	
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 35*8,42*8);//58*8, 58*8);
	
	InitScrollTiles(0, 255, tiles_level1, 4);
	InitScroll(map_level0Width, map_level0Height, map_level0PLN0, collision_tiles, 0, 5,map_level0PLN1);
	
	SetPalette(tiles_level1PAL,playerPAL,4);
	
	InitWindow(0, 0, win_level1Width, win_level1Height, win_level1PLN0, 4, win_level1PLN1);
	WY_REG = 16*8;
	SHOW_BKG;
	SHOW_WIN;
	
	INIT_FONT(font, 3, PRINT_WIN);
	
	LOAD_TILE_ANIM(&Tile_items[0], 1, 8, level_anim_hconv, 3);
	LOAD_TILE_ANIM(&Tile_items[1], 1, 8, level_anim_vconv, 3);	
	SpriteManagerAdd(SPRITE_POINTER, 0, 0);
	Set_Parallax(level1_parallaxtiles,7);
}

void Update_STATE_LEVEL1() {
	Move_Parallax();
	TILE_ANIMATE(&Tile_items[0], 40, 3);
	TILE_ANIMATE(&Tile_items[1], 42, 3);	
	
	if (KEY_PRESSED(J_SELECT)) {
		Menu_Mode = 2;
		SetState(STATE_MENU);
	}
	
}