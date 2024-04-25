/// @description Actions specific to this bullet
counter--;

if counter <= 0 && speed != 5 { speed = 5; image_index = 1; chase = true; }
if counter <= -40 && left { direction -= 2; }
else if counter <= -40 { direction += 2; }

if counter <= -20 { chase = false; }

if chase { direction = point_direction(x, y, objSoul.x, objSoul.y); }

if x > objBattleBox.rBorder - 20 { x = objBattleBox.rBorder - 20; }
if x < objBattleBox.lBorder + 20 { x = objBattleBox.lBorder + 20; }
if y > objBattleBox.dBorder - 3 { y = objBattleBox.dBorder - 3; image_index = 0; }
if y < objBattleBox.uBorder + 40 { y = objBattleBox.uBorder + 40; }