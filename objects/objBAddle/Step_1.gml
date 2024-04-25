/// @description Attack managing
myHPScale = myHP / 15;
myBarX = objBM.monsterPos[0, spriteOrder] + 10;

if !inactive {
	if global.turn == 0 
	{ if chosen[0] { chosen[0] = false; } if chosen[1] { chosen[1] = false; } arrow = -1; warner = -1; }
	
	if global.turn == 1 {
		
		if currAttack == 0 {
			
			var r = random(1);
			if r < 0.3 { currAttack = 1; }
			else { currAttack = 2; }
		}
	}
	else { currAttack = 0; }

	//Set Attack Length
	if currAttack == 1 && !objBattleBox.atkStarted 
	{
		if global.priority < priority[0] {
			
			objBattleBox.atkLength = 400;
			objBattleBox.currLength = objBattleBox.atkLength;
			objBattleBox.battleWidth = 540;
			objBattleBox.battleHeight = 85;
			objBattleBox.battleX = 320;
			objBattleBox.battleY = 320;
			
			global.priority = priority[0];
			global.atkChosen[0] = 2;
			global.atkChosen[1] = -1;
			global.atkChosen[2] = -1;
		}
		spawnCounter = 60; 
	}
	if currAttack == 2 && !objBattleBox.atkStarted 
	{
		if global.priority <= priority[1] {
			
			objBattleBox.atkLength = 300;
			objBattleBox.currLength = objBattleBox.atkLength;
			objBattleBox.battleWidth = 400;
			objBattleBox.battleHeight = 300;
			objBattleBox.battleX = 320;
			objBattleBox.battleY = 200;
			
			global.priority = priority[1];
			
			var r = choose(0, 1, 2);
			
			if r == 0 {
				global.atkChosen[0] = 1;
				global.atkChosen[1] = 1;
				global.atkChosen[2] = -1;
			}
			else {
				global.atkChosen[0] = 1;
				global.atkChosen[1] = 0;
				global.atkChosen[2] = -1;
			}
		}
		spawnCounter = 30;
	}
	if currAttack == 1 && objBattleBox.atkStarted {
		
		if global.atkChosen[0] == 2 || chosen[0] {
			
			spawnCounter --;
			objBattleBox.battleWidth--;
			objBattleBox.preventChange = true;
			
			if warner == -1
			{ warner = warn(objBattleBox.rBorder - 20, , 2, , , , ); mark = warn(objBattleBox.rBorder - 20, , 2, , warner, true, ); }
			else if warner != -2 { warn(objBattleBox.rBorder - 20, , 2, , warner, , mark); }

			if arrow == -1
			{ arrow = warnArrow(objBattleBox.rBorder - 20, , 2, , 2, ); }
			else if arrow != -2 { warnArrow(objBattleBox.rBorder - 20, , 2, , 2, arrow); }
			
			if spawnCounter <= 0 {
				
				layer_sprite_destroy(warner);
				layer_sprite_destroy(mark);
				layer_sprite_destroy(arrow);
				warner = -2;
				mark = -2;
				arrow = -2;
				
				if scaleCount % 2 == 0 {
					bullet = instance_create_layer(objBattleBox.rBorder,
						objBattleBox.dBorder, "Bullets", objAddleScale);
					scaleCount++;
				}
				else {
					bullet = instance_create_layer(objBattleBox.rBorder + 60,
						objBattleBox.uBorder, "Bullets", objAddleScale);
					scaleCount++;
					bullet.flipped = true;
				}
		
				spawnCounter = 30;
			}
			global.atkChosen[0] = -1;
			chosen[0] = true;
		}
	}
	if currAttack == 2 && objBattleBox.atkStarted {
		
		var choosebool = global.atkChosen[0] == 1 || global.atkChosen[1] == 1;
		
		if choosebool || chosen[1] || global.priority == priority[1] {
			
			if warner == -1
			{ warner = warn( , objBattleBox.dBorder - 20, , 2, , , ); mark = warn( , objBattleBox.dBorder - 20, , 2, warner, true, ); }
			else if warner != -2 { warn( , objBattleBox.dBorder - 20, , 2, warner, , mark); }

			if arrow == -1
			{ arrow = warnArrow( , objBattleBox.dBorder - 20, , 2, 1, ); }
			else if arrow != -2 { warnArrow( , objBattleBox.dBorder - 20, , , 1, arrow); }
			spawnCounter --;
			
			if spawnCounter <= 0 {
				
				layer_sprite_destroy(warner);
				layer_sprite_destroy(mark);
				layer_sprite_destroy(arrow);
				warner = -2;
				mark = -2;
				arrow = -2;
				
				spawnCounter = 999;
				bullet = instance_create_layer(objBattleBox.lBorder + objBattleBox.battleWidth / 2,
					objBattleBox.dBorder - 20, "Bullets", objAddleWater);
			}
			if global.atkChosen[1] == 1 { global.atkChosen[1] = -1; }
			else if global.atkChosen[0] == 1 { global.atkChosen[0] = -1; }
			chosen[1] = true;
		}
	}
}