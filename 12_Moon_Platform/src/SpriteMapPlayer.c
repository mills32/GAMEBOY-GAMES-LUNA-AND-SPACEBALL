#pragma bank 1

#include "..\res\src\map_player.h"
#include "Scroll.h"
#include "SpriteManager.h"

UINT8 bank_SPRITE_MAP_PLAYER = 1;

extern UINT8 Level;
const UINT8 map_player_walk[] = {2, 0, 1};
const UINT8 Map_Position[] = {
	2,2,
	4,6,
	4,9,
	4,15,
	4,26,
	14,26,
	20,26,
	28,26,
	28,21,
	24,15,
	19,14,
	17,5,
	23,5,
	29,5
};

void Start_SPRITE_MAP_PLAYER() {
	SetSpriteAnim(THIS, map_player_walk, 5);
	THIS->flags = 0x00;
}

void Update_SPRITE_MAP_PLAYER() {
	UINT8 x = (Map_Position[(Level<<1)]<<3)-4;
	UINT8 y = (Map_Position[(Level<<1)+1]<<3)-8;
	if (THIS->x < x) THIS->x+=2;
	if (THIS->x > x) THIS->x-=2;
	if (THIS->y < y) THIS->y+=2;
	if (THIS->y > y) THIS->y-=2;
}

void Destroy_SPRITE_MAP_PLAYER() {
	
}