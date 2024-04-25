function cam_flash(_color, _amount, _hold, _target, _playSound = true) {
	
	with(instance_create_layer(0, 0, "Effects", objEffects)) {
		
		amount = _amount;
		hold = _hold;
		target = _target;
		playSound = _playSound;
		image_blend = _color;
	}
}

function cam_shake(_intensity) {
	
	camera_set_view_target(view_camera[0], 0);
	camera_set_view_pos(view_camera[0], global.pastCamX + random_range(-_intensity, _intensity), global.pastCamY + random_range(-_intensity, _intensity));
	global.shaking = true;
}

function shudder(_error, _original, _obj = undefined, _mode = -1) { //MODE: 0 = x, 1 = y, 2 = random
	
	var chosenError = random_range(-_error, _error);
	
	if _obj != undefined {
		
		if _mode == 2 { _mode = choose(0, 1);  }
		if _mode == 0 {_obj.x = _original + chosenError; }
		else if _mode == 1 { _obj.y = _original + chosenError; }
	}
	
	return chosenError;
}