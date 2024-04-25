#region Time

if !once {
	
	minutes = floor(global.gameTime / 60);
	seconds = floor(global.gameTime) - (minutes * 60);

	once = true;
}

#endregion

#region Changing hub

if !audio_is_playing(sndStartMenu) { audio_stop_all(); sndID = audio_play_sound(sndStartMenu, 10, false); }

incorrectPos[0] = audio_sound_get_track_position(sndID) >= 63 || audio_sound_get_track_position(sndID) < 31;

if global.hubStage == 0 && incorrectPos[0]
{ audio_sound_set_track_position(sndID, 32); }

#endregion

#region Movement

if global.lPressed || global.rPressed { selection = !selection; }

if global.y && selection == 0 { room_goto(rmStart); objGM.memo = true; audio_stop_all(); ini_all(1); }
if global.y && selection == 1 {
	
	global.gameTime = 0;
	
	global.flag[0] = false;
	global.flag[1] = false;
	global.flag[2] = false;
	
	global.spwnRoom = rmIntro;
	global.spwnName = "The Void";
	global.spwnCoords[0] = 780;
	global.spwnCoords[1] = 120;
	
	global.hubStage = 0;
	
	for( var i = 0; i < global.cutsceneNum; i++; ) 
	{ global.cutsceneDone[i] = false; }
	
	global.prevLove = 1;
	global.love = 1;
	global.exp = 0;
	global.gold = 0;
	global.weapon = 1;
	global.armor = 3;
	global.name = "";
	
	pauseVolume = 100;
	speedSelect = "DEFAULT";
	noHit = "FALSE";
	
	ini_all(0);
	game_restart();
}

#endregion