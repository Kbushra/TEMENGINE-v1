if memo { flag ++; memo = false; wait = 30; }

//Cutscene
if flag == 1 {
	
	objFrisk.dir = "D";
	
	wait --;
	if wait <= 0 && chatbox == 0 { 
		
		chatboxPos = 0;
		writerIndependent = false;
		
		chatbox = instance_create_layer(x, y, "Chatbox", objChatbox); 
		chatbox.chatboxOrigin = id;
		chatbox.textToDraw = "/1_3 * Where do you think& you're going?";
	}
}

if flag == 2 {
	
	cam_shake(1);
	
	global.playSong = false;
	if !audio_is_playing(sndScare) { audio_play_sound(sndScare, 10, false); }
	
	wait --;
	charaY += 1;
	charaFrame += 6 / 60;
	if wait <= 0 { flag ++; objFrisk.dir = "R"; wait = 60; }
}

if flag == 3 { 
	
	cam_shake(1);
	
	charaY += 1;
	charaFrame += 6 / 60;
	
	wait --;	
	if wait <= 0 { flag ++; objFrisk.dir = "U"; wait = 60; }
}

if flag == 4 { 
	
	wait --;
	
	camera_set_view_target(view_camera[0], objFrisk);
	global.shaking = false;
	
	audio_stop_sound(sndScare);
	global.playSong = true;
	
	if wait <= 0 && chatbox == 0 {
		
		chatboxPos = 1;
		writerIndependent = false;
		
		chatbox = instance_create_layer(x, y, "Chatbox", objChatbox); 
		chatbox.chatboxOrigin = id;
		chatbox.textToDraw = "/1_4 * That part of the& game's not finished!";
		chatbox.textQueue[0] = "/2_0 * You... scared me...";
		chatbox.textQueue[1] = "/1_5 * I know.";
	}
}

if flag == 5 { wait --; if wait <= 0 { cam_flash(c_black, 1, 10, id); wait = 999; } }

if flag == 6 { 
	
	cutscene_end(); 
	
	global.playSong = true;
	
	instance_destroy();
}