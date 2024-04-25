global.cutscene = objGameOver;

wait --;

if wait <= 0 {
	
	if !audio_is_playing(sndGameOver) { audio_play_sound(sndGameOver, 10, true); audio_sound_gain(sndGameOver, 1, 0); }
	
	image_alpha += 0.01;

	if image_alpha >= 1 {
		
		image_alpha = 1;
		
		if !finish {
			
			chatbox = instance_create_layer(x, y, "Chatbox", objChatbox);
			
			chatbox.x = 165;
			chatbox.y = 360;
			
			chatbox.chatboxOrigin = id;
	
			chatbox.textToDraw = "You cannot give up&just yet.";
			chatbox.textQueue[0] = choose($"I know you can&do better, {global.name}.", $"  Come on, {global.name}!");
			chatbox.textQueue[1] = "  Stay determined!";
			
			finish = true;
		}
	}

	if chatbox == 0 && finish { image_alpha -= 0.02; audio_sound_gain(sndGameOver, 0, 800); }
	
	if image_alpha <= -1 { global.memo = true; game_restart(); }
}