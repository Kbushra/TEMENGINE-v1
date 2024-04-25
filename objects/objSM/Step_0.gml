#region Update

if mode == -1 { pos = 0; }
else if mode != 1 { pos = 1; }
else { pos = 2; }

if mode == -1 { selectLimit = 3; }
else if mode == 0 { selectLimit = array_length(keeper.itemBuy) - 1; }
else if mode == 2 { selectLimit = array_length(keeper.topic) - 1; }
else if global.invLength <= 8 { selectLimit = global.invLength - 1; }
else { selectLimit = 7; }

#endregion

#region Movement

if global.uPressed && selection != 0 && selection != 4 { selection--; }
else if global.uPressed && selection == 0 && selectLimit >= 3 { selection = 3; }
else if global.uPressed { selection = selectLimit; }

if global.dPressed && selection != 3 && selection + 1 <= selectLimit { selection++; }
else if global.dPressed && selection <= 3 { selection = 0; }
else if global.dPressed { selection = 4; }

if global.rPressed || global.lPressed {
	
	if selection + 4 <= selectLimit { selection += 4; }
	else if selection > 3 { selection -= 4; }
	else if selectLimit > 3 { selection = selectLimit; }
}

#endregion

#region Functionality

if mode == -1 {
	
	if chatbox == 0 {
		
		chatbox = instance_create_layer(x, y, "Chatbox", objChatbox);
		
		chatbox.x = 20;
		chatbox.y = 140;
		
		chatbox.chatboxOrigin = id;
		
		chatbox.canSkip = false;
		chatbox.canAdvance = false;
	
		chatbox.textToDraw = keeper.welcomeText;
	}
	
	if global.y && selection != 3 { mode = selection; selection = 0; instance_destroy(chatbox); chatbox = 0; transition = true; }
	else if global.y { global.shopkeeper = -1; audio_stop_all(); global.playSong = true; room_goto(global.refRoom); global.friskState = 0; }
}
else if global.n && !talking { selection = mode; pos = 0; mode = -1; instance_destroy(chatbox); chatbox = 0; keeper.currFace = 0; }

if mode == 0 {
	
	if chatbox == 0 {
		
		chatbox = instance_create_layer(x, y, "Chatbox", objChatbox);
		
		chatbox.x = 225;
		chatbox.y = 130;
		
		chatbox.chatboxOrigin = id;
		
		chatbox.canSkip = false;
		chatbox.canAdvance = false;
	
		chatbox.textToDraw = keeper.buyText;
	}
	
	if global.y && global.invFree != -1 && !transition {
		
		if global.gold - keeper.itemPrice[selection] >= 0 {
			
			var index = array_get_index(global.itemID, keeper.itemBuy[selection]);
		
			global.gold -= keeper.itemPrice[selection];
			global.inventory[global.invFree] = index;
			
			audio_play_sound(sndBuy, 11, false);
			
			instance_destroy(chatbox);
	
			chatbox = instance_create_layer(x, y, "Chatbox", objChatbox);
			
			chatbox.x = 225;
			chatbox.y = 130;
			
			chatbox.chatboxOrigin = id;
		
			chatbox.canSkip = false;
			chatbox.canAdvance = false;
			
			chatbox.textToDraw = keeper.itemText[selection];
			
			keeper.currFace = keeper.itemFace[selection];
			keeper.image_index = keeper.currFace * 2;
		}
		else { chatbox.textToDraw = "* Not&enough&gold!"; }
	}
	else if global.y && !transition { chatbox.textToDraw = "* Full&inventory!"; }
	
	transition = false;
}

if mode == 2 {
	
	if chatbox == 0 {
		
		talking = false;
		keeper.currFace = 0;
		keeper.image_index = 0;
		
		chatbox = instance_create_layer(x, y, "Chatbox", objChatbox);
		
		chatbox.x = 225;
		chatbox.y = 130;
		
		chatbox.chatboxOrigin = id;
		
		chatbox.canSkip = false;
		chatbox.canAdvance = false;
		
		chatbox.textToDraw = keeper.talkText;
	}
	
	if global.y && !talking && !transition {
		
		instance_destroy(chatbox);
		
		talking = true;
		
		chatbox = instance_create_layer(x, y, "Chatbox", objChatbox);
		
		chatbox.x = 20;
		chatbox.y = 140;
		
		chatbox.chatboxOrigin = id;
		
		chatbox.canSkip = true;
		chatbox.canAdvance = true;
		
		chatbox.textToDraw = keeper.topicText[selection, 0];
		
		for(var i = 1; i < array_length(keeper.topicText[selection]); i ++) { chatbox.textQueue[i - 1] = keeper.topicText[selection, i]; }
	}
	
	if talking && keeper.currFace != keeper.topicFace[selection, chatbox.page]
	{ keeper.currFace = keeper.topicFace[selection, chatbox.page]; keeper.image_index = keeper.currFace * 2; }
	
	transition = false;
}

if mode == 1 {
	
	if global.invLength == 0 { mode = -1; selection = 1; }
	
	if talking && chatbox == 0 && keeper.refuseText != "" 
	{ talking = false; mode = -1; selection = 1; instance_destroy(chatbox); chatbox = 0; exit; }
	
	if keeper.refuseText != "" && chatbox == 0 {
		
		talking = true;
		
		chatbox = instance_create_layer(x, y, "Chatbox", objChatbox);
		
		chatbox.x = 20;
		chatbox.y = 140;
		
		chatbox.chatboxOrigin = id;
		
		chatbox.canSkip = true;
		chatbox.canAdvance = true;
		
		chatbox.textToDraw = keeper.refuseText;
	}
	
	if global.y && !talking && !transition {
		
		talking = true;
		
		chatbox = instance_create_layer(x, y, "Chatbox", objChatbox);
		
		chatbox.x = 20;
		chatbox.y = 140;
		
		chatbox.chatboxOrigin = id;
		
		chatbox.canSkip = true;
		chatbox.canAdvance = true;
		
		if keeper.sellPrice[global.inventory[selection]] < keeper.lower {
			
			chatbox.textToDraw = keeper.sellText[0];
			keeper.currFace = keeper.sellFace[0];
			keeper.image_index = keeper.currFace * 2;
		}
		else if keeper.sellPrice[global.inventory[selection]] < keeper.upper {
			
			chatbox.textToDraw = keeper.sellText[1];
			keeper.currFace = keeper.sellFace[1];
			keeper.image_index = keeper.currFace * 2;
		}
		else {
			
			chatbox.textToDraw = keeper.sellText[2];
			keeper.currFace = keeper.sellFace[2];
			keeper.image_index = keeper.currFace * 2;
		}
	}
	
	if talking && chatbox == 0 && keeper.refuseText == "" {
		
		global.gold += keeper.sellPrice[global.inventory[selection]];
		
		global.inventory[selection] = 0;
				
		for( var i = 0; i < global.invLength - 1 - selection; i++; ) {
			global.inventory[selection + i] = global.inventory[selection + i + 1];
			global.inventory[selection + i + 1] = 0;
		}
		
		audio_play_sound(sndBuy, 11, false);
		talking = false;
		selection = 0;
		
		keeper.currFace = 0;
		keeper.image_index = 0;
	}
	
	transition = false;
}

#endregion