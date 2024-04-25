global.delay --;

if collision_rectangle(x - 2, y - 2, x + sprite_width + 2, y + sprite_height + 2, objFrisk, false, true) && global.delay <= 0 && cutscene != noone {
	
	if !collided { //You can only collide for one frame
		
		//Execute Cutscene
		instance_create_layer(0, 0, "Managers", cutscene);
		
		if freeze { global.friskState = 1; } //Freeze player if told to
		
		collided = true;
		
		if !loop { instance_destroy(); }
	}
} else { collided = false; }