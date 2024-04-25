/// @description Starting game and moving between menus

#region Generic

if selection <= 25 { selectChar = char[selection]; }
else if selection < 100 { selectChar = string_lower(char[selection - 28]); }

if global.y && menu == 0 { menu++; selection = 0; }
else if global.y && menu == 2 && selection == 1 { menu++; }
else if global.y && menu == 2 { menu--; scale = 2; allowed = true; }
else if global.y && selection < 100 && string_length(global.name) < 6 { global.name = string_insert(selectChar, global.name, string_length(global.name) + 1); }

if global.y && selection == 100 { game_end(); }
else if global.y && selection == 101 && string_length(global.name) > 0 { global.name = string_delete(global.name, string_length(global.name), 1); }
else if global.n && string_length(global.name) > 0 && menu == 1 { global.name = string_delete(global.name, string_length(global.name), 1); }
else if global.y && selection == 102 && string_length(global.name) > 0 { menu++; selection = 0; }

wait++;

if sndID == 0 { sndID = audio_play_sound(sndStartMenu, 10, false); }
if audio_sound_get_track_position(sndID) >= 31 && menu < 3 { audio_sound_set_track_position(sndID, 0); }

#endregion

#region Movement

var upAllow = selection - 7 != 26 && selection - 7 != 27;

var downAllow = selection + 7 != 26 && selection + 7 != 27;
var downAllow2 = selection + 7 != 54 && selection + 7 != 55;

if menu < 3 {
	
	if global.uPressed && selection >= 7 {
	
		if selection >= 100 { selection = 53; }
		else if upAllow { selection -= 7; }
		else { selection = 25; }
	}
	if global.dPressed {
	
		if selection <= 48 {
			if downAllow && downAllow2 { selection += 7; }
			else if downAllow { selection = 53; }
			else { selection = 25; }
		}
		else { selection = 100; }
	}
	
	if global.lPressed && selection % 7 != 0 { selection--; }
	if menu < 2 { if global.rPressed && selection % 7 != 6 && selection != 25 && selection != 53 { selection++; } }
	else if global.rPressed && selection == 0 && allowed { selection = 1; }
}

#endregion

#region Start game

if menu >= 3 {
	
	continueX = lerp(continueX, 270, 0.075);
	continueY = lerp(continueY, 220, 0.075);
	
	continueAlpha -= 1/60;
	
	if !once { cam_flash(c_white, 0.003, 0, id, false); once = true; }
	
	if !audio_is_playing(sndIntroTransition) { sndID = audio_play_sound(sndIntroTransition, 10, false); audio_stop_sound(sndStartMenu); }
	if audio_sound_get_track_position(sndID) > 5.5 { audio_pause_sound(sndIntroTransition); }
	
	if halfMemo {
		
		instance_destroy(objEffects);
		
		global.spwnRoom = rmMovement;
	
		ini_open("TEMENGINE.ini");
		ini_write_string("Places", "Spawn room", room_get_name(global.spwnRoom));
		ini_close();
		
		ini_open("TEMENGINE.ini");
		ini_write_string("Stats", "Name", global.name);
		ini_close();

		room_goto(rmStart);
		objGM.memo = true;
		audio_stop_all();
	}
}

#endregion