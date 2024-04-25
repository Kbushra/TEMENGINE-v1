/// @description All text

#region Menu writing

if menu == 0 {
	
	draw_set_alpha(0.7);
	
	draw_text_transformed(135, 30, "---INSTRUCTIONS---", 2, 2, 0);
	draw_text_transformed(135, 100, $"[{keyToString(global.yes)} or {keyToString(global.yesAlt)}] - Confirm", 2, 2, 0);
	draw_text_transformed(135, 135, $"[{keyToString(global.no)} or {keyToString(global.noAlt)}] - Cancel/Run", 2, 2, 0);
	draw_text_transformed(135, 170, $"[{keyToString(global.menu)} or {keyToString(global.menuAlt)}] - Ingame menu", 2, 2, 0);
	draw_text_transformed(135, 205, $"[Press {keyToString(global.pause)}] - Options", 2, 2, 0);
	draw_text_transformed(135, 310, "When HP is 0 in battles, you lose.", 2, 2, 0);
	
	draw_set_alpha(1);
}

if menu == 1 {
	
	draw_text_transformed(180, 25, "Name the fallen human", 2, 2, 0);
	draw_set_halign(fa_center);
	draw_text_transformed(315, 70, global.name, 2, 2, 0);
	draw_set_halign(fa_left);
	
	if selection == 100 { draw_set_color(c_yellow); }
	draw_text_transformed(90, 140 + 35*8.5, "Quit", 2, 2, 0);
	
	if selection == 101 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
	draw_text_transformed(90 + 75*2, 140 + 35*8.5, "Backspace", 2, 2, 0);
	
	if selection == 102 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
	draw_text_transformed(90 + 75*5, 140 + 35*8.5, "Done", 2, 2, 0);
	
	draw_set_color(c_white);
	
	for( var i = 0; i < 8; i++ ) {
	
		for ( var j = 0; j < 7; j++ ) {
		
			if selection == i * 7 + j { draw_set_color(c_yellow); }
			else { draw_set_color(c_white); }
			
			if wait % 2 == 0
			{ var error = choose(1, 0, -1); var error2 = choose(1, 0, -1); }
			else { var error = 0; var error2 = 0; }
			
			if i < 4 { draw_text_transformed(textX[j] + error, textY[i] + error2, char[i * 7 + j], 2, 2, 0); }
			else { draw_text_transformed(textX[j] + error, textY[i] + error2, string_lower(char[i * 7 + j - 28]), 2, 2, 0); }
		}
	}
}

if menu >= 2 {
	
	scale += 0.05;
	if scale >= 6 { scale = 6; }
	
	if wait % 2 == 0
	{ var error = random_range(-1, 1); var error2 = random_range(-1, 1); }
	else { var error = 0; var error2 = 0; }
	
	draw_set_halign(fa_center);
	
	#region List of flavour
	if string_lower(global.name) == "krysie" { draw_text_transformed(315, 60, "The true true name!!!", 2, 2, 0); }
	else if string_lower(global.name) == "chara" { draw_text_transformed(315, 60, "The true name, but you\ncan do one better, right?", 2, 2, 0); }
	else if string_lower(global.name) == "tem" || string_lower(global.name) == "temmie" { draw_text_transformed(315, 60, "You are not stealing the game name", 2, 2, 0); allowed = false; }
	else if string_lower(global.name) == "undert" { draw_text_transformed(315, 60, "You tried. *gives you a star*\n(Did you try spelling 'a hundred' in german?)", 2, 2, 0); allowed = false; }
	else if string_lower(global.name) == "temeng" { draw_text_transformed(315, 60, "You tried. *gives you a star*\n(Why does that sound like a drink?)", 2, 2, 0); allowed = false; }
	//else if string_lower(global.name) == "merg" { draw_set_font(fntComicSans); draw_text_transformed(315, 60, "* Fan of hornyposting, huh kid?", 2, 2, 0); }
	//else if string_lower(global.name) == "shayy" { draw_text_transformed(315, 60, "Try speedrunning this, birch.", 2, 2, 0); }
	else { draw_text_transformed(315, 60, "Cool name, now temmify it.", 2, 2, 0); }
	#endregion
	
	draw_text_transformed(315 + error, 170 + error2, global.name, scale, scale, 0);
	
	draw_set_halign(fa_left);
	
	if selection == 0 { draw_set_color(c_yellow); }
	draw_text_transformed(70, 400, "Go back", 2, 2, 0);
	draw_set_color(c_white);
	
	if selection == 1 { draw_set_color(c_yellow); }
	if allowed { 
		
		draw_set_alpha(continueAlpha);
		draw_text_transformed(continueX, continueY, "Continue", 2, 2, 0); 
	}
	
	draw_set_color(c_white);
}

#endregion