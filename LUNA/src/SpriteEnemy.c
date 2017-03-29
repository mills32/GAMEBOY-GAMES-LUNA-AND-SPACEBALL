#pragma bank=2
#include "SpriteEnemy.h"
#include "Scroll.h"
#include "SpriteManager.h"
UINT8 bank_SPRITE_ENEMY = 2;

//Float speeds
const UINT8 se0[] = {-1,0,-1,0}; //-0.5
const UINT8 se1[] = {1,0,1,0};   //0.5

const UINT8 enemy_walk[] = {6, 0, 1, 2, 3, 4, 5};

struct EnemyInfo {
    INT8 vx;
	INT8 sx;
	INT8 tile;
	INT8 fl;
	INT8 dir;
};

void Start_SPRITE_ENEMY() {
    struct EnemyInfo* data = THIS->custom_data;
	THIS->flags = 0x01;
    data->vx = -1;
	data->dir = -1;
	data->sx = 0;
	data->fl = 0;
	SetSpriteAnim(THIS, enemy_walk, 20);
	THIS->coll_x = 2;
	THIS->coll_y = 0;
	THIS->coll_w = 14; 
	THIS->coll_h = 16; //box
}

void Update_SPRITE_ENEMY() {
    struct EnemyInfo* data = THIS->custom_data;	

	//End of Platform detector
	data->tile = GetScrollTile((THIS->x + 8) >> 3, ((THIS->y + 16) >> 3));
	
	if (data->fl == 4) data->fl = 0;
	
	if (data->tile != 2)
	{ 
		data->dir = -data->dir;
		data->fl = 0;
		//FLIP
		if (data->dir == -1)THIS->flags = 0x01;
		if (data->dir == 1)THIS->flags = 0x21;
	}
	//FLIP
	if (data->dir == -1) data->vx = se0[data->fl];
	if (data->dir == 1) data->vx = se1[data->fl];
	
    if (TranslateSprite(THIS,data->vx,0) > 0){
		data->dir = -data->dir;
		if (data->dir == -1)THIS->flags = 0x01;
		if (data->dir == 1)THIS->flags = 0x21;
		data->fl = 0;
	}
	data->fl++;
}

void Destroy_SPRITE_ENEMY() {
}