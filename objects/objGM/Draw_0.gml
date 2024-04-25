if global.onPause { 
	
	set_up_text(fntMenu, c_white, fa_left, fa_top, 1);
	
	if pauseMenu == 0 {
	
		draw_text_transformed(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 16, 
			"PAUSED", 2, 2, 0);
	
		draw_set_font(fntUndertale);
	
		if pauseSelect == 0 { draw_set_color(c_yellow); }
		draw_text(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 64, "Options");
	
		if pauseSelect == 1 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 80, "Controls");
	
		if pauseSelect == 2 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 112, "Back to title");
		
		if pauseSelect == 3 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 128, "Exit Game");
	
	} else if pauseMenu == 1 {
		
		draw_text_transformed(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 16, 
			"OPTIONS", 2, 2, 0);
		
		draw_set_font(fntUndertale);
		
		if pauseSelect == 0 { draw_set_color(c_yellow); }
		draw_text(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 64, "Volume: " + string(pauseVolume));
	
		if pauseSelect == 1 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 80, "Text Speed: " + speedSelect);
		
		if pauseSelect == 2 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 96, "No Hit: " + noHit);
		
	} else if pauseMenu == 2 {
		
		draw_text_transformed(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 16, 
			"CONTROLS", 2, 2, 0);
		
		draw_set_font(fntUndertale);
		
		if selectingControl { draw_text(camera_get_view_x(view_camera[0]) + 128, camera_get_view_y(view_camera[0]) + 196, "Listening..."); }
		
		if pauseSelectPlus[0] == 0 && pauseSelectPlus[1] == 0 { draw_set_color(c_yellow); }
		draw_text(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 64, "Right: " + keyToString(global.right));
	
		if pauseSelectPlus[0] == 0 && pauseSelectPlus[1] == 1 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 80, "Down: " + keyToString(global.down));
		
		if pauseSelectPlus[0] == 0 && pauseSelectPlus[1] == 2 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 96, "Left: " + keyToString(global.left));
		
		if pauseSelectPlus[0] == 0 && pauseSelectPlus[1] == 3 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 112, "Up: " + keyToString(global.up));
		
		if pauseSelectPlus[0] == 0 && pauseSelectPlus[1] == 5 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 160, "Options: " + keyToString(global.pause));
		
		if pauseSelectPlus[0] == 1 && pauseSelectPlus[1] == 0 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 120, camera_get_view_y(view_camera[0]) + 64, "RightAlt: " + keyToString(global.rightAlt));
	
		if pauseSelectPlus[0] == 1 && pauseSelectPlus[1] == 1 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 120, camera_get_view_y(view_camera[0]) + 80, "DownAlt: " + keyToString(global.downAlt));
		
		if pauseSelectPlus[0] == 1 && pauseSelectPlus[1] == 2 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 120, camera_get_view_y(view_camera[0]) + 96, "LeftAlt: " + keyToString(global.leftAlt));
		
		if pauseSelectPlus[0] == 1 && pauseSelectPlus[1] == 3 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 120, camera_get_view_y(view_camera[0]) + 112, "UpAlt: " + keyToString(global.upAlt));
		
		if pauseSelectPlus[0] == 2 && pauseSelectPlus[1] == 0 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 208, camera_get_view_y(view_camera[0]) + 64, "Yes: " + keyToString(global.yes));
		
		if pauseSelectPlus[0] == 2 && pauseSelectPlus[1] == 1 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 208, camera_get_view_y(view_camera[0]) + 80, "No: " + keyToString(global.no));
		
		if pauseSelectPlus[0] == 2 && pauseSelectPlus[1] == 2 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 208, camera_get_view_y(view_camera[0]) + 96, "Menu: " + keyToString(global.menu));
		
		if pauseSelectPlus[0] == 2 && pauseSelectPlus[1] == 3 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 208, camera_get_view_y(view_camera[0]) + 128, "YesAlt: " + keyToString(global.yesAlt));
		
		if pauseSelectPlus[0] == 2 && pauseSelectPlus[1] == 4 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 208, camera_get_view_y(view_camera[0]) + 144, "NoAlt: " + keyToString(global.noAlt));
		
		if pauseSelectPlus[0] == 2 && pauseSelectPlus[1] == 5 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
		draw_text(camera_get_view_x(view_camera[0]) + 208, camera_get_view_y(view_camera[0]) + 160, "MenuAlt: " + keyToString(global.menuAlt));
		
		draw_set_color(c_white);
		draw_text_transformed(camera_get_view_x(view_camera[0]) + 180, camera_get_view_y(view_camera[0]) + 220, "Press DEL to reset controls to default.", 0.5, 0.5, 0);
	}
	
	draw_set_color(c_white);
	
	draw_text_transformed(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 220, 
		$"Tap {string_upper(keyToString(global.pause))} or {string_upper(keyToString(global.no))} to go back.", 0.5, 0.5, 0);
	
	draw_set_halign(fa_right);
	
	draw_text_transformed(camera_get_view_x(view_camera[0]) + 300, camera_get_view_y(view_camera[0]) + 24, 
		"Playing for " + string(floor(global.gameTime / 60)) + ":" + string(floor(global.gameTime) - (floor(global.gameTime / 60) * 60)),
			0.5, 0.5, 0);
	
}