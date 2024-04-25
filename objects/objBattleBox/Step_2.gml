if queuedDmg != 0 {
	audio_play_sound(sndDamage, 10, false);
	global.hp -= queuedDmg;
}