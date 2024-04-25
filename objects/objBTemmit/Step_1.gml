/// @description Attack managing

myHPScale = myHP / 15;
myBarX = objBM.monsterPos[0, spriteOrder] + 10;

if !inactive {
	if global.turn == 0 
	{ if chosen[0] { chosen[0] = false; } if chosen[1] { chosen[1] = false; } }
	
	if global.turn == 1 { if currAttack == 0 { currAttack = choose(1, 2); } }
		else { currAttack = 0; }

	//Set Attack Length
	if currAttack == 1 && !objBattleBox.atkStarted 
	{
		if global.priority <= priority[0] {
			
			objBattleBox.atkLength = 400;
			objBattleBox.currLength = objBattleBox.atkLength;
			objBattleBox.battleWidth = 140;
			objBattleBox.battleHeight = 140;
			objBattleBox.battleX = 320;
			objBattleBox.battleY = 320;
			
			global.priority = priority[0];
			
			var r = choose(0, 1);
			
			if r == 0 {
				global.atkChosen[0] = 0;
				global.atkChosen[1] = 0;
				global.atkChosen[2] = -1;
			}
			else {
				global.atkChosen[0] = 0;
				global.atkChosen[1] = 0;
				global.atkChosen[2] = 0;
			}
		}
		spawnCounter = 0; 
	}
	if currAttack == 2 && !objBattleBox.atkStarted 
	{
		if global.priority < priority[1] {
			
			objBattleBox.atkLength = 200;
			objBattleBox.currLength = objBattleBox.atkLength;
			objBattleBox.battleWidth = 300;
			objBattleBox.battleHeight = 140;
			objBattleBox.battleX = 320;
			objBattleBox.battleY = 320;
			
			global.priority = priority[1];
			chosen[0] = true;
			
			var r = choose(0, 1);
			
			if r == 0 {
				global.atkChosen[0] = 1;
				global.atkChosen[1] = 0;
				global.atkChosen[2] = -1;
			}
			else {
				global.atkChosen[0] = 1;
				global.atkChosen[1] = 1;
				global.atkChosen[2] = -1;
			}
		}
		spawnCounter = 0;
	}
	
	if currAttack == 1 && objBattleBox.atkStarted {
		
		var choosebool = global.atkChosen[0] == 0 || global.atkChosen[1] == 0 || global.atkChosen[2] == 0;
		if choosebool || chosen[0] {
		
			spawnCounter --;
	
			if spawnCounter <= 0 {
		
				bullet = instance_create_layer(objBattleBox.lBorder + irandom(objBattleBox.bbWidth),
					objBattleBox.uBorder - 6, "Bullets", objFroggitFly);
			
				with(bullet) { counter = 120; direction = point_direction(x, y, objSoul.x, objSoul.y); }
		
				spawnCounter = 90;
			}
			if global.atkChosen[2] == 0 { global.atkChosen[2] = -1; }
			else if global.atkChosen[1] == 0 { global.atkChosen[1] = -1; }
			else if global.atkChosen[0] == 0 { global.atkChosen[0] = -1; }
			chosen[0] = true;
		}
	}
	
	if currAttack == 2 && objBattleBox.atkStarted {
		
		var choosebool = global.atkChosen[0] == 1 || global.atkChosen[1] == 1;
		
		if choosebool || chosen[1] {
		
			spawnCounter --;
	
			if spawnCounter <= 0 {
				spawnCounter = 999;
				bullet = instance_create_layer(choose(objBattleBox.lBorder + 40, objBattleBox.rBorder - 40),
					objBattleBox.dBorder + 25, "Bullets", objFrogFrog);
			
				with(bullet) {
					counter = 120;
					chase = false;
					if x == objBattleBox.lBorder + 20 { left = true; } else { left = false; }
				}
			}
			if global.atkChosen[1] == 1 { global.atkChosen[1] = -1; }
			else if global.atkChosen[0] == 1 { global.atkChosen[0] = -1; }
			chosen[1] = true;
		}
	}
}
