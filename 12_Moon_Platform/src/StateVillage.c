#pragma bank 2
#include "main.h"
UINT8 bank_STATE_VILLAGE = 2;

#include "..\res\src\map_village.h"
#include "..\res\src\tiles_village.h"
#include "..\res\src\player.h"
#include "..\res\src\tiles_level1_w_anim.h"
#include "..\res\src\Village_Mill.h"

#include "ZGBMain.h"
#include "Scroll.h"
#include "BkgAnimation.h"
#include "SpriteManager.h"
#include "palette.h"
#include "carillon_player.h"
#include "Print.h"
#include "../res/src/font.h"
#include "keys.h"

extern UINT8 Level;
UINT16 x = 0;
UINT8 del = 0;
TILE_ANIMATION Waterfall;
const UINT16 sp30_palette[] = {PALETTE_FROM_HEADER(player)};
const UINT16 bg30_palette[] = {PALETTE_FROM_HEADER(tiles_village)};

void Start_STATE_VILLAGE() {

	SPRITES_8x16;
	SHOW_SPRITES;
	
	SpriteManagerLoad(4);
	SetPalette(bg30_palette, sp30_palette, 2);
	//scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 2*8, 2*8);

	InitScrollTiles(0, 156, tiles_village, 30);
	InitScroll(map_villageWidth, map_villageHeight, map_villagePLN0, 0, 0, 30, map_villagePLN1);
	
	LOAD_TILE_ANIM(&Waterfall, 1, 8, tiles_level1_w_anim, 3);
	
	CP_LoadMusic(8,1);
}

void Update_STATE_VILLAGE() {
	if(KEY_PRESSED(J_SELECT)) {SetState(STATE_MENU); Level = 0;}
	MoveScroll(x,0);
	del++;
	if (del == 2) {del = 0; x++;}

	TILE_ANIMATE(&Waterfall, 45, 2);
}