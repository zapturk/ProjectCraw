/// @description Insert description here
// You can write your code in this editor

for(var count = 0; count < numOfRooms; ++count){
	for(var w = 0; w < roomArr[count][2]; ++w){
		for(var h = 0; h < roomArr[count][3]; ++h){
			draw_sprite(sFloor2, 1, (roomArr[count][0] + (global.tileSize * w)), (roomArr[count][1] + (global.tileSize * h)));	
		}
	}
}


for(var count = 0; count < numOfRooms; ++count){
	for(var w = 0; w < roomArr[count][2]; ++w){
		for(var h = 0; h < roomArr[count][3]; ++h){
			draw_sprite(sFloor2, 1, (roomArr[count][0] + (global.tileSize * w)), (roomArr[count][1] + (global.tileSize * h)));	
		}
	}
}