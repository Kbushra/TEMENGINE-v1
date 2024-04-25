///@desc All of the dirty stuff

if global.battling { //If you're in battle

	battle_message_spawn();
	
	#region Menus n' things
	
	if global.turn == 0 { //If it's the player's turn
		
		blubbed = false;
	
		if menu == 0 { //If menu == 0
			
			//Menuing...
			if global.rPressed { if currButton < 3 { currButton ++; } else { currButton = 0; } }
			if global.lPressed { if currButton > 0 { currButton --; } else { currButton = 3; } }
		
			//Snap soul to needed position
			objSoul.x = buttonX[currButton];
			objSoul.y = buttonY;
			
			if instance_exists(objMonsterHP) { if objMonsterHP.mode == 1 { objMonsterHP.move = 1; } else { instance_destroy(objMonsterHP); } }
			
			if global.y || global.m { audio_play_sound(sndSelect, 10, false); if currButton != 2 || global.invFree != 0 { menu ++; } } //Go to the next menu if pressed Accept
			
		} else if menu == 1 { //If menu == 1
			
			//Destroy the chatbox when going to the next menu (except if you've spared all the monsters)
			if global.monsterNum != -1 {
				
				if global.n && !attacking { menu --; chat(currText); selection[0] = 0; selection[1] = 0; }
				instance_destroy(chatbox); chatbox = 0; 
			}
			
			//Each of the buttons second menu
			switch(currButton) {
			
				case 0: //If on attack
				
				//If pressed Accept
				if global.y || global.m { if !attacking { audio_play_sound(sndSelect, 10, false); attacking = true; } }
				
				//Lists!
				selectLimit[0] = global.monsterNum; //This is so you can't select a non-existent monster
				battle_lists(0);
				
				if !instance_exists(objMonsterHP) && !attacking
					{ instance_create_layer(x, y, "Managers", objMonsterHP); }
				break;
				
				case 1: //If on act
				
				if global.y || global.m { audio_play_sound(sndSelect, 10, false); menu ++; selectMonster = currMonster[selection[0]]; }
				
				//Lists! (again)
				selectLimit[0] = global.monsterNum; //This is so you can't select a non-existent monster
				battle_lists(0); //Manage list selection
				break;
				
				case 2: //If on item
				
				//Set list limit (so you can't select a non-existent item
				if page == 0 {
					
					if global.invLength >= 4 { selectLimit[1] = 4; } 
						else { selectLimit[1] = global.invLength - 1; }
						
				} else { selectLimit[1] = global.invLength - 5; }
				
				battle_lists(2);
				
				if global.y || global.m {
					
					if page == 0 { var selectedItem = selection[1] }
						else { var selectedItem = selection[1] + 4; }
					var chattedText = global.itemID[global.inventory[selectedItem]].myUseText;
					
					var selectIDClass = global.itemID[global.inventory[selectedItem]].myClass;
					
					var temp = global.weapon;
					var temp2 = global.armor;
				
					if selectIDClass == 0 { global.weapon = global.inventory[selectedItem]; global.inventory[selectedItem] = temp; }
					else if selectIDClass == 1 { global.armor = global.inventory[selectedItem]; global.inventory[selectedItem] = temp2; }
					else if selectIDClass == 2 { global.healer = global.inventory[selectedItem]; audio_play_sound(sndHeal, 5, false); }
				
					if selectIDClass == 2 {
						
						//Reorganize...
						global.inventory[selectedItem] = 0;
						
						for( var i = 0; i < global.invLength - 1 - selectedItem; i ++; ) {
							
							global.inventory[selectedItem + i] = global.inventory[selectedItem + i + 1];
							global.inventory[selectedItem + i + 1] = 0;
						} 
					}
					
					chat(chattedText);
					objSoul.visible = false;
					menu = 3;
				}
				
				break;
				
				case 3: //If on mercy
				
				//When you press Accept
				if global.y || global.m {
					audio_play_sound(sndSelect, 10, false);
					if selection[0] == 0 { //If you wanted to spare...
						
						//When you spare a monster it dissapears
						for (var i = 0; i < 3; i++;) { if currMonster[i] != -1 { monster_out(currMonster[i], "spared"); } }
						reorder_monsters();
						
					} else { //If you wanted to flee...
						//You have a 60% chance of fleeing
						var rnd = random(99);
						
						if rnd > 0.4 { //Flee
							
							audio_stop_all();
							audio_play_sound(sndFlee, 10, false);
							
							if expGained == 0 && goldGained == 0 { chat("@0* You fleed..."); }
							else {
								if global.love != 20 {
									
									global.exp += expGained;
									global.gold += goldGained;
									if global.exp >= global.reqExp[global.love - 1] { global.love ++; global.exp = 0; }
								}
								if global.prevLove == global.love
								{ chat("@0* You fleed with " + string(expGained) + " EXP and " + string(goldGained) + "&gold..."); }
								else { chat("@0* You fleed with " + string(expGained) + " EXP and " + string(goldGained) + "&gold, levelling up..."); }
							}
							
							if soulSprite == -1 { soulSprite = layer_sprite_create("Heart", objSoul.x, objSoul.y, sprSoulFlee); }
							objSoul.visible = false;
							global.battling = false;
						}
						else { global.turn = 1; }
					}
				}
				
				battle_lists(0, 1); //Manage list selection
				break;
			}
		} else if menu == 2 { //If menu == 2 (ACT only)
			
			if global.n { menu --; selection[1] = 0; }
			
			instance_destroy(chatbox); 
			chatbox = 0; 
			
			if global.y || global.m {
				onAct = true;
				
				audio_play_sound(sndSelect, 10, false);
				if selection[1] == 0 {
					menu = 3;
					objSoul.visible = false;
					
					chat(selectMonster.myInfo);
				}
				else {
					
					menu = 3;
					objSoul.visible = false;
					
					chat(selectMonster.myActText[selection[1] - 1]);
					if selectMonster.whichAct != -1 && selection[1] == selectMonster.whichAct { selectMonster.rightActs++; }
				}
			}
			
			battle_lists(1); //Manage list selection
			
		} else if menu == 3 { //Used to allow skipping text in battle
			
			//Create a speech bubble (if not on mercy)
			if chatbox != 0 { 
				chatbox.canSkip = true; 
				if global.y || global.m { 
					
					if !chatbox.isWriting && chatbox.canAdvance {
						
						with(chatbox) { scrDestroyChatbox(); }
						chatbox = 0;
						
						if global.monsterNum != -1 {
							
							if onAct {
								#region special cases
								//NONE
								objSoul.visible = true; global.turn = 1; menu = 0;
								#endregion
					
								if selection[1] != 0 && selectMonster.myActDialogue[selection[1] - 1] != "" {
									blub(selectMonster.myActDialogue[selection[1] - 1], selectMonster, bubbleSprite, bubbleDirection);
									blubbed = true;
								}
							
								onAct = false;
							}
							else { objSoul.visible = true; global.turn = 1; menu = 0; }
						
							selection[0] = 0;
							selection[1] = 0;
						}
						
					} //If the chatbox is not writing, and the chatbox canAdvance
				} //If you're pressing Accept or Menu
			} //If the chatbox exists
			
		} //If menu == 3
	} //If turn == 0
	else {
		
		if instance_exists(objMonsterHP) { objMonsterHP.move = 1; }
		
		if !blubbed && global.monsterNum != -1 { 
		
			r1 = irandom(global.monsterNum); //How many to blub
		
			for( var i = 0; i < r1 + 1; i++; ) {
				r2[i] = irandom(global.monsterNum); //Which monsters to blub
				//Which dialogues to choose
				r3[i] = irandom(array_length(currMonster[r2[i]].myDialogue) - 1);
			
				blub(currMonster[r2[i]].myDialogue[r3[i]], currMonster[r2[i]],
					bubbleSprite, bubbleDirection);
			}
		}
		
		blubbed = true;
	}
	
	#endregion

}