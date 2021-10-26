/// @description Creates a room with a up opening
// You can write your code in this editor

if(!position_meeting(x, y + 32, oWalls)){
	ran = random_range(0, array_length(global.upRooms));
	instance_create_layer(x, y + 32, "Instances", global.upRooms[ran]);
}