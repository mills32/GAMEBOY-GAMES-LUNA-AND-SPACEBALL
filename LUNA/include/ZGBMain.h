#ifndef ZGBMAIN_H
#define ZGBMAIN_H

#include "main.h"

typedef enum {
	STATE_MENU,
	STATE_LEVEL1,

	N_STATES
} STATE;

typedef enum {
	SPRITE_PLAYER,
	SPRITE_ENEMY,

	N_SPRITE_TYPES
} SPRITE_TYPE;

#endif