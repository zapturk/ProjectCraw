/// @description Insert description here
// You can write your code in this editor

switch(dir){
		case global.upDir:
			image_angle = 0;
			break;
		case global.rightDir:
			image_angle = 270;
			break;
		case global.downDir:
			image_angle = 180;
			break;
		case global.leftDir:
			image_angle = 90;
			break;
		default:
			break;	
	}

if(state == states.walking){
	
	walkAnimTime += delta_time / 1000000;
	var t = walkAnimTime / walkAnimLenth;
	
	if(t >= 1){
		walkAnimTime = 0;
		t = 1
		state = states.idle;
	}
	
	var newX = lerp(xFrom, xTo, t);
	var newY = lerp(yFrom, yTo, t);
	
	x = newX * CELL_WIDTH + (CELL_HEIGHT / 2);
	y = newY * CELL_HEIGHT + (CELL_HEIGHT / 2);
}