/// @description Creates a room with a right opening
// You can write your code in this editor

if(!position_meeting(x + 32, y, oWalls)){
	ran = random_range(0, array_length(global.leftRooms));
	instance_create_layer(x + 32, y, "Instances", global.leftRooms[ran]);
}