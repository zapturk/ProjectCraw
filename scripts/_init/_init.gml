// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function _init(){
	gml_pragma("global", "_init();");
	
	//Global
	global.upDir = 1;
	global.rightDir = 2;
	global.downDir = 3;
	global.leftDir = 4;
	global.tileSize = 16;

	//global.upRooms = [oLRUD, oLU, oRU, oU, oUD, oLUD, oRUD, oLRU];
	//global.rightRooms = [oLRUD, oLR, oR, oRD, oRU, oLRD, oRUD, oLRU];
	//global.downRooms = [oLRUD, oD, oLD, oRD, oUD, oLRD, oLUD, oRUD];
	//global.leftRooms = [oLRUD, oL, oLD, oLR, oLU, oLRD, oLUD, oLRU];

	global.upRooms = [oLU, oRU, oLUD, oRUD, oLRU];
	global.rightRooms = [oRD, oRU, oLRD, oRUD, oLRU];
	global.downRooms = [oLD, oRD, oLRD, oLUD, oRUD];
	global.leftRooms = [oLD, oLU, oLRD, oLUD, oLRU];

	// Enum
	enum directions{
		up,
		right,
		down,
		left
	}
	
	enum states {
		idle,
		walking
	}
}