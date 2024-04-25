global.cutscene = objIntro;

pause--;
if pause <= 0 && image_index < 6 {
	
	if chatbox == 0 {
		
		image_index = 1;
		
		chatbox = instance_create_layer(x, y, "Chatbox", objChatbox);
		
		chatbox.x = 30;
		chatbox.y = 150;
		
		chatbox.chatboxOrigin = id;
		
		chatbox.canSkip = false;
		chatbox.canAdvance = false;
		chatbox.cutscenePrevent = true;
	
		chatbox.textToDraw = "@2 * Once upon a time, humans and&monsters lived in harmony.";
		chatbox.textQueue[0] = "@2 * Until a war broke out...";
		chatbox.textQueue[1] = "@2 * They sealed the monsters with&a magic spell";
		chatbox.textQueue[2] = "@2 * And the tems were locked in&the mountains... until one&day.";
		chatbox.textQueue[3] = "@2 * A human came by...";
	}
	
	if pause == -480 { fade = true; pause = 20; } //Delay between 1 image to another
}
else if pause <= 0 { pause = 480; fade = true; } //Delay for the non chatbox part

if fade {
	
	image_alpha -= 0.05; //20 frame fade
	
	if image_alpha <= 0 {
		
			image_index ++;
			fade = false;
			if chatbox != 0 { chatbox.cutscenePrevent = false; chatbox.isWriting = false; }
	}
}
else { image_alpha += 0.05; if image_alpha >= 1 { image_alpha = 1; } }

if image_index == 8 { if y == 0 { y = -100; } if y < 0 { y += 1.0001; } }
if image_index == 9 { audio_sound_gain(sndIntro, 0, 6000); }
if image_index >= 11 {
	
	global.cutscene = -1;
	audio_stop_all();
	
	instance_create_layer(0, 0, "Instances", objTitle);
	instance_destroy();
}