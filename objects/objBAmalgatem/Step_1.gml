/// @description Attack managing

myHPScale = myHP / 15;
myBarX = objBM.monsterPos[0, spriteOrder] + 100;

if !inactive {
	if global.turn == 1 { if currAttack == 0 { currAttack = choose(1); } }
		else { currAttack = 0; }

	//Set Attack Length
	if currAttack == 1 && !objBattleBox.atkStarted  {
		objBattleBox.atkLength = 400;
		objBattleBox.currLength = objBattleBox.atkLength;
		spawnCounter = 0;
		objBattleBox.battleWidth = 280;
	}
	
	if currAttack == 1 && objBattleBox.atkStarted {
	
		spawnCounter --;
	
		if spawnCounter <= 0 {
		
			bullet = instance_create_layer(objBattleBox.rBorder - 140,
				objBattleBox.dBorder - 15, "Bullets", objStatue);
		
			spawnCounter = 999;
		}
	}
}
