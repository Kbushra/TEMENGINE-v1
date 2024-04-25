function execute_option_actions(_option) {
	
	if chatboxOrigin.choice { audio_play_sound(sndSelect, 10, false); }
	
	switch(_option) {
						
		case "item":
			
		if global.invFree != -1 { global.inventory[global.invFree] = chatboxOrigin.itemID; }
		break;
							
		case "skipText":
			
		with(chatboxOrigin) { memo = true; chatbox = 0; }
		global.cutscene = -1;
		instance_destroy();
		break;
			
		case "reset":
		game_restart();
		break;
		
		case "crash":
		game_end();
		break;
			
		case "room":
		
		with(chatboxOrigin) { memo = true; chatbox = 0; }
		global.cutscene = -1;
			
		room_goto(chatboxOrigin.roomGoto);
		instance_destroy();
		break;
		
		case "shop":
		
		global.shopkeeper = chatboxOrigin.shopkeeper;
		
		room_goto(rmShop);
		break;
		
		case "save":
		
		show_debug_message("Ini saved");
		
		global.spwnCoords[0] = objFrisk.x;
		global.spwnCoords[1] = objFrisk.y;
		global.spwnName = chatboxOrigin.namer;
		
		ini_all(0);
		
		audio_play_sound(sndSave, 10, false);
		global.hp = global.maxHp;
		break;
		
		default:
		break;
	}
}

function scrItemActions() {
	if global.chatting != 0 && page == choicePage + 1 && once { 
			
		if currChoice == 0 { execute_option_actions(yesAction); }
		if currChoice == 1 { execute_option_actions(noAction); }
	
		once = false;
	}
}