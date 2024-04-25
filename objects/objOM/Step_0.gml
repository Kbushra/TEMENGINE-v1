#region Manage Frisk's States
if !audio_is_playing(global.bgMusic) && global.playSong { 
	
	if !audio_is_paused(global.bgMusic) { global.soundID = audio_play_sound(global.bgMusic, 10, true); }
		else { global.soundID = audio_resume_sound(global.bgMusic); }
}

if audio_is_playing(global.bgMusic) && !global.playSong { audio_pause_sound(global.bgMusic); }

if global.battling || global.shopkeeper != -1 { global.friskState = 2; } //Battle state
	else if global.cutscene != -1 || global.onMenu || global.chatting != 0 || global.delay > 0 || global.doorID != -1 { global.friskState = 1; } //Freeze
		else { global.friskState = 0; } //Normal state

#endregion

#region Flags!

//Stuff
if instance_exists(objItem2) && instance_exists(inst_452B0036) { 
	
	if objItem2.pickedUp[0] && !objItem2.pickedUp[1] { inst_452B0036.activated = true; }
}

#endregion

#region Frisk's Battle Cutscene

//EXCLAMATION MARK
if objFrisk.encountered && objFrisk.dir != "I" && !once[0] { 
	
	audio_stop_all();
	global.playSong = false;
	
	flag[0] = 1;
	
	global.cutscene = objOM;
	
	sndIndex = audio_play_sound(sndEnemy, 10, false); 
	once[0] = true;
}

if sndIndex != -1 {

	if audio_sound_get_track_position(sndIndex) >= 0.7 && !once[1] { 
		
		global.showHeart = true;
		
		flag[0] = 2;
		
		sndIndex = audio_play_sound(sndEncounter, 10, false, , 0.4);
		once[1] = true;
	}
	
	if audio_sound_get_track_position(sndIndex) >= 1.5 {
		
		objFrisk.encountered = false;
		global.battling = true;
		
		global.currSong = sndBattle;
		global.playSong = true;
		audio_play_sound(global.currSong, 10, true); 
		
		sndIndex = -1;
		
		once[0] = false;
		once[1] = false;
		
		objFrisk.visible = false;
		global.friskState = 2;
		
		room_goto(rmBattle);
	}
}

#endregion

if global.showHeart { alpha += 0.1; }
if global.showHeart && alpha > 0.5 { zoom += 0.25; }
if global.showHeart { move += 0.25; }