//In the actual game
if instance_exists(objFrisk) { 
	
	global.gameStarted = true;
}

if global.gameStarted {
	
	if global.p && !selectingControl && global.friskState != 2 && room != rmBattle && room != rmGameOver { global.onPause = !global.onPause; pauseMenu = 0; pauseSelect = 0; }
	
	if global.onPause { 
		
		instance_deactivate_all(true);
		
		instance_create_layer(x, y, "Subeffects", objLights); 
		objLights.image_blend = c_black;
		objLights.image_alpha = 0.33;
		
		if global.n && pauseMenu != 0 && !selectingControl { pauseSelect = pauseMenu - 1; pauseMenu = 0; }
		else if global.n && !selectingControl { global.onPause = false; pauseMenu = 0; pauseSelect = 0; }
		
		audio_sound_gain(global.bgMusic, 0.25, 60);
		
		if pauseMenu == 0 {
			
			if global.y { pauseMenu = pauseSelect + 1; pauseSelect = 0; transition = true; }
			
			if global.dPressed { if pauseSelect < 3 { pauseSelect ++; } else { pauseSelect = 0; } }
			if global.uPressed { if pauseSelect > 0 { pauseSelect --; } else { pauseSelect = 2; } }
		}
		
		if pauseMenu == 1 {
			
			if global.dPressed { if pauseSelect < 2 { pauseSelect ++; } else { pauseSelect = 0; } }
			if global.uPressed { if pauseSelect > 0 { pauseSelect --; } else { pauseSelect = 2; } }
			
			//Volume Control
			if pauseSelect == 0 { 
				
				if volumeTimer > 0 {
					
					if global.rPressed { pauseVolume ++; } 
					if global.lPressed { pauseVolume --; } 
					
				} else {
					
					if global.r { pauseVolume ++; } 
					if global.l { pauseVolume --; } 	
				}
				
				if global.r || global.l { volumeTimer --; } else { volumeTimer = 30; }
			}
			pauseVolume = clamp(pauseVolume, 0, 100);
			
			if pauseSelect == 1 {
				
				if speedSelect == "DEFAULT" {
					
					if global.rPressed { speedSelect = "FAST"; }
					if global.lPressed { speedSelect = "SLOW"; } 
				}
				else if speedSelect == "FAST" {
					
					if global.rPressed { speedSelect = "SLOW"; }
					if global.lPressed { speedSelect = "DEFAULT"; } 
				}
				else if speedSelect == "SLOW" { 
					
					if global.rPressed { speedSelect = "DEFAULT"; }
					if global.lPressed { speedSelect = "FAST"; } 
				}
			}
			
			if pauseSelect == 2 {
				
				if global.rPressed || global.lPressed {
					
					if noHit == "FALSE" { noHit = "TRUE"; }
					else { noHit = "FALSE"; }
				}
			}
		}
		
		if pauseMenu == 2 {
			
			if keyboard_check_pressed(vk_delete) { 
				
				global.right = vk_right;
				global.down = vk_down;
				global.left = vk_left;
				global.up = vk_up;

				global.rightAlt = ord("D");
				global.downAlt = ord("S");
				global.leftAlt = ord("A");
				global.upAlt = ord("W");

				global.yes = ord("Z");
				global.no = ord("X");
				global.menu = ord("C");

				global.pause = vk_escape;

				global.yesAlt = vk_enter;
				global.noAlt = vk_shift;
				global.menuAlt = vk_control;
				
			}
			
			if !selectingControl {
				
				if global.y && !transition { selectingControl = true; transition = true; }
				
				if global.rPressed { 
					
					if pauseSelectPlus[1] < 3 {
					
						if pauseSelectPlus[0] < 2 { pauseSelectPlus[0] ++; } else { pauseSelectPlus[0] = 0; }
					}
					
					if pauseSelectPlus[1] == 3 && pauseSelectPlus[0] != 2 { pauseSelectPlus[0] = !pauseSelectPlus[0]; }
					
					if pauseSelectPlus[0] == 2 && pauseSelectPlus[1] == 5 { pauseSelectPlus[0] = 0; }
						else if pauseSelectPlus[0] == 0 && pauseSelectPlus[1] == 5 { pauseSelectPlus[0] = 2; }
				}
				
				if global.lPressed {  
					
					if pauseSelectPlus[1] < 3 { 
					
						if pauseSelectPlus[0] > 0 { pauseSelectPlus[0] --; } else { pauseSelectPlus[0] = 2; }
					}
					
					if pauseSelectPlus[1] == 3 && pauseSelectPlus[0] != 2 {
					
						if pauseSelectPlus[0] > 0 { pauseSelectPlus[0] --; } else { pauseSelectPlus[0] = 1; }
					}
					
					if pauseSelectPlus[0] == 0 && pauseSelectPlus[1] == 5 { pauseSelectPlus[0] = 2; }
						else if pauseSelectPlus[0] == 2 && pauseSelectPlus[1] == 5 { pauseSelectPlus[0] = 0; }
				}
				
				if global.dPressed { 
					
					if pauseSelectPlus[0] == 0 {
						
						if pauseSelectPlus[1] < 3 { pauseSelectPlus[1] ++; } else if pauseSelectPlus[1] < 5 { pauseSelectPlus[1] = 5; } else { pauseSelectPlus[1] = 0; }
						
					} else if pauseSelectPlus[0] != 2 {
						
						if pauseSelectPlus[1] < 3 { pauseSelectPlus[1] ++; } else { pauseSelectPlus[1] = 0; }
						
					} else {
						
						if pauseSelectPlus[1] < 5 { pauseSelectPlus[1] ++; } else { pauseSelectPlus[1] = 0; }	
					}
					
				}
				
				if global.uPressed {  
					
					if pauseSelectPlus[1] != 5 || pauseSelectPlus[0] != 0 {
					
						if pauseSelectPlus[1] > 0 { pauseSelectPlus[1] --; } else if pauseSelectPlus[0] == 1 { pauseSelectPlus[1] = 3; } else { pauseSelectPlus[1] = 5; }
					}
					else if pauseSelectPlus[1] == 5 && pauseSelectPlus[0] == 0 { pauseSelectPlus[1] = 3;	}
				}
			}
			else if keyboard_key != 0 && !transition {
				
				inputKey = keyboard_key;
				
				if pauseSelectPlus[0] == 0 && pauseSelectPlus[1] == 0 { global.right = inputKey; }
				if pauseSelectPlus[0] == 0 && pauseSelectPlus[1] == 1 { global.down = inputKey; }
				if pauseSelectPlus[0] == 0 && pauseSelectPlus[1] == 2 { global.left = inputKey; }
				if pauseSelectPlus[0] == 0 && pauseSelectPlus[1] == 3 { global.up = inputKey; }
				
				if pauseSelectPlus[0] == 0 && pauseSelectPlus[1] == 5 { global.pause = inputKey; }
				
				if pauseSelectPlus[0] == 1 && pauseSelectPlus[1] == 0 { global.rightAlt = inputKey; }
				if pauseSelectPlus[0] == 1 && pauseSelectPlus[1] == 1 { global.downAlt = inputKey; }
				if pauseSelectPlus[0] == 1 && pauseSelectPlus[1] == 2 { global.leftAlt = inputKey; }
				if pauseSelectPlus[0] == 1 && pauseSelectPlus[1] == 3 { global.upAlt = inputKey; }

				if pauseSelectPlus[0] == 2 && pauseSelectPlus[1] == 0 { global.yes = inputKey; }
				if pauseSelectPlus[0] == 2 && pauseSelectPlus[1] == 1 { global.no = inputKey; }
				if pauseSelectPlus[0] == 2 && pauseSelectPlus[1] == 2 { global.menu = inputKey; }

				if pauseSelectPlus[0] == 2 && pauseSelectPlus[1] == 3 { global.yesAlt = inputKey; }
				if pauseSelectPlus[0] == 2 && pauseSelectPlus[1] == 4 { global.noAlt = inputKey; } 
				if pauseSelectPlus[0] == 2 && pauseSelectPlus[1] == 5 { global.menuAlt = inputKey; }
				
				selectingControl = false;
			}
			
			if keyboard_check_released(global.yes) || keyboard_check_released(global.yesAlt) { transition = false; }
		}
		
		if pauseMenu == 3 { game_restart(); }
		if pauseMenu == 4 { game_end(); }
		
	} else if !global.onPause { 
		
		instance_activate_all(); 
		
		audio_sound_gain(global.bgMusic, 1, 60);
		if instance_exists(objLights) { instance_destroy(objLights); } 
	}
	
	global.gameTime += 1 / 60;
}

if room == rmStart && variable_global_exists("spwnRoom") {
	
	if global.spwnRoom == rmIntro { room_goto(rmIntro); }
	else if memo || global.memo { room_goto(global.spwnRoom); }
	else { room_goto(rmHub); }
	
	draw_set_alpha(1);
	
	surface_resize(application_surface, view_wport[0], view_hport[0]);
}

//All option effects
audio_master_gain(pauseVolume / 100);

if speedSelect == "FAST" { global.textDefSpeed = 1; }
if speedSelect == "DEFAULT" { global.textDefSpeed = 2; }
if speedSelect == "SLOW" { global.textDefSpeed = 3; }

if noHit == "TRUE" { global.maxHp = 1; if global.hp > 1 { global.hp = 1; } }