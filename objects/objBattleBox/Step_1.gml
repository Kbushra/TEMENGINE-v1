//Update variables
lBorder = x - (sprite_width / 2);
rBorder = x + (sprite_width / 2);

uBorder = y - (sprite_height / 2);
dBorder = y + (sprite_height / 2);

//Change during turns
if global.turn == 1 { 
	
	bbWidth = battleWidth;
	bbHeight = battleHeight;
	
	bbX = battleX;
	bbY = battleY;
	
	//Attack
	if objBM.bubble == 0 && !sizeChanging && !change1 {	
		
		if queuedDmg != 0 {
			
			if objSoul.iFramesCounter <= 0 {
			
				audio_play_sound(sndDamage, 10, false);
			
				global.hp -= round(queuedDmg / (round((global.armorDef + global.defense + 10) / 5)));
				objSoul.iFramesCounter = objSoul.iFrames;
			
				queuedDmg = 0;
			
			} else { queuedDmg = 0; }
		}
		if queuedMDmg != 0 {
			
			if objSoul.iFramesCounter <= 0 {
			
				audio_play_sound(sndDamage, 10, false);
			
				global.maxHp -= round(queuedMDmg / (round((global.armorDef + global.defense + 10) / 5)));
				objSoul.iFramesCounter = objSoul.iFrames;
				
				if global.maxHp < global.hp { global.hp = global.maxHp; }
			
				queuedMDmg = 0;
			
			} else { queuedMDmg = 0; }
		}
		
		atkStarted = true;
		currLength --;
		
		if currLength <= 0 {
			
			change_turn();
			
			global.priority = 0;
			
			global.atkChosen[0] = -1;
			global.atkChosen[1] = -1;
			global.atkChosen[2] = -1;
			
			atkLength = 300;
			currLength = 300;
			preventChange = false;
			
			battleWidth = 140;
			battleHeight = 140;
			battleX = 320;
			battleY = 320;
		}
		
		if global.hp <= 0 { global.soulLastX = objSoul.x; global.soulLastY = objSoul.y; global.battling = false; room_goto(rmGameOver); }
	}
	
	if once { change1 = true; once = false; }
	
} else { 
	
	atkStarted = false;
	
	bbWidth = chatWidth;
	bbHeight = chatHeight;
	
	bbX = chatX;
	bbY = chatY;
	
	once = true;
}

#region Everything scale related

if image_xscale == bbWidth / 40 && image_yscale == bbHeight / 40 { sizeChanging = false; }
	else if !preventChange { sizeChanging = true; atkStarted = false; }

//Change size
if change1 {
	image_xscale = lerp(image_xscale, 140 / 40, 0.15);
	image_yscale = lerp(image_yscale, 140 / 40, 0.15);
}
else {
	image_xscale = lerp(image_xscale, bbWidth / 40, 0.15);
	image_yscale = lerp(image_yscale, bbHeight / 40, 0.15);
}

if change1 {
	//Rounding scale... (lerp is weird)
	if 140 / 40 > image_xscale {

		if image_xscale + 0.05 >= 140 / 40 { image_xscale = 140 / 40; }
	
	} else if 140 / 40 < image_xscale 
		{ if image_xscale - 0.05 <= 140 / 40 { image_xscale = 140 / 40; } }

	if 140 / 40 > image_yscale {

		if image_yscale + 0.05 >= 140 / 40 { image_xscale = 140 / 40; }

	} else if 140 / 40 < image_yscale 
		{ if image_yscale - 0.05 <= 140 / 40 { image_xscale = 140 / 40; } }
}
else {
	//Rounding scale... (lerp is weird)
	if bbWidth / 40 > image_xscale {

		if image_xscale + 0.05 >= bbWidth / 40 { image_xscale = bbWidth / 40; }
	
	} else if bbWidth / 40 < image_xscale 
		{ if image_xscale - 0.05 <= bbWidth / 40 { image_xscale = bbWidth / 40; } }

	if bbWidth / 40 > image_yscale {

		if image_yscale + 0.05 >= bbWidth / 40 { image_xscale = bbWidth / 40; }

	} else if bbWidth / 40 < image_yscale 
		{ if image_yscale - 0.05 <= bbWidth / 40 { image_xscale = bbWidth / 40; } }
}
#endregion

if change1 {
	
	//Change position
	x = lerp(x, 320, 0.15);
	y = lerp(y, 320, 0.15);
	
} else {
	
	//Change position
	x = lerp(x, bbX, 0.15);
	y = lerp(y, bbY, 0.15);
}

if change1 && x == 320 && image_xscale == 140 / 40 && objBM.bubble == 0 
{ change1 = false; }