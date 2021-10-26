/// @description Creates a room with a down opening
// You can write your code in this editor

if(!position_meeting(x, y - 32, oWalls)){
	ran = random_range(0, array_length(global.downRooms));
	instance_create_layer(x, y - 32, "Instances", global.downRooms[ran]);
}