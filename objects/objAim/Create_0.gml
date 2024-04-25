depth = 200;
atkModifier = 0; //Modifier from where the target was hit
damaging = false; //Has the target been hit

image_speed = 0;

dir = choose(1, -1);

//Comming from different directions
if dir == 1 { x = objBattleBox.lBorder; hspeed = 8; } else { x = objBattleBox.rBorder; hspeed = -8; }