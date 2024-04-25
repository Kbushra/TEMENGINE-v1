function end_battle() { //Shortener for ending battles (what did you expect)
	
	global.battling = false;
	global.playSong = true;
	
	global.friskState = 0;
	
	audio_stop_all();
	room_goto(global.refRoom);
}

function battle_lists(_mode, _limit = -1) { //Shortener for battle lists (duh)
	
	var invLengthP1 = global.invLength;
	if invLengthP1 > 4 { var invLengthP2 = invLengthP1 - 4; invLengthP1 = 4; }
		else { var invLengthP2 = 0; }
	if invLengthP2 > 4 { invLengthP2 = 4; }
	
	if _mode == 0 { //If mode == 0 (so, if this is a vertical menu)
		
		if _limit == -1 { //If there's no defined limit, use selectLimit
			
			selectMonster = currMonster[selection[0]];
			
			objSoul.x = namePos[0, selection[0]];
			objSoul.y = namePos[1, selection[0]];
				
			if global.dPressed { if selection[0] < selectLimit[0] { selection[0] ++; } 
				else { selection[0] = 0; } }
			
			if global.uPressed { if selection[0] > 0 { selection[0] --; } 
				else { selection[0] = selectLimit[0]; } }
				
		} else { //If there IS a defined limit then use it
			
			objSoul.x = namePos[0, selection[0]];
			objSoul.y = namePos[1, selection[0]];
				
			if global.dPressed { if selection[0] < _limit { selection[0] ++; } else { selection[0] = 0; } }
			if global.uPressed { if selection[0] > 0 { selection[0] --; } else { selection[0] = _limit; } }
		}
		
	} else if _mode == 1 { //If this is the act menu
		
		objSoul.x = itemPos[0, selection[1]];
		objSoul.y = itemPos[1, selection[1]];
		
		if global.rPressed && selection[1] == 0 && selectMonster.myAct[0] != "" { selection[1] = 1; }
		else if global.rPressed && selection[1] == 1 { selection[1] = 0; }
		else if global.rPressed && selection[1] == 2 && selectMonster.myAct[2] != "" { selection[1] = 3; }
		else if global.rPressed && selection[1] == 3 { selection[1] = 2; }
			
		if global.lPressed && selection[1] == 1 { selection[1] = 0; }
		else if global.lPressed && selection[1] == 0 && selectMonster.myAct[0] != "" { selection[1] = 1; }
		else if global.lPressed && selection[1] == 3 { selection[1] = 2; }
		else if global.lPressed && selection[1] == 2 && selectMonster.myAct[2] != "" { selection[1] = 3; }
			
		if global.dPressed && selection[1] == 0 && selectMonster.myAct[1] != "" { selection[1] = 2; }
		else if global.dPressed && selection[1] == 2 { selection[1] = 0; }
		else if global.dPressed && selection[1] == 1 && selectMonster.myAct[2] != "" { selection[1] = 3; }
		else if global.dPressed && selection[1] == 3 { selection[1] = 1; }
			
		if global.uPressed && selection[1] == 2 { selection[1] = 0; }
		else if global.uPressed && selection[1] == 0 && selectMonster.myAct[1] != "" { selection[1] = 2; }
		else if global.uPressed && selection[1] == 3 { selection[1] = 1; }
		else if global.uPressed && selection[1] == 1 && selectMonster.myAct[2] != "" { selection[1] = 3; }
		
	} else { //If this is the item menu...
		
		objSoul.x = itemPos[0, selection[1]];
		objSoul.y = itemPos[1, selection[1]];
		
		if global.rPressed && selection[1] == 0 && selectLimit[1] > 0 { selection[1] = 1; }
		else if global.rPressed && selection[1] == 1 
			{ if page == 0 && invLengthP2 != 0 { page ++; selection[1] = 0; } }
		else if global.rPressed && selection[1] == 2 && selectLimit[1] > 1 { selection[1] = 3; }
		else if global.rPressed && selection[1] == 3 {
			if page == 0 && invLengthP2 > 2 { page ++; selection[1] = 2; }
			else if page == 0 && invLengthP2 != 0 { page ++; selection[1] = 0; }
		}
			
		if global.lPressed && selection[1] == 1 { selection[1] = 0; }
		else if global.lPressed && selection[1] == 0
			{ if page == 1 { page --; selection[1] = 1;  } }
		else if global.lPressed && selection[1] == 3 { selection[1] = 2; }
		else if global.lPressed && selection[1] == 2 
			{ if page == 1 { page --; selection[1] = 3; } }
			
		if global.dPressed && selection[1] == 0 && selectLimit[1] > 1 { selection[1] = 2; }
		else if global.dPressed && selection[1] == 2 { selection[1] = 0; }
		else if global.dPressed && selection[1] == 1 && selectLimit[1] > 2 { selection[1] = 3; }
		else if global.dPressed && selection[1] == 3 { selection[1] = 1; }
			
		if global.uPressed && selection[1] == 2 { selection[1] = 0; }
		else if global.uPressed && selection[1] == 0 && selectLimit[1] > 1 { selection[1] = 2; }
		else if global.uPressed && selection[1] == 3 { selection[1] = 1; }
		else if global.uPressed && selection[1] == 1 && selectLimit[1] > 2 { selection[1] = 3; }
		
	}
}

function monster_out(_monster, _action) { //Shortener for getting monsters out of battle
	
	if currMonster[_monster.order] != -1 { //If the monster exists, and is in battle...
		
		if _action = "killed" { //If you killed the monster
			
			//Get monster's gold and exp
			expGained += _monster.myEXP;
			goldGained += _monster.myGold;
									
			layer_sequence_destroy(_monster.mySequence); //Remove sprite
			_monster.reqSequence = -1;
			currMonster[_monster.order].inactive = true;
			currMonster[_monster.order] = -1; //Indicate the monster's out (again, dodgy code was inevitable)
			
			//Decrease the amount of monsters, and reorder them
			global.monsterNum--;
			reorder_monsters();
		
		}
		
		else if _action = "spared" { //If you spared the monster
			
			if currMonster[_monster.order] != -1 && currMonster[_monster.order].spareable {
				//Get monster's gold
				goldGained += _monster.myGold;
			
				layer_sequence_destroy(_monster.mySequence); //Destroy it's normal sprite
				_monster.reqSequence = -1;
				monsterOut[_monster.spriteOrder] = currMonster[_monster.order]; //Indicate the monster's out
				currMonster[_monster.order].inactive = true;
				currMonster[_monster.order] = -1; //Indicate the monster's out (again, dodgy code was inevitable)
				
				//Decrease the amount of monsters
				global.monsterNum --;
			}
		}
		
		else if _action = "fled" { //If the monster fled
			
			layer_sequence_destroy(_monster.mySequence); //Destroy it's normal sprite
			_monster.reqSequence = -1;
			monsterOut[_monster.spriteOrder] = currMonster[_monster.order]; //Indicate the monster's out
			currMonster[_monster.order].inactive = true;
			currMonster[_monster.order] = -1; //Indicate the monster's out (again, dodgy code was inevitable)
			
			//Decrease the amount of monsters, and reorder them
			global.monsterNum --;
			reorder_monsters();
		}
	}	
}

function draw_battle_menu_items(_menu = 0) {
	
	var invLengthP1 = global.invLength;
	if invLengthP1 > 4 { var invLengthP2 = invLengthP1 - 4; invLengthP1 = 4; }
		else { var invLengthP2 = 0; }
	if invLengthP2 > 4 { invLengthP2 = 4; }
	
	if _menu == 0 { //If menu is equal to 0 (so we're drawing menu 1 in objBM)...
	
		switch(currButton) { //Do something for every single possible value that currButton can have

			case 0:
		
			//Yellow name if spareable
			if currMonster[0].spareable { draw_set_color(c_yellow); }
		
			draw_text_transformed(68, 266, "* " + currMonster[0].myName, 2, 2, 0);
		
			draw_set_color(c_white);
			
			if global.monsterNum > 0 { 
			
				if currMonster[1].spareable { draw_set_color(c_yellow); }
				draw_text_transformed(68, 302, "* " + currMonster[1].myName, 2, 2, 0); 
			
				draw_set_color(c_white);
			}
			
			if global.monsterNum > 1 { 
			
				if currMonster[2].spareable { draw_set_color(c_yellow); }
			
				draw_text_transformed(68, 338, "* " + currMonster[2].myName, 2, 2, 0); 
			}
		
			draw_set_color(c_white);
			break;
		
			case 1:
		
			//Yellow name if spareable
			if currMonster[0].spareable { draw_set_color(c_yellow); }
		
			draw_text_transformed(68, 266, "* " + currMonster[0].myName, 2, 2, 0);
		
			draw_set_color(c_white);
			
			if global.monsterNum > 0 { 
			
				if currMonster[1].spareable { draw_set_color(c_yellow); }
				draw_text_transformed(68, 302, "* " + currMonster[1].myName, 2, 2, 0); 
			
				draw_set_color(c_white);
			}
			
			if global.monsterNum > 1 { 
			
				if currMonster[2].spareable { draw_set_color(c_yellow); }
			
				draw_text_transformed(68, 338, "* " + currMonster[2].myName, 2, 2, 0); 
			}
		
			draw_set_color(c_white);
			break;
		
			case 2:
			
			draw_set_valign(fa_middle);
			draw_set_halign(fa_left);
			
			if page == 0 {
			
				for(var i = 0; i < invLengthP1; i ++) {
				
					if global.itemID[global.inventory[i]] != objItem0 {
				
						draw_text_transformed(itemPos[0, i] + 18, itemPos[1, i],
							"* " + global.itemID[global.inventory[i]].myName, 2, 2, 0);
					
					}
				}
				draw_text_transformed(itemPos[0, 3] + 18, itemPos[1, 3] + 40, "PAGE 1", 2, 2, 0);
				
			} else {
				
				for(var i = 0; i < invLengthP2; i ++) {
				
					if global.itemID[global.inventory[i + 4]] != objItem0 {
						
						draw_text_transformed(itemPos[0, i] + 18, itemPos[1, i],
							"* " + global.itemID[global.inventory[i + 4]].myName, 2, 2, 0);
					
					}
				}
				draw_text_transformed(itemPos[0, 3] + 18, itemPos[1, 3] + 40, "PAGE 2", 2, 2, 0);
			}
			draw_set_valign(fa_top);
			draw_set_halign(fa_left);
			break;
		
			case 3:
			
			if currMonster[0].spareable { draw_set_color(c_yellow); }
			if global.monsterNum > 0 && currMonster[1].spareable { draw_set_color(c_yellow); }
			if global.monsterNum > 1 && currMonster[2].spareable { draw_set_color(c_yellow); }
			
			if global.monsterNum != -1 && soulSprite == -1 {
			
				draw_text_transformed(68, 266, "* Spare", 2, 2, 0);
				draw_set_color(c_white);
				
				draw_text_transformed(68, 302, "* Flee", 2, 2, 0);
			}
			
			draw_set_color(c_white);
			break;
		} //Do something for every single possible value that currButton can have
		
	} else { //If menu ISN'T equal to 0
		
		draw_text_transformed(68, 266, "* Check", 2, 2, 0);
		if selectMonster.myAct[0] != 0 { draw_text_transformed(320, 266, selectMonster.myAct[0], 2, 2, 0); }
		if selectMonster.myAct[1] != 0 { draw_text_transformed(68, 302, selectMonster.myAct[1], 2, 2, 0); }
		if selectMonster.myAct[2] != 0 { draw_text_transformed(320, 302, selectMonster.myAct[2], 2, 2, 0); }
	}
}

function get_random_line(_targetMonster, _monsterAmount) {
	
	var randomLine = irandom(array_length(currMonster[_targetMonster].myFlavorText[_monsterAmount]) - 1);
	chatbox.textToDraw = currMonster[_targetMonster].myFlavorText[_monsterAmount, randomLine];
	currText = currMonster[_targetMonster].myFlavorText[_monsterAmount, randomLine];
}

function battle_message_spawn() {
	
	if chatbox == 0 && currMonster[0] != -1 {
	
		chatbox = instance_create_layer(x, y, "Chatbox", objChatbox);
		
		chatbox.chatboxOrigin = id;
		chatbox.canSkip = false;
		
		if global.turnNum == 0 {
			if global.monsterNum == 2 {
			
				if currMonster[0].myID == currMonster[1].myID && currMonster[1].myID == currMonster[2].myID {
			
					chatbox.textToDraw = currMonster[0].myIntroText[2];
					currText = currMonster[0].myIntroText[2];
			
				} else {
				
					chatbox.textToDraw = $"* {currMonster[0].myName}, {currMonster[1].myName} and {currMonster[2].myName}&attacked!";
					currText = $"* {currMonster[0].myName}, {currMonster[1].myName} and {currMonster[2].myName}&attacked!";
				}
				
			} else if global.monsterNum == 1 {
			
				if currMonster[0].myID == currMonster[1].myID {
			
					chatbox.textToDraw = currMonster[0].myIntroText[1];
					currText = currMonster[0].myIntroText[1];
				
				} else {
				
					chatbox.textToDraw = $"* {currMonster[0].myName} and {currMonster[1].myName}&came close!";
					currText = $"* {currMonster[0].myName} and {currMonster[1].myName}&came close!";
				}
			
			} else if global.monsterNum == 0 {
			
				chatbox.textToDraw = currMonster[0].myIntroText[0];
				currText = currMonster[0].myIntroText[0];
			}
			
		} else {
			
			var r1 = irandom(global.monsterNum);
			
			if global.monsterNum == 2 && currMonster[0].myID == currMonster[1].myID && currMonster[1].myID == currMonster[2].myID { get_random_line(0, 2); }
			else if r1 == 0 && global.monsterNum > 0 {
				
				if global.monsterNum == 2 { if currMonster[0].myID == currMonster[1].myID || currMonster[0].myID == currMonster[2].myID { get_random_line(0, 1); } else { get_random_line(0, 0); } }
				if global.monsterNum == 1 { if currMonster[0].myID == currMonster[1].myID { get_random_line(0, 1); } else { get_random_line(0, 0); } }
			}
			else if global.monsterNum == 2 {
				
				if currMonster[1].myID == currMonster[2].myID { get_random_line(1, 1); }
				else { get_random_line(r1, 0); }
				
			} else { get_random_line(r1, 0); }
		}
	}
}

function warn(xpos = objBattleBox.x, ypos = objBattleBox.y, xscale = objBattleBox.image_xscale * 2, yscale = objBattleBox.image_yscale * 2, warnInst = -1, returnExclamation = false, exclamationInst = -1) { 
	if warnInst == -1 { var warner = layer_sprite_create("Warns", xpos, ypos, sprWarn); }
	else { var warner = warnInst; }
	
	if exclamationInst == -1 && returnExclamation { var exclamation = layer_sprite_create("Warns", xpos, ypos, sprExclamation); }
	else if returnExclamation { var exclamation = exclamationInst; }
	
	layer_sprite_xscale(warner, xscale);
	layer_sprite_yscale(warner, yscale);
	
	if returnExclamation {
		
		layer_sprite_xscale(exclamation, min(xscale, yscale));
		layer_sprite_yscale(exclamation, min(xscale, yscale));
	} 
	
	if returnExclamation && exclamationInst == -1 { return exclamation; }
	if warnInst == -1 { return warner; }
	return -1;
}

function warnArrow(xpos = objBattleBox.x, ypos = objBattleBox.y, xscale = 1, yscale = 1, dir = 0, inst = -1) {
	//NOTE: Due to modifying xpos and ypos, set them to the position of warner
	var arrowXpos = xpos;
	var arrowYpos = ypos;
	var arrowAngle = 0;
	
	//Arrow -1 is none, dir 0 is right, dir 1 is up, dir 2 is left, dir 3 is down
	if dir == 0 { arrowXpos = xpos + 10; }
	if dir == 1 { arrowYpos = ypos - 10; arrowAngle = 90; }
	if dir == 2 { arrowXpos = xpos - 10; arrowAngle = 180; }
	if dir == 3 { arrowYpos = ypos + 10; arrowAngle = 270; }
		
	if inst == -1 { var arrow = layer_sprite_create("Warns", arrowXpos, arrowYpos, sprArrow); }
	else { var arrow = inst; }
	layer_sprite_xscale(arrow, xscale);
	layer_sprite_yscale(arrow, yscale);
	layer_sprite_angle(arrow, arrowAngle);
	
	if inst == -1 { return arrow; }
	return -1;
}

function change_turn() {
		
	global.turn = !global.turn;
	global.turnNum ++;
}