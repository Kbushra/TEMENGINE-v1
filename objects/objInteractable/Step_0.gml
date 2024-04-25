depth = -bbox_bottom;

if activated {
	
	if isSolid { solid = true; }
	image_alpha = 1;
	
	with(objFrisk) { //<3
		
		if dir == "R" || dir == "L" {
			
			other.facingDirection = place_meeting(x + (get_num(objFrisk.dir) * 10), y, other);
		
		} else {
		
			other.facingDirection = place_meeting(x, y + (get_num(objFrisk.dir) * 10), other);
		}
	}

	if collision_rectangle(x - 1, y - 1, x + sprite_width + 1, y + sprite_height + 1, objFrisk, false, true) && facingDirection {
		
		if global.y && !global.onMenu && !objFrisk.encountered && !instance_exists(objChatbox) {
			
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
	
	} else { chatbox = 0; }

	if memo { global.chatting = 0; global.itemFreeze = false; memo = false; }

	if times == 0 { instance_destroy(); }

} else { solid = false; image_alpha = 0; }