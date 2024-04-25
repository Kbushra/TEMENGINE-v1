///@desc Actions specific to this bullet

counter --;

if counter >= 0 { speed = 1; counter --; }
	else { speed = 0; }
	
if counter <= -45 { counter = 120; direction = point_direction(x, y, objSoul.x, objSoul.y); }

if y > objBattleBox.dBorder || y < objBattleBox.uBorder - 12 { instance_destroy(); }