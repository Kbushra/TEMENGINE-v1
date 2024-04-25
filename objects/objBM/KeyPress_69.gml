/// @description Debug
if global.battling && global.debug {
	
	audio_stop_all();
	
	objSoul.visible = false;
	global.friskState = 0;
	
	room_goto(rmMovement);
}