switch(global.friskState) {
	
	#region Movement and Animation
	
	case 0: //If frisk can move, then move
	
	if global.nHeld { global.friskSpd = 2; image_speed = 2; }
	else { global.friskSpd = 1; image_speed = 1; }
	
	visible = true;
	image_alpha = 1;
	
	//---Actual Movement---
	hsp = global.r - global.l;
	vsp = global.d - global.u;
	
	if get_dir(hsp, vsp) == "" { state = "I"; }
		else if hsp == 0 || vsp == 0 { dir = get_dir(hsp, vsp); state = ""; }
	
	if !place_free(x + hsp * global.friskSpd, y) { hsp = 0; }
	if !place_free(x, y + vsp * global.friskSpd) { vsp = 0; }

	x += hsp * global.friskSpd;
	y += vsp * global.friskSpd;
	
	var tisBool = global.rPressed || global.lPressed;
	if global.uPressed && tisBool { dir = "U"; }
	if global.dPressed && tisBool { dir = "D"; }
	
	//---Animation---
	
	//Changing direction when against a wall, and hitting a direction that's free
	if dir == "R" || dir == "L" { 
		
		if !place_free(x + get_num(dir), y) { if global.u { dir = "U"; } else if global.d { dir = "D"; } }
	}
	
	if dir == "D" || dir == "U" { 
		
		if !place_free(x, y + get_num(dir)) { if global.r { dir = "R"; } else if global.l { dir = "L"; } }
	}
	
	//Stopping walk cycle against a wall
	
	if dir == "R" || dir == "L"
		{ if !place_free(x + get_num(dir), y) { state = "I"; } }
	
	if dir == "D" || dir == "U"
		{ if !place_free(x, y + get_num(dir)) { state = "I"; } }
		
	if (global.r || global.l) && (global.d || global.u) { state = ""; }
	break;
	
	#endregion
	
	case 1: //If you're in a cutscene...
	
	visible = true;
	image_alpha = 1;
	state = "I"; //Reset animation
	break;
	
	case 2: //If you're on battle...
	
	visible = false; //Make frisk invisible
	break;
}