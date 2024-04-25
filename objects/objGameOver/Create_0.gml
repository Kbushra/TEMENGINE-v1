audio_stop_all();

layer_sequence_create("Heart", global.soulLastX, global.soulLastY, sqDeath);
audio_play_sound(sndDeath, 10, false);

wait = 120;

chatbox = 0;
finish = false;