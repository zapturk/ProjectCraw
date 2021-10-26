/// @description Insert description here
// You can write your code in this editor

randomize();

// get the tile
var wallMapID = layer_tilemap_get_id("WallTiles");

//set up the grid
gridWidth = room_width / CELL_WIDTH;
gridHeight = room_height / CELL_HEIGHT;
myGrid = ds_grid_create(gridWidth, gridHeight);
ds_grid_set_region(myGrid, 0, 0, gridWidth, gridHeight, VOID);

// create the controller
var ctrX = gridWidth / 2;
var ctrY = gridHeight / 2;
var ctrDir = irandom(3);
var steps = 400;

var playerStartX = ctrX * CELL_WIDTH + CELL_WIDTH / 2;
var playerStartY = ctrY * CELL_HEIGHT + CELL_HEIGHT / 2;
instance_create_layer(playerStartX, playerStartY, "Instances", oPlayer);

var dirChangeOdds = 1;
repeat(steps){
	myGrid[# ctrX, ctrY] = FLOOR;
	
	// randomize the direction
	if(irandom(dirChangeOdds) == dirChangeOdds){
		 ctrDir = irandom(3);	
	}
	
	// Move the controller
	var xDir = lengthdir_x(1, ctrDir * 90);
	var yDir = lengthdir_y(1, ctrDir * 90);
	ctrX += xDir;
	ctrY += yDir;
	
	// Make sure we dont go out of the grid
	if (ctrX < 2 || ctrX >= gridWidth - 2){
		ctrX += -xDir * 2;	
	}
	
	if (ctrY < 2 || ctrY >= gridHeight - 2){
		ctrY += -yDir * 2;	
	}
}

// removes 1 by 1 holes
for(var h = 1; h < gridHeight - 1; h++){
	for(var w = 1; w < gridWidth - 1; w++){
		if(myGrid[# w, h] != FLOOR){
			var northTile = myGrid[# w, h-1] == VOID;	
			var westTile = myGrid[# w-1, h] == VOID;
			var eastTile = myGrid[# w+1, h] == VOID;
			var southTile = myGrid[# w, h+1] == VOID;
			
			var tileIndex = NORTH * northTile + WEST * westTile + EAST * eastTile + SOUTH * southTile + 1;
			if(tileIndex == 1){
				myGrid[# w, h] = FLOOR;	
			}
		}
	}
}

// Auto tiles the map
for(var h = 1; h < gridHeight - 1; h++){
	for(var w = 1; w < gridWidth - 1; w++){
		if(myGrid[# w, h] != FLOOR){
			var northTile = myGrid[# w, h-1] == VOID;	
			var westTile = myGrid[# w-1, h] == VOID;
			var eastTile = myGrid[# w+1, h] == VOID;
			var southTile = myGrid[# w, h+1] == VOID;
			
			var tileIndex = NORTH * northTile + WEST * westTile + EAST * eastTile + SOUTH * southTile + 1;
			tilemap_set(wallMapID, tileIndex, w, h);
		}
	}
}

