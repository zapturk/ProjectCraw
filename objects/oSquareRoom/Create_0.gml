/// @description Insert description here
// You can write your code in this editor

numOfRooms = irandom_range(2,6);

// x, y, width, height
// biggest room size 48 X 24
for(var nr = 0; nr < numOfRooms; ++nr){
	//  left, middle, or right. top or bottom.
	xMin = 16 * (nr % 3) + 4;
	yMin = 12 * (nr % 2) + 4;
	
	//
	roomArr[nr][0] = global.tileSize * xMin + (irandom_range(0,1) * global.tileSize); 
	roomArr[nr][1] = global.tileSize * yMin + (irandom_range(0,1) * global.tileSize);
	roomArr[nr][2] = irandom_range(2, 12);
	roomArr[nr][3] = irandom_range(2, 8);
}


