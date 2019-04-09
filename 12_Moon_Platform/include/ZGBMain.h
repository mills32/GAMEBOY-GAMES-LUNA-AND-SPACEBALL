#ifndef ZGBMAIN_H
#define ZGBMAIN_H

#define STATES \
_STATE(STATE_MENU)\
_STATE(STATE_GAME)\
_STATE(STATE_VILLAGE)\
STATE_DEF_END

//SPRITES IN ORDER
/*
0 = player/robot/Z80
1 = map player
2 = gif/human
3 = dol
4 = enemy bot (Walker BOT)
5 = enemy2 bot1 (Climber BOT)
6 = enemy3 bot2 (Floating BOT)
7 = pollen (Big)
8 = pollen (Small)
9 = particle (dust, snow)
10 = rock
11 = ice spike
12 = metal block
13 = vehicle
14 = windmill
15 = rocket
16 = evolver
*/
#define SPRITES \
_SPRITE_DMG(SPRITE_PLAYER, player, 1, FRAME_16x16, 14)\
_SPRITE_DMG(SPRITE_MAP_PLAYER, map_player, 1, FRAME_16x16, 4)\
_SPRITE_DMG(SPRITE_HUMAN, human, 1, FRAME_16x16, 9)\
_SPRITE_DMG(SPRITE_DOL, dol, 1, FRAME_16x16, 4)\
_SPRITE_DMG(SPRITE_ENEMY, enemy, 1, FRAME_16x16, 6)\
_SPRITE_DMG(SPRITE_ENEMY2, enemy2, 1, FRAME_16x16, 4)\
_SPRITE_DMG(SPRITE_ENEMY3, enemy3, 1, FRAME_16x16, 4)\
_SPRITE_DMG(SPRITE_POLLENB, pollenb, 1, FRAME_32x32, 2)\
_SPRITE_DMG(SPRITE_POLLENS, pollens, 1, FRAME_16x16, 1)\
_SPRITE_DMG(SPRITE_MILL, village_mill, 2, FRAME_32x32, 8)\
SPRITE_DEF_END

#include "ZGBMain_Init.h"

#endif