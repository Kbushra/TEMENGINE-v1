if global.turn == 0 && !posSet[0] { 
	
	posSet[0] = true;
	posSet[1] = false;
	
	x = objBM.buttonX[0];
	y = objBM.buttonY;
	
	objBM.menu = 0;
	objBM.selection[0] = 0;
	objBM.selection[1] = 0;
}

if global.turn == 1 {
	
	visible = true;
	
	if !posSet[1] {
		
		posSet[1] = true;
		posSet[0] = false;
		
		x = 320;
		y = 325;
	}
	
	#region Movement
	
	if objBM.bubble == 0 {
		
		if global.u && y - (1.5 * global.friskBattleSpd) > objBattleBox.uBorder + 12 { y -= 1.5 * global.friskBattleSpd; moving = true; }
		if global.d && y + (1.5 * global.friskBattleSpd) < objBattleBox.dBorder - 12 { y += 1.5 * global.friskBattleSpd; moving = true; }
		if global.l && x - (1.5 * global.friskBattleSpd) > objBattleBox.lBorder + 12 { x -= 1.5 * global.friskBattleSpd; moving = true; }
		if global.r && x + (1.5 * global.friskBattleSpd) < objBattleBox.rBorder - 12 { x += 1.5 * global.friskBattleSpd; moving = true; }
		
		if !global.u && !global.d { if !global.l && !global.r { moving = false; } }
	}
	
	x = clamp(x, objBattleBox.lBorder + 16, objBattleBox.rBorder - 16);
	y = clamp(y, objBattleBox.uBorder + 16, objBattleBox.dBorder - 16);
	
	#endregion
	
	#region Damage
	
	if objBattleBox.queuedDmg != 0 { image_speed = 3; }
	
	#endregion
}