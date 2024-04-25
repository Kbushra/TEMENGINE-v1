#region Update Properties

//Refresh things if in battle
if room == rmBattle { 
	
	x = objBattleBox.lBorder + 16;
	y = objBattleBox.uBorder + 16;
}

//Update chatbox preset positions
chatboxPosX[0] = camera_get_view_x(view_camera[0]) + 20;
chatboxPosY[0] = camera_get_view_y(view_camera[0]) + 155;
chatboxPosX[1] = camera_get_view_x(view_camera[0]) + 20;
chatboxPosY[1] = camera_get_view_y(view_camera[0]) + 5;

if !writerIndependent {

	//Move to chatbox's proper place
	x = chatboxPosX[chatboxPos];
	y = chatboxPosY[chatboxPos];
}

//Update writing positions
if !writerIndependent { writeX = x + 16 + (monsterID[currMonster].faceWidth * monsterID[currMonster].scale); writeY = y + 12; } 
	else { writeX = x; writeY = y; }

choiceX[0] = (x + 100) - (string_length(choice[0]) * 2) - (string_length(choice[1]) * 2);
choiceX[1] = (x + 190) + (string_length(choice[1])) - ((string_length(choice[0]) * 2) + string_length(choice[0]));

//Update faceX and faceY
faceX = x + 8;
faceY = y + 8;

//Action
if global.chatting != 0 {
	
	yesAction = chatboxOrigin.yesAction;
	noAction = chatboxOrigin.noAction;
}

#endregion

#region NPC sfx

if talking && isWriting && chatboxMode == 0 {
	
	if currentDelay >= textDelay - 5 {
		
		if !audio_is_playing(asset_get_index("snd" + npcName)) { audio_play_sound(asset_get_index("snd" + npcName), 10, true, , npcOffset); }
		npcOffset += 1 / 60;
	}
	else { if audio_is_playing(asset_get_index("snd" + npcName)) { audio_stop_sound(asset_get_index("snd" + npcName)); } }
}
else { if audio_is_playing(asset_get_index("snd" + npcName)) { audio_stop_sound(asset_get_index("snd" + npcName)); } }

#endregion