///@desc Mainly the player's attacks

if attacking { //If you're currently attacking
	
	removeDamage += 0.01;
	
	var curve = animcurve_get_channel(acMonsterDamage, "damage");
	var position;
	
	objSoul.visible = false; //Make soul invisible
	
	//Create attack bar, if doesn't exist
	if !instance_exists(objAttackBar) {
		
		wait = 1;
		animProgress = 0;
		
		instance_destroy(objMonsterHP);
		
		instance_create_layer(objBattleBox.x, objBattleBox.y, "UI", objAttackBar);
	}
		 
	if instance_exists(objAim) && objAim.damaging { //Calculate Damage
		
		if !instance_exists(objAtkEffect) && wait == 1 { 
			
			wait = 0.5;
			
			instance_create_layer(x, y, "Attack", objAtkEffect); 
			
			objAtkEffect.sprite_index = sprDefaultAtk;
			objAtkEffect.monsterX = monsterPos[0, selectMonster.spriteOrder] + 40;
			objAtkEffect.monsterY = monsterPos[1, selectMonster.spriteOrder] + 5;
		}
		
		if instance_exists(objAtkEffect) { 
			
			if objAtkEffect.sprite_index == sprDefaultAtk {
			
				if objAtkEffect.image_index >= objAtkEffect.image_number - 2 { wait = 0.1; }
			}
		}
		
		if wait == 0.1 {  
			
			//Create HP Bar
			if !instance_exists(objMonsterHP) {
				
				instance_create_layer(monsterPos[0, selectMonster.spriteOrder],
					-30, "Managers", objMonsterHP);
				
				objMonsterHP.targetPos = monsterPos[1, selectMonster.spriteOrder] - 25;
				
				r = random(2); //Random value that adds to your damage randomly (redundancy is great)
		
				//Calculation in question:
				damage = round((global.weaponAtk + global.attack + 10 - selectMonster.myDef + r) * objAim.atkModifier);
				selectMonster.myHP -= damage;
			}
			
			//Set HP Bar position
			objMonsterHP.mode = 1;
			objMonsterHP.x = selectMonster.myBarX;
			
			animProgress += 1 / 60;
			if animProgress >= 1 { animProgress = 1; wait = 0; }
			
			position = animcurve_channel_evaluate(curve, animProgress);
			
			layer_sequence_x(selectMonster.mySequence, monsterPos[0, selectMonster.spriteOrder] + position * 10);
		}
		
		//Wait 5 billion decades motherfucker
		if wait == 0 { //End the attack
			
			//Decrease the monsters HP by the damage you inflicted (duh x20938)	
			attacking = false;
			
			objAim.damaging = false;
			objSoul.visible = true;
			
			instance_destroy(objAim);
			
			menu = 0;
			global.turn = 1; 
		}
		
		//Make monster die once
		if selectMonster.myHP <= 0 && wait == 0 {
			
            monster_out(selectMonster, "killed");
			objMonsterHP.move = 1;
			
            attackedMonster = selectMonster;
        }
	} //Calculate Damage
} //If you were attacking

//Update every monster's order in the currMonster array
if global.battling {

	if currMonster[0] != -1 { currMonster[0].order = 0; } //Update monster 0 (if exists)
	if currMonster[1] != -1 { currMonster[1].order = 1; } //Update monster 1 (if exists)
	if currMonster[2] != -1 { currMonster[2].order = 2; } //Update monster 2 (if exists)
}