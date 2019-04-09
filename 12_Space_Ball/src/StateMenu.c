#pragma bank 2

#include "main.h"
#include "ZGBMain.h"

UINT8 bank_STATE_MENU = 2;

#include "..\res\src\tiles_menu.h"
#include "..\res\src\map_plogo.h"
#include "..\res\src\map_flogo.h"
#include "..\res\src\map_menu.h"
#include "..\res\src\map_menu_anim_ball.h"
#include "..\res\src\map_menu_anim_asteroid.h"
#include "..\res\src\map_menu_anim_settings.h"
#include "..\res\src\tile_menu_anim_star.h"
#include "..\res\src\tile_menu_anim_star2.h"
#include "..\res\src\font.h"

#include "../res/src/player.h"
#include "../res/src/spriteship.h"
#include "../res/src/spriteufo.h"
#include "../res/src/spritearrow.h"

#include "Scroll.h"
#include "SpriteManager.h"
#include "palette.h"
#include "Keys.h"
#include "BkgAnimation.h"
#include "carillon_player.h"

const UINT16 tiles_menuPAL[] = {PALETTE_FROM_HEADER(tiles_menu)};
const UINT16 shipsPAL[] = {PALETTE_FROM_HEADER(player)};

UINT8 Menu_Mode = 0;
UINT8 Activate_Parallax = 0;
//declare BKG animations
MAP_ANIMATION Bkg_items[2];
TILE_ANIMATION Tile_items[2];

UINT16 M;
UINT8 Settings_Op;
//update only specific row, we are in bank 2 and the little 
//settings map is also in bank 2 so we can do it!!
//op = Y position in tile units
//set = postion in the little settings map
void change_menu_settings(UINT8 op, UINT8 set){
	set_bkg_tiles(24,op,8,1,map_menu_anim_settings+set);
	set_bkg_tiles(0,op,4,1,map_menu_anim_settings+set+4);
}

void Start_STATE_MENU() {

	int i;
	HIDE_WIN;

	ZGB_Parallax = 0;
	
	SPRITES_8x16;
	for(i = 0; i != N_SPRITE_TYPES; ++ i) {
		SpriteManagerLoad(i);
	}
	SHOW_SPRITES; 
	
	SetPalette(tiles_menuPAL, shipsPAL, 2);

	InitScrollTiles(0, 256, tiles_menu, 3);
	if (Menu_Mode == 0)InitScroll(map_plogoWidth, map_plogoHeight, map_plogoPLN0, 0, 0, 2, map_plogoPLN1);
	if (Menu_Mode == 2){
		CP_LoadMusic(6,1);
		InitScroll(map_menuWidth, map_menuHeight, map_menuPLN0, 0, 0, 3, map_menuPLN1);
	}
	
	SHOW_BKG;
	
	//Load bkg-tile animations
	LOAD_MAP_ANIM(&Bkg_items[0],3, 3, 4, map_menu_anim_asteroid, 3);
	LOAD_MAP_ANIM(&Bkg_items[1], 2, 3, 4, map_menu_anim_ball, 3);
	//Ball->state = 0;
	LOAD_TILE_ANIM(&Tile_items[0], 1, 4, tile_menu_anim_star, 3);
	LOAD_TILE_ANIM(&Tile_items[1], 1, 4, tile_menu_anim_star2, 3);	
	
	if (Menu_Mode == 0) CP_LoadMusic(6,0);
	M = 0;
	Settings_Op = 0;
}

void Update_STATE_MENU() {
		//ANIMATE STARS 
	TILE_ANIMATE(&Tile_items[0], 100, 8);
	TILE_ANIMATE(&Tile_items[1], 98, 5);	
	switch (Menu_Mode){
		case 0:
			if(M == 250){
				InitScroll(map_flogoWidth, map_flogoHeight, map_flogoPLN0, 0, 0, 3, map_flogoPLN1);
				Menu_Mode = 1;
				CP_LoadMusic(6,1);
			}
			M++;
		break;
		case 1:
			if(KEY_PRESSED(J_START)) {M = 0; Menu_Mode = 2;}
		break;
		case 2: // To Main Menu
			InitScroll(map_menuWidth, map_menuHeight, map_menuPLN0, 0, 0, 3, map_menuPLN1);
			SpriteManagerAdd(SPRITE_ARROW, 80, 80);
			SpriteManagerAdd(SPRITE_ROCKET, 160+16, 3*8);
			SpriteManagerAdd(SPRITE_UFO, -16, 10*8);
			Menu_Mode = 3;
		break;
///////////////////////////////////////////
		case 3: //Main Menu
			
			//ANIMATE BKG
			MAP_ANIMATE(&Bkg_items[0], 14, 2, 8);
			MAP_ANIMATE(&Bkg_items[1], 8, 10, 20);
			
			//if(KEY_PRESSED(J_B)) Menu_Mode = 2;
			
		break;
/////////////////////////////////////////////	
		case 4: //Scroll to info	
			InitScroll(map_menuWidth, map_menuHeight, map_menuPLN0+(40*18), 0, 0, 3, map_menuPLN1+(40*18));
			Menu_Mode = 5;
		break;
		case 5: //Info
			if(KEY_PRESSED(J_B))Menu_Mode = 6;
			
			//ANIMATE BKG
			MAP_ANIMATE(&Bkg_items[0], 0, 14, 8);
			MAP_ANIMATE(&Bkg_items[1], 1, 7, 20);			
		break;
		case 6: //Back to Main
			SpriteManagerAdd(SPRITE_ARROW, 80, 80);
			InitScroll(map_menuWidth, map_menuHeight, map_menuPLN0, 0, 0, 3, map_menuPLN1);
			Menu_Mode = 3;
		break;
/////////////////////////////////////////////	
		case 7: //Scroll to settings
			if (M == 20*8) Menu_Mode = 8;
			MoveScroll(M,0);
			M++; 			
		break;
		case 8: //settings
			if(KEY_TICKED(J_B))Menu_Mode = 9;
			if(Settings_Op > 6*8) Settings_Op=0;
			
			if(KEY_TICKED(J_DOWN)){change_menu_settings(7, Settings_Op+12);Settings_Op+=6;}
			if(KEY_TICKED(J_UP)){change_menu_settings(7, Settings_Op+12);Settings_Op-=6;}		
			
			if(KEY_TICKED(J_LEFT)) change_menu_settings(10, 0);
			if(KEY_TICKED(J_RIGHT)) change_menu_settings(10, 6);	
			
			//ANIMATE BKG
			MAP_ANIMATE(&Bkg_items[1], 5, 13, 8);	
		break;
		case 9: //Back to Main
			if (M == 0){
				Menu_Mode = 3;
				SpriteManagerAdd(SPRITE_ARROW, 80, 80);
				SpriteManagerAdd(SPRITE_UFO, -16, 3*8);
				SpriteManagerAdd(SPRITE_SHIP, 160+16, 10*8);
			}
			MoveScroll(M,0);
			M--; 			
		break;	
		case 10:
			SCX_REG++;
		break;
	}
	/*
	if(KEY_PRESSED(J_A)) {
       SetState(STATE_LEVEL1);
    }*/
}
