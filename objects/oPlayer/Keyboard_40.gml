/// @description Insert description here
// You can write your code in this editor


if(state == states.idle){
	dir = global.downDir;
	
	if(!GridPlaceMeeting(self, global.downDir, oLevel.myGrid)){
		xFrom = xPos;
		yFrom = yPos;
	
		xTo = xPos;
		yTo = yPos + 1;
	
		xPos = xTo;
		yPos = yTo;
	
		state = states.walking;
	}
}