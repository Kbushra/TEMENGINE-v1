draw_self();

draw_set_halign(fa_left);
draw_set_valign(fa_top);

//Color and font
var color = defaultColor;

//Coordinates of each letter!
var letterX = 0;
var lineY = 0;

//Spacing of the letters and lines
var letterSpacing = 8;
var lineSpacing = 16;

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
	
	//Add a new line using "&", use "*&" to exclude use the ampersand as text instead of as a command
	if string_char_at(textToDraw, i + 1) == "&" && string_char_at(textToDraw, i) != "&" {
		
		letterX = 0;
		lineY += lineSpacing;
		
		i += 1;
	}
	
	//Used to modify text delays for dramatic-er sentences!
	//Example: "{4* you'd be dead where you stand."
	if string_char_at(textToDraw, i + 1) == "{" {
		textDelay = 2 * real(string_char_at(textToDraw, i + 2));
		if textDelay < 2 { textDelay = 2; }
		i += 2;
	}
	
	//Draw the letter in the right position
	draw_set_font(fntUndertale);
	draw_text_color(writeX + letterX, writeY + lineY, string_char_at(textToDraw, i + 1), color, color, color, color, 1);
	
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
		//(Ignore repeated exclamation or question marks)
		if string_char_at(textToDraw, textLength) == "." ||
		   string_char_at(textToDraw, textLength) == "?" ||
		   string_char_at(textToDraw, textLength) == "!" {
			   
			if string_char_at(textToDraw, textLength + 1) != "?" &&
		       string_char_at(textToDraw, textLength + 1) != "!" { 
				   
				   if string_char_at(textToDraw, textLength - 1) != "?" &&
				      string_char_at(textToDraw, textLength - 1) != "!" { currentDelay = -30; }
			}
		}
		
		//Puts a quarter of a second of delay after commas if its indicated to
		if string_char_at(textToDraw, textLength) == "," { currentDelay = -30; }
		
		//Stops writing the text when there is no more text to type (lol)
		if textLength > string_length(textToDraw) { isWriting = false; }
	}
	
	//Skip text
	if global.n || global.m
		{ textLength = string_length(textToDraw); isWriting = false; }
	
} else if global.y || global.m && canAdvance { //Go into the next page
	
	//Reset everything to go into the next page
	textLength = 0;
	textDelay = 2;
	currentDelay = 0;
	
	isWriting = true;
	
	//Pages!
	if variable_instance_exists(id, "textQueue") {
		
		//If there's there was more pages and now you've read them all, destroy the chatbox
		if page >= array_length(textQueue) {
			
			with(chatboxOrigin) { memo = true; bubble = 0; }
			instance_destroy(objBubble);
			exit;
		}
		
		textToDraw = textQueue[page];
		page += 1;
		
	} else { textToDraw = ""; }
	
	if textToDraw == "" { 
		
		with(chatboxOrigin) { memo = true; bubble = 0; }
		instance_destroy(objBubble);
	}
}