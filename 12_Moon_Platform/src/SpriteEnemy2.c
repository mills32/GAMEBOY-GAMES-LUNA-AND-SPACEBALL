#pragma bank 1
#include "Scroll.h"
#include "SpriteManager.h"
UINT8 bank_SPRITE_ENEMY2 = 1;

//Float speeds

const INT8 se20[] = {-1,0,-1,0};
const INT8 se21[] = {0,-1,0,-1}; 
const UINT8 se22[] = {1,0,1,0};   
const UINT8 se23[] = {0,1,1,0};   //0.5  

struct Enemy2Info {
	INT8 mode;
    INT8 vx;
	UINT8 tile_ahead;
	UINT8 tile_down;
	INT8 fl;
	INT8 dir;
};

void Start_SPRITE_ENEMY2() {
	struct Enemy2Info* data = (struct Enemy2Info*) THIS->custom_data;
	THIS->flags = 0x01;
    data->vx = -1;
	data->dir = -1;
	data->mode = 0;
	data->fl = 0;
	THIS->coll_x = 2;
	THIS->coll_y = 0;
	THIS->coll_w = 14; 
	THIS->coll_h = 16; //box
}

void Update_SPRITE_ENEMY2() {
    struct Enemy2Info* data = (struct Enemy2Info*) THIS->custom_data;	
	/*
	//End of walls detector
	data->tile = GetScrollTile((THIS->x + 8), ((THIS->y + 16)));
	
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
	if (data->dir == -1) data->vx = se20[data->fl];
	if (data->dir == 1) data->vx = se21[data->fl];
	
    if (TranslateSprite(THIS,data->vx,0) > 0){
		data->dir = -data->dir;
		if (data->dir == -1)THIS->flags = 0x01;
		if (data->dir == 1)THIS->flags = 0x21;
		data->fl = 0;
	}
	data->fl++;*/
}

void Destroy_SPRITE_ENEMY2() {
}