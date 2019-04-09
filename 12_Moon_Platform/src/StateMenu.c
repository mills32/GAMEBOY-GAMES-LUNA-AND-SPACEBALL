#pragma bank 2
#include "main.h"

#include "..\res\src\tiles_menu.h"
#include "..\res\src\map_menu.h"
#include "..\res\src\tiles_map.h"
#include "..\res\src\tiles_map_w_anim.h"
#include "..\res\src\map_map.h"
#include "..\res\src\map_player.h"

#include "ZGBMain.h"
#include "Scroll.h"
#include "BkgAnimation.h"
#include "SpriteManager.h"
#include "palette.h"
#include "carillon_player.h"

#include "print.h"
#include "keys.h"
#include "..\res\src\font.h"

UINT8 bank_STATE_MENU = 2;
UINT8 Menu_Mode = 0;
extern UINT8 Level;
UINT8 Menu_Music = 0;
TILE_ANIMATION SeaWaves;

const char *Menu_Levels[14] = {
	"GREEN PLACE",
	"CAVE  WORLD",
	" DEEP CAVE ",//PARALLAX
	"LEVITA LAND",
	"  VILLAGE 	",
	"  SWAMPS   ",//PARALLAX
	" RAIN TOPS ",
	" ICE PLAIN ",
	" ICE  YORK ",//PARALLAX
	"SAND PLAINS",
	"SAND BUNKER",//PARALLAX
	"  SEQUOIA  ",
	"SEQUOIA TOP",
	"  EVOLVER  "//PARALLAX
};

const char *Menu_Musics[8] = {
	"  	MENU    ",
	"  MUSIC 1  ",
	"  MUSIC 2  ",
	"  MUSIC 3  ",
	"  MUSIC 4  ",
	"Z80'S THEME",
	"GIF VILLAGE",
	"  CREDITS  "
};

const UINT16 spm_palette[] = {PALETTE_FROM_HEADER(map_player)};
const UINT16 bgm_palette[] = {PALETTE_FROM_HEADER(tiles_menu)};
const UINT16 bgm2_palette[] = {PALETTE_FROM_HEADER(tiles_map)};
/*
struct MAP_ANIMATION Asteroid;
struct MAP_ANIMATION Ball;
struct TILE_ANIMATION Star1;
struct TILE_ANIMATION Star2;
*/


void Start_STATE_MENU() {
	SPRITES_8x16;
	SHOW_SPRITES;
	if (Menu_Mode == 0){//MENU SCREEN
		HIDE_WIN;
		SetPalette(bgm_palette,0,2);
		InitScrollTiles(0, 204, tiles_menu, 3);
		InitScroll(map_menuWidth, map_menuHeight, map_menuPLN0, 0, 0, 3, map_menuPLN1);
		CP_LoadMusic(8,0);
		SHOW_BKG;
		HIDE_WIN;
		INIT_FONT(font, 1, PRINT_BKG);
		PRINT_POS(5, 8);
		Printf("PRESS  START");
		PRINT_POS(6, 9);
		Printf((unsigned char*)Menu_Musics[Menu_Music]);
		Menu_Mode = 1;
	}
	if (Menu_Mode == 2){//WORLD MAP
		CP_LoadMusic(8,0);
		InitScrollTiles(0, 56, tiles_map, 1);
		InitScroll(map_mapWidth, map_mapHeight, map_mapPLN0, 0, 0, 1, map_mapPLN1);
		SHOW_BKG;
		SHOW_WIN;
		INIT_FONT(font, 1, PRINT_WIN);
		PRINT_POS(0, 0);
		Printf("  	        ");
		WY_REG = 17*8;
		PRINT_POS(4, 0);
		Printf((unsigned char*)Menu_Levels[Level]);
		SetPalette(bgm2_palette,spm_palette,2);
		SpriteManagerLoad(1);
		scroll_target = SpriteManagerAdd(SPRITE_MAP_PLAYER, 12, 12);//Player on map
		LOAD_TILE_ANIM(&SeaWaves, 1, 8, tiles_map_w_anim, 1);
		Menu_Mode = 3;
	}
}

void Update_STATE_MENU() {
	
	if (Menu_Mode == 1){//MENU
		if(KEY_RELEASED(J_UP) && (Menu_Music != 7)){
			Menu_Music++;
			PRINT_POS(5, 9);
			Printf((unsigned char*)Menu_Musics[Menu_Music]);
			CP_LoadMusic(8,Menu_Music);
		}
		if(KEY_RELEASED(J_DOWN) && (Menu_Music != 0)){
			Menu_Music--;
			PRINT_POS(5, 9);
			Printf((unsigned char*)Menu_Musics[Menu_Music]);
			CP_LoadMusic(8,Menu_Music);
		}
		if(KEY_RELEASED(J_START)) {
			Menu_Mode = 2;
			SetState(STATE_MENU);
		}
	}

	if (Menu_Mode == 3){//MAP
		if(KEY_RELEASED(J_RIGHT) && (Level != 13)){
			Level++;
			PRINT_POS(4, 0);
			Printf((unsigned char*)Menu_Levels[Level]);
		}
		if(KEY_RELEASED(J_LEFT) && (Level != 0)){
			Level--;
			PRINT_POS(4, 0);
			Printf((unsigned char*)Menu_Levels[Level]);
		}
		if(KEY_RELEASED(J_B)) {
			Menu_Mode = 0;
			Menu_Music = 0;
			SetState(STATE_MENU);
		}
		if(KEY_PRESSED(J_START)){
			Menu_Mode = 0;
			Menu_Music = 0;
			SetState(STATE_GAME);
		}
		TILE_ANIMATE(&SeaWaves, 17, 16);
	}
}

