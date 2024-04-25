if activated {
	if global.y && !global.onMenu {
			
		if chatbox == 0 {
				
			global.chatting = id;
			
			if freeze { global.itemFreeze = true; }
			chatbox = instance_create_layer(x, y, "Chatbox", objChatbox);
			chatbox.chatboxOrigin = global.chatting;
			chatbox.choicePage = choicePage;
			chatbox.textToDraw = myMessage[0];
			
			if choice { chatbox.choice[0] = myChoice[0]; chatbox.choice[1] = myChoice[1]; }
			
			for(var i = 1; i < array_length(myMessage); i ++) { chatbox.textQueue[i - 1] = myMessage[i]; }
			
				
		}
	}
}