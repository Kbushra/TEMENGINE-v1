function scrDestroyChatbox() {
	
	with(chatboxOrigin) { memo = true; chatbox = 0; }
	
	if global.chatting != 0 { 
			
		if chatboxOrigin.yesAction == "item" || chatboxOrigin.noAction == "item"
			{ chatboxOrigin.urMom.pickedUp[chatboxOrigin.urDad] = true; }
			
		chatboxOrigin.times --;
			
		if chatboxOrigin.flag != -1 { global.flag[chatboxOrigin.flag] = !global.flag[chatboxOrigin.flag]; }
		global.friskState = 0;
	}
	
	if closeMenu { audio_resume_all(); closeMenu = false; }
	
	if endBattle { 
			
		global.battling = false;
		global.playSong = true;
		global.friskState = 0;
							
		audio_stop_all();
		room_goto(global.refRoom);
	}
	
	instance_destroy();
}