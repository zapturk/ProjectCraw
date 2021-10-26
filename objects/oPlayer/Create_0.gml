/// @description Insert description here
// You can write your code in this editor

state = states.idle;

xPos = x div CELL_WIDTH;
yPos = y div CELL_HEIGHT;

xFrom = xPos;
yFrom = yPos;

xTo = xPos;
yTo = yPos;

walkAnimLenth = 0.5;
walkAnimTime = 0;

dir = global.upDir;

instance_create_layer(x, y, "Instances", oCarmera);