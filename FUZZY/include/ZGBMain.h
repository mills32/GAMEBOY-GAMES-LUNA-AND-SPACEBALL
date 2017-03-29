#ifndef ZGBMAIN_H
#define ZGBMAIN_H

#include "main.h"

//List All scenes
typedef enum {
	STATE_MENU,
	STATE_LEVEL1,

	N_STATES
} STATE;

typedef enum {
	SPRITE_PLAYER,
	SPRITE_POINTER,
	SPRITE_SHIP,
	SPRITE_UFO,
	SPRITE_ARROW,

	N_SPRITE_TYPES
} SPRITE_TYPE;

#endif