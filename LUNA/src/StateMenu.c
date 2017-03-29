#pragma bank=2
#include "StateMenu.h"
UINT8 bank_STATE_MENU = 2;

#include "..\res\src\tiles_menu.h"
#include "..\res\src\map_menu.h"
#include "..\res\src\font.h"

#include "ZGBMain.h"
#include "Scroll.h"
#include "SpriteManager.h"
#include "Print.h"
#include "Keys.h"

#include "BkgAnimation.h"
#include "carillon_player.h"


extern UINT8 n_sprite_types;
extern UWORD tiles_menuPAL[];
extern UWORD playerPAL[];

//extern unsigned char array_in_ram[]; //in ram bank
UINT16 data = 0;

struct MAP_ANIMATION Asteroid;
struct MAP_ANIMATION Ball;
struct TILE_ANIMATION Star1;
struct TILE_ANIMATION Star2;


void Start_STATE_MENU() {
	
	UINT16 i;
	
	HIDE_WIN;
	
	SPRITES_8x16;
	for(i = 0; i != n_sprite_types; ++ i) {
		SpriteManagerLoad(i);
	}
	SHOW_SPRITES;

	//Load palettes from bank!!!
	ZGB_set_colors(tiles_menuPAL,3,playerPAL,3);

	InitScrollTiles(0, 174, tiles_menu, 3);
	InitScroll(map_menuWidth, map_menuHeight, map_menuPLN0, 0, 0, 3, map_menuPLN1);
	SHOW_BKG;

	INIT_FONT(font, 3, PRINT_BKG);

	
	PRINT_POS(5, 8);
	Printf("PRESS START");
	PRINT_POS(6, 9);
	Printf(" OPTIONS");
	CP_LoadMusic(8,0);
	
}

void Update_STATE_MENU() {
	
	if(KEY_PRESSED(J_START)) SetState(STATE_LEVEL1);
	
}

