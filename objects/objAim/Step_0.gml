if global.y || global.m { 
	
	image_speed = 1; hspeed = 0; 
	damaging = true;
}


if x >= objBattleBox.x - 12 && x <= objBattleBox.x + 12 { atkModifier = 3.5; }
	else { atkModifier = (0.1 / (abs(x - objBattleBox.x) / (objAttackBar.sprite_width / 2))) * 2; }

if atkModifier <= 1 { atkModifier *= 2.5; }
else if atkModifier < 2.5 { atkModifier = 2.5; }

if dir == 1 && x >= objBattleBox.rBorder { objAttackBar.fade = true; instance_destroy(); global.turn = 1; }
if dir == -1 && x <= objBattleBox.lBorder { objAttackBar.fade = true; instance_destroy(); global.turn = 1; }