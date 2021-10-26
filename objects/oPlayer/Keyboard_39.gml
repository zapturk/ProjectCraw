/// @description Insert description here
// You can write your code in this editor


if(state == states.idle){
	dir = global.rightDir;
	
	if(!GridPlaceMeeting(self, global.rightDir, oLevel.myGrid)){
	
		xFrom = xPos;
		yFrom = yPos;
	
		xTo = xPos + 1;
		yTo = yPos;
	
		xPos = xTo;
		yPos = yTo;
	
		state = states.walking;
	}
}