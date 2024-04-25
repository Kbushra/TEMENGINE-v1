if memo { flag ++; memo = false; wait = 30; }

//Cutscene
if flag == 1 {
    wait --;
    if wait <= 0 && chatbox == 0 { 

        chatboxPos = 0;
		writerIndependent = false;
		
        chatbox = instance_create_layer(x, y, "Chatbox", objChatbox); 
        chatbox.chatboxOrigin = id;
        chatbox.textToDraw = "/2_0 * Hello?";
		wait = 120;
    }
}

if flag == 2 {
	
    if !audio_is_playing(sndScare) { audio_play_sound(sndTemmieVillage, 10, true); }
    
    wait --;
    if wait <= 0 { flag ++; wait = 120; }
}

if flag == 3 { 

    wait --;
    if wait <= 0 && chatbox == 0 {

        chatboxPos = 0;
		writerIndependent = false;
		
        chatbox = instance_create_layer(x, y, "Chatbox", objChatbox); 
        chatbox.chatboxOrigin = id;
        chatbox.textToDraw = "/2_0 * WHAT THE HELL IS&HAPPENING";
    }
}

if flag == 4 { 

    wait --;
    if wait <= 0 && chatbox == 0 {

        chatboxPos = 0;
		writerIndependent = false;
		
        chatbox = instance_create_layer(x, y, "Chatbox", objChatbox); 
        chatbox.chatboxOrigin = id;
        chatbox.textToDraw = "/1_0 * HOI HOI HOI HOI HOI HOI HOI&HOI HOI HOI HOI HOI HOI HOI&HOI HOI HOI HOI HOI HOI HOI&HOI HOI HOI HOI HOI HOI HOI&HOI HOI HOI HOI HOI HOI HOI&";
        wait = 30;
    }
}

if flag == 5 {
	
	cutscene_end();
	audio_stop_sound(sndTemmieVillage);
	
	global.playSong = false;
	
	wait --;
	if wait <= 0 { flag ++; wait = 9999999999999999; }
}

if flag == 6 {
	
	objChara.image_index = 0;
	objChara.image_speed = 0;
	
	global.friskState = 0;
    
    instance_destroy();
}