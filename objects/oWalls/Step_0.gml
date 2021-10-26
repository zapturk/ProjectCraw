/// @description Insert description here
// You can write your code in this editor

if(!createdChildren){
	for(num = 0; num < array_length(openDir); ++num){
		switch(openDir[num]){
			case global.upDir:
				alarm[0] = 15;	
				break;
			case global.rightDir:
				alarm[1] = 15;	
				break;
			case global.downDir:
				alarm[2] = 15;	
				break;
			case global.leftDir:
				alarm[3] = 15;
				break;
			default:
				break;
		}
	}
	createdChildren = true;
}
