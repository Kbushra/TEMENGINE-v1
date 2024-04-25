#region Update Variables

if !global.shaking {
	
	global.pastCamX = camera_get_view_x(view_camera[0]);
	global.pastCamY = camera_get_view_y(view_camera[0]);
}

//Read-Only Controls
global.r = keyboard_check(global.right) || keyboard_check(global.rightAlt);
global.d = keyboard_check(global.down) || keyboard_check(global.downAlt);
global.l = keyboard_check(global.left) || keyboard_check(global.leftAlt);
global.u = keyboard_check(global.up) || keyboard_check(global.upAlt);

global.rPressed = keyboard_check_pressed(global.right) || keyboard_check_pressed(global.rightAlt);
global.dPressed = keyboard_check_pressed(global.down) || keyboard_check_pressed(global.downAlt);
global.lPressed = keyboard_check_pressed(global.left) || keyboard_check_pressed(global.leftAlt);
global.uPressed = keyboard_check_pressed(global.up) || keyboard_check_pressed(global.upAlt);

global.y = keyboard_check_pressed(global.yes) || keyboard_check_pressed(global.yesAlt);
global.n = keyboard_check_pressed(global.no) || keyboard_check_pressed(global.noAlt);
global.m = keyboard_check_pressed(global.menu) || keyboard_check_pressed(global.menuAlt);

global.p = keyboard_check_pressed(global.pause);

global.yHeld = keyboard_check(global.yes) || keyboard_check(global.yesAlt);
global.nHeld = keyboard_check(global.no) || keyboard_check(global.noAlt);
global.mHeld = keyboard_check(global.menu) || keyboard_check(global.menuAlt);

global.pHeld = keyboard_check(global.pause);

for(var a = 0; a < 10; a ++) { 
	
	if global.inventory[a] == 0 { global.invFree = a; exit; } else if a != 9 { continue; } 
	
	global.invFree = -1;
}

#endregion