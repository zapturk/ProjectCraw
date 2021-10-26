/// @description Insert description here
// You can write your code in this editor


if(state == states.idle){
	dir = global.leftDir;
	
	if(!GridPlaceMeeting(self, global.leftDir, oLevel.myGrid)){
		xFrom = xPos;
		yFrom = yPos;
	
		xTo = xPos - 1;
		yTo = yPos;
	
		xPos = xTo;
		yPos = yTo;
	
		state = states.walking;
	}
}