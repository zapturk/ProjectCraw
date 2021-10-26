/// @description Insert description here
// You can write your code in this editor

if(!instance_exists(target)){
	exit;	
}

x = lerp(x, target.x, .1);
y = lerp(y, target.y-8, .1);
x = RoundN(x, cScale);
y = RoundN(y, cScale);
x = clamp(x, cWidth/2 + CELL_WIDTH, room_width-cWidth/2 - CELL_WIDTH);
y = clamp(y, cHeight/2 + CELL_HEIGHT, room_height - cHeight / 2 - CELL_HEIGHT);
camera_set_view_pos(view_camera[0], x - cWidth / 2, y - cHeight / 2);