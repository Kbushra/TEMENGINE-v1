///@desc Setting up everything

//Draw each monster's out sprite IF they're out of the battle (insert reference to Bad Guy by Billie Eilish)
if monsterOut[0] != 0 && monsterSprite[0] == 0 {
	
	monsterSprite[0] = layer_sprite_create("Sprites", monsterPos[0, monsterOut[0].spriteOrder], monsterPos[1, monsterOut[0].spriteOrder], monsterOut[0].outSprite);
	layer_sprite_alpha(monsterSprite[0], 0.5);
}

if monsterOut[1] != 0 && monsterSprite[1] == 0 {
	
	monsterSprite[1] = layer_sprite_create("Sprites", monsterPos[0, monsterOut[1].spriteOrder], monsterPos[1, monsterOut[1].spriteOrder], monsterOut[1].outSprite);
	layer_sprite_alpha(monsterSprite[1], 0.5);
}

if monsterOut[2] != 0 && monsterSprite[2] == 0 {
	
	monsterSprite[2] = layer_sprite_create("Sprites", monsterPos[0, monsterOut[2].spriteOrder], monsterPos[1, monsterOut[2].spriteOrder], monsterOut[2].outSprite);
	layer_sprite_alpha(monsterSprite[2], 0.5);
}

if soulSprite != -1 {
	
	layer_sprite_x(soulSprite, layer_sprite_get_x(soulSprite) - 1.5);
	if layer_sprite_get_x(soulSprite) < -120 { end_battle(); }
}

if global.battling {
	
	if monster == -1 { 
		
		for(var i = 0; i <= global.monsterNum; i ++) {
			currMonster[i] = instance_create_layer(x, y, "Monster", currMonster[i]); 
			monster = currMonster[i];
		}
	}

	function chat(reqText, endBattle = false) {
		
		if chatbox != 0 { instance_destroy(chatbox); }
	
		chatbox = instance_create_layer(x, y, "Chatbox", objChatbox);
		
		chatbox.canSkip = false;
		chatbox.chatboxOrigin = id;
		chatbox.textToDraw = reqText;
		currText = reqText;
		
		if endBattle { chatbox.endBattle = true; }
	}
	
	function reorder_monsters() {
		
		if global.monsterNum == 0 {
			for (var i = 0; i < 3; i++;) {
				if currMonster[i] != -1 {
									
					currMonster[0] = currMonster[i];
					currMonster[1] = -1;
					currMonster[2] = -1;
				}
			}
		}
		else if global.monsterNum == 1 {
			for (var i = 0; i < 3; i ++;) {
								
				if currMonster[i] != -1 {
					if newList[0] == -1 { newList[0] = currMonster[i]; }
					else { newList[1] = currMonster[i]; }
				}
			}
			currMonster[0] = newList[0];
			currMonster[1] = newList[1];
			currMonster[2] = -1;
		}
		
		if global.monsterNum == -1 { //When all monsters are gone...		
			
			global.maxHp = objBattleBox.MMHp;
			
			if chatbox == 0 {	
				menu = 3;
				audio_stop_all();
				objSoul.visible = false;
				change_turn();
				
				if global.love != 20 {
					
					global.exp += expGained;
					global.gold += goldGained;
					if global.exp >= global.reqExp[global.love - 1] { global.love ++; global.exp = 0; }
				}
				
				if global.prevLove != global.love {
					chat("* You won!&* You got " + string(expGained) + 
					" EXP and " + string(goldGained) + " GOLD,&your LOVE increased.", true);
				}
				else {
					chat("* You won!&* You got " + string(expGained) + 
					" EXP and " + string(goldGained) + " GOLD.", true);
				}
			}
		}
	}
	
	//Spawn in all of the monsters
	if global.monsterNum == 2 && currMonster[0].mySequence == -1 { //If there's 3 monsters...
		
		bubbleSprite = sprBubbleBig;
		bubbleDirection = !currMonster[0].grounded;
		
		//These variables track each monster's position
		monsterPos[0, 0] = 40; //Monster 1, x
		monsterPos[1, 0] = 140; //Monster 1, y
		
		monsterPos[0, 1] = 240; //Monster 2, x
		monsterPos[1, 1] = 140; //Monster 2, y
		
		monsterPos[0, 2] = 440; //Monster 3, x
		monsterPos[1, 2] = 140; //Monster 3, y
		
		//Setting monster's positions
		currMonster[0].mySequence = layer_sequence_create("Sprites", monsterPos[0, 0], monsterPos[1, 0], currMonster[0].reqSequence);
		currMonster[1].mySequence = layer_sequence_create("Sprites", monsterPos[0, 1], monsterPos[1, 1], currMonster[1].reqSequence);
		currMonster[2].mySequence = layer_sequence_create("Sprites", monsterPos[0, 2], monsterPos[1, 2], currMonster[2].reqSequence);
		
		currMonster[0].spriteOrder = 0;
		currMonster[1].spriteOrder = 1;
		currMonster[2].spriteOrder = 2;
		
	} else if global.monsterNum == 1 && currMonster[0].mySequence == -1 { //If there's 2 monsters...
		
		bubbleSprite = sprBubbleBig;
		bubbleDirection = !currMonster[0].grounded;
		
		//These variables track each monster's position
		monsterPos[0, 0] = 140;
		monsterPos[1, 0] = 140;
		
		monsterPos[0, 1] = 340;
		monsterPos[1, 1] = 140;
		
		currMonster[0].mySequence = layer_sequence_create("Sprites", monsterPos[0, 0], monsterPos[1, 0], currMonster[0].reqSequence);
		currMonster[1].mySequence = layer_sequence_create("Sprites", monsterPos[0, 1], monsterPos[1, 1], currMonster[1].reqSequence);
		
		currMonster[0].spriteOrder = 0;
		currMonster[1].spriteOrder = 1;
		
	} else if global.monsterNum == 0 && currMonster[0].mySequence == -1 { //If there's 1 monster...
		
		//These variables track each monster's position
		monsterPos[0, 0] = 240;
		monsterPos[1, 0] = 140;
		
		if currMonster[0].grounded {
		
			bubbleSprite = sprBubbleMed;
			bubbleDirection = choose(0, 1);
		} else { bubbleDirection = !currMonster[0].grounded; }
		
		currMonster[0].mySequence = layer_sequence_create("Sprites", monsterPos[0, 0], monsterPos[1, 0], currMonster[0].reqSequence);
		currMonster[0].spriteOrder = 0;
	}
	
	function blub(reqText, ref, sprite = undefined, frame = undefined) {
		
		bubble = instance_create_layer(x, y, "Chatbox", objBubble);
		
		bubble.chatboxOrigin = id;
		bubble.textToDraw = reqText;
		bubble.monsterRef = ref;
		
		if sprite != undefined && frame != undefined {
		
			bubble.sprite_index = sprite;
			bubble.image_index = frame;
		}
	}
	
	if global.turn == 1 { if chatbox != 0 { instance_destroy(objChatbox); chatbox = 0; } }
}