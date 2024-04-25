draw_self();

draw_set_halign(fa_left);
draw_set_valign(fa_top);

//Color and font
var color = defaultColor;
var font = fntUndertale;

//Coordinates of each letter!
var letterX = 0;
var lineY = 0;

//Spacing of the letters and lines
var letterSpacing = 8 * scale;
var lineSpacing = 16 * scale;

var boolA = global.cutscene != objIntro && global.y || global.m && canAdvance;
var boolB = global.cutscene == objIntro && !cutscenePrevent;

//Draws every letter is has so far
for (var i = 0; i < textLength; i ++) {
	
	//Change text color
	if string_char_at(textToDraw, i + 1) == "~" {
		if string_char_at(textToDraw, i + 2) == "A" { color = c_aqua; i += 2; }
		if string_char_at(textToDraw, i + 2) == "B" { color = c_blue; i += 2; }
		if string_char_at(textToDraw, i + 2) == "F" { color = c_fuchsia; i += 2; }
		if string_char_at(textToDraw, i + 2) == "G" { color = c_green; i += 2; }
		if string_char_at(textToDraw, i + 2) == "L" { color = c_lime; i += 2; }
		if string_char_at(textToDraw, i + 2) == "O" { color = c_orange; i += 2; }
		if string_char_at(textToDraw, i + 2) == "P" { color = c_purple; i += 2; }
		if string_char_at(textToDraw, i + 2) == "R" { color = c_red; i += 2; }
		if string_char_at(textToDraw, i + 2) == "Y" { color = c_yellow; i += 2; }
		
		if string_char_at(textToDraw, i + 2) == "D" { color = defaultColor; i += 2; } 
	}
	
	//Change font
	if string_char_at(textToDraw, i + 1) == "@" {
		if string_char_at(textToDraw, i + 2) == "S" { font = fntComicSans; i += 2; }
		if string_char_at(textToDraw, i + 2) == "P" { font = fntPapyrus; i += 2; }
		if string_char_at(textToDraw, i + 2) == "W" { font = fntWingdings; i += 2; }
		
		if string_char_at(textToDraw, i + 2) == "D" { font = fntUndertale; i += 2; } 
	}
	
	//Change monster with "/"
	if string_char_at(textToDraw, i + 1) == "/" {
		currMonster = real(string_char_at(textToDraw, i + 2));
		i += 2;
	}
	
	//Change monster expression with "_"
	if string_char_at(textToDraw, i + 1) == "_" {
		monsterID[currMonster].expression = real(string_char_at(textToDraw, i + 2));
		i += 2;
	}
	
	//Change monster mode with "{"
	if string_char_at(textToDraw, i + 1) == "{" {
		chatboxMode = real(string_char_at(textToDraw, i + 2));
		i += 2;
	}
	
	//Set font and color
	draw_set_color(color);
	draw_set_font(font);
	
	//Add a new line using "&", use "&&" to use the ampersand as text instead of as a command
	if string_char_at(textToDraw, i + 1) == "&" && string_char_at(textToDraw, i) != "&" {
		
		if string_char_at(textToDraw, i + 2) != "*" { letterX = 16 * scale; } else { letterX = 0; }
		lineY += lineSpacing;
		
		if global.cutscene == objGameOver { letterX = 0; }
		
		i += 1;
	}
	
	//Used to modify text delays for dramatic-er sentences!
	//Example: "@4* you'd be dead where you stand."
	if string_char_at(textToDraw, i + 1) == "@" {
		
		canSkip = false;
		textDelay = (global.textDefSpeed / 2) * real(string_char_at(textToDraw, i + 2));
		i += 2;
	}
		
	draw_sprite_ext(monsterID[currMonster].face, monsterID[currMonster].expression, faceX, faceY,
		monsterID[currMonster].scale, monsterID[currMonster].scale,
				image_angle, image_blend, image_alpha);
	
	if chatboxMode == 0 {
	
		//Draw the letter in the right position
		draw_text_transformed(writeX + letterX, writeY + lineY, string_char_at(textToDraw, i + 1),
			scale, scale, image_angle);
		
	} else if chatboxMode == 1 {
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		//Draw the letter in the right position
		draw_text_transformed(writeX + letterX, writeY + lineY, string_char_at(textToDraw, i + 1),
			scale, scale, image_angle);
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		//Selection
		draw_sprite(sprMenuSoul, 0, choiceX[currChoice] - 12, y + 60);
		
		//Choice 1
		draw_text(choiceX[0], y + 60, choice[0]);
			
		//Choice 2
		draw_text(choiceX[1], y + 60, choice[1]);
		
	}
	
	//Next letter!
	letterX += letterSpacing;
}

//Everything related to the typewriter effect
if isWriting { //If the chatbox is currently writing...
	
	currentDelay += 1; //Add to the delay counter every frame
	if currentDelay >= textDelay { //If the delay for the next character has passed...
		
		//Go to the next character
		currentDelay = 0;
		textLength += 1;
		
		//Puts a half a second of delay after periods, exclamation and question marks if its indicated to
		if string_char_at(textToDraw, textLength) == "." ||
			string_char_at(textToDraw, textLength) == "?" ||
				string_char_at(textToDraw, textLength) == "!" { currentDelay = -30 * (global.textDefSpeed / 2); }
		
		//Puts a quarter of a second of delay after commas if its indicated to
		if string_char_at(textToDraw, textLength) == "," { currentDelay = -30 * (global.textDefSpeed / 2); }
		
		//Stops writing the text when there is no more text to type (lol)
		if textLength > string_length(textToDraw) { isWriting = false; }
	}
	
	//Skip text
	if canSkip && textLength > 0 {
		
		if global.n || global.m
			{ textLength = string_length(textToDraw); isWriting = false; }
	}
	
} else if boolA || boolB { //Go into the next page
	
	if room == rmShop && !objSM.talking { exit; }
	if global.battling { exit; }
	
	global.y = false;
	global.m = false;
	
	//Reset everything to go into the next page
	textLength = 0;
	textDelay = global.textDefSpeed;
	currentDelay = 0;
	
	isWriting = true;
	
	//Pages!
	if variable_instance_exists(id, "textQueue") {
		
		//If there's there was more pages and now you've read them all, destroy the chatbox
		if page >= array_length(textQueue) {
			
			scrDestroyChatbox();
			exit;
		}
		
		textToDraw = textQueue[page];
		page += 1;
		
	} else { textToDraw = ""; }
	
	//Destroy the chatbox if text is blank
	if textToDraw == "" { 
		
		scrDestroyChatbox();
	}
	
	if boolB { cutscenePrevent = true; }
}

scrItemActions();