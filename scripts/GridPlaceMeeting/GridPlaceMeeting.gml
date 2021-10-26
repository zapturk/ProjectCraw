// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GridPlaceMeeting(object, dir, grid){
	//var topRight = grid[# (object.bbox_right - 1) / CELL_WIDTH, object.bbox_top / CELL_HEIGHT] == VOID;
	//var topLeft = grid[# object.bbox_left / CELL_WIDTH, object.bbox_top / CELL_HEIGHT] == VOID;
	//var bottomRight = grid[# (object.bbox_right - 1) / CELL_WIDTH, (object.bbox_bottom - 1) / CELL_HEIGHT] == VOID;
	//var bottomLeft = grid[# object.bbox_left / CELL_WIDTH, (object.bbox_bottom - 1) / CELL_HEIGHT] == VOID;

	//return topRight || topLeft || bottomRight || bottomLeft;
	
	var canMove = false;
	
	if(dir == global.upDir){
		canMove = grid[# object.x / CELL_WIDTH, (object.y - CELL_HEIGHT)/ CELL_HEIGHT]	== VOID;
	}
	else if(dir == global.rightDir){
		canMove = grid[# (object.x + CELL_WIDTH) / CELL_WIDTH, object.y / CELL_HEIGHT]	== VOID;
	}
	else if(dir == global.downDir){
		canMove = grid[# object.x / CELL_WIDTH,(object.y + CELL_HEIGHT) / CELL_HEIGHT]	== VOID;
	}
	else if(dir == global.leftDir){
		canMove = grid[# (object.x - CELL_WIDTH) / CELL_WIDTH, object.y / CELL_HEIGHT]	== VOID;
	}
	
	
	return canMove;
}