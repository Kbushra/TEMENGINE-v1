if memo { flag ++; memo = false; wait = 30; }

//Cutscene
if flag == 1 {
    objFrisk.dir = "U";

    wait --;
    if wait <= 0 && chatbox == 0 { 

        chatboxPos = 1;
		writerIndependent = false;
		
        chatbox = instance_create_layer(x, y, "Chatbox", objChatbox); 
        chatbox.chatboxOrigin = id;
        chatbox.textToDraw = "/1_5 * Whats going on?";
    }
}

if flag == 2 {
	
	global.playSong = true;

    wait --;
    charaY -= 0.6;
    charaFrame -= 1 / 60;
    if wait <= 0 { flag ++; objFrisk.dir = "U"; wait = 60; }
}

if flag == 3 { 
	
    wait --;
    charaY -= 0.6;
    charaFrame -= 1 / 60;
    if wait <= 0 { flag ++; objFrisk.dir = "U"; wait = 60; }
}

if flag == 4 { 

    wait --;
    if wait <= 0 && chatbox == 0 {

        chatboxPos = 0;
		writerIndependent = false;
		
        chatbox = instance_create_layer(x, y, "Chatbox", objChatbox); 
        chatbox.chatboxOrigin = id;
        chatbox.textToDraw = "/1_1 * 'Undertem for newbies'&... LET ME SEE!";
        chatbox.textQueue[0] = "/2_0 * No.";
    }
}

if flag == 5 { 

    wait --;
	
	if wait > -30 && wait < 0 { cam_shake(3); }
	
    if wait <= 0 && chatbox == 0 {
	
		global.playSong = false;
		
        chatboxPos = 0;
		writerIndependent = false;
		
        chatbox = instance_create_layer(x, y, "Chatbox", objChatbox); 
        chatbox.chatboxOrigin = id;
        chatbox.textToDraw = "/1_0 * ...";
    }
}

if flag == 6 { wait --; if wait <= 0 { cam_flash(c_black, 1, 5, id); wait = 999; } }

if flag == 7 { 
	
	cutscene_end();
	
	global.playSong = true;
	
	instance_destroy();
}