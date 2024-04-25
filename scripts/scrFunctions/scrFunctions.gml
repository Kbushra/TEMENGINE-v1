function cutscene_end(_flag = undefined) { //Ending cutscenes
	
	global.cutscene = -1;
	if _flag != undefined { global.cutsceneDone[_flag] = 1; }
}

function item(_activated, _isSolid, _flag, _yesAction, _noAction, _itemID, _freeze, _choice, 
	_choicePage, _myLChoice, _myRChoice, _times, _ID) { //Setting items
	
	myID = _ID;
	urMom = noone;
	urDad = 0;
	
	for(var i = 0; i <= global.itemNum; i ++) {
		
		for(var j = 0; j < array_length(asset_get_index("objItem" + string(i)).instance); j ++;) {
			
			if asset_get_index("objItem" + string(i)).instance[j] == myID 
				{ urMom = asset_get_index("objItem" + string(i)); urDad = j; }
		}
	}
	
	//If the object is activated by default
	if urMom != noone {
		
		if urMom.pickedUp[urDad] == false { activated = _activated; } else { activated = false; }
		pickedUp = urMom.pickedUp[urDad];
		
	} else { activated = _activated; }
	
	isSolid = _isSolid; //If the object is solid by default
	
	//Flag that will activate when you've interacted with object
	flag = _flag;
	
	yesAction = _yesAction; //Action if you choose yes
	noAction = _noAction; //Action if you choose no
	
	itemID = _itemID; //ID of the current item
	freeze = _freeze; //If frisk freezes when interacting with the item
	
	//In what page the options are
	choicePage = _choicePage;
	
	//If there's options
	choice = _choice;
	
	//Options
	myChoice[0] = _myLChoice;
	myChoice[1] = _myRChoice;
		
	//How many times you can interact with the object
	times = _times;
	
	//Actual Text
	if argument_count > 12 { 
		
		for(var i = 0; i < (argument_count - 13); i ++) { myMessage[i] = argument[i + 13]; }
	}
}

function get_dir(_num1, _num2) {
	
	if _num1 == 1 { return "R"; exit; }
		else if _num1 == -1 { return "L"; exit; }
	
	
	if _num2 == 1 { return "D"; exit; }
		else if _num2 == -1 { return "U"; exit; }
		
	return "";
}

function get_num(_dir) {
	
	if _dir == "R" || _dir == "D" { return 1; exit; }
	if _dir == "L" || _dir == "U" { return -1; exit; }
		
	return 0;
}

function set_up_text(_font, _color, _halign, _valign, _alpha = 1) {
	
	draw_set_font(_font);
	draw_set_color(_color);
	
	draw_set_halign(_halign);
	draw_set_valign(_valign);
	
	draw_set_alpha(_alpha);
}

function ease(_start, _dest, _duration, _time, _mode) {
	
	#region Interpolation Types
	
	linear_interpolation = function() {
	
	var t = argument[0];
	var b = argument[1];
	var c = argument[2];
	var d = argument[3];
	
	t /= d;
	
	return (c * t) + b;
	}

	cubic_interpolation = function() {
	
		var t = argument[0];
		var b = argument[1];
		var c = argument[2];
		var d = argument[3];
	
		t /= d;
	
		return (c * t * t * t) + b;
	}
	
	soft_interpolation = function() {
	
		var t = argument[0];
		var b = argument[1];
		var c = argument[2];
		var d = argument[3];
	
		t /= (d / 2);
		
		if t < 1 { return c * 2 * t * t + b; }
		t --;
		
		return -c / 2 * (t * (t - 2) - 1) + b;
	}
	
	#endregion
	
	if _time < _duration { 
		
		if _mode == 0 { return linear_interpolation(_time, _start, _dest - _start, _duration); }
		if _mode == 1 { return cubic_interpolation(_time, _start, _dest - _start, _duration); }
		if _mode == 2 { return soft_interpolation(_time, _start, _dest - _start, _duration); }
		
	} else { return _dest; }
}

function ini_all(_mode) { //0 to write, 1 to read
	
	ini_open("TEMENGINE.ini");
	
	if _mode == 0 {
	
		ini_write_string("Places", "Spawn room", room_get_name(global.spwnRoom));
		ini_write_string("Places", "Spawn name", global.spwnName);
		ini_write_real("Places", "Spawn coords X", global.spwnCoords[0]);
		ini_write_real("Places", "Spawn coords Y", global.spwnCoords[1]);
	
		ini_write_string("Stats", "Name", global.name);
		ini_write_real("Stats", "Love", global.love);
		ini_write_real("Stats", "Previous love", global.prevLove);
		ini_write_real("Stats", "EXP", global.exp);
		ini_write_real("Stats", "Gold", global.gold);
		ini_write_real("Stats", "Weapon", global.weapon);
		ini_write_real("Stats", "Armor", global.armor);
		ini_write_real("Stats", "Stage of hub", global.hubStage);
		ini_write_real("Stats", "Time Elapsed", global.gameTime);
		
	
		for(var i = 0; i < global.flagNum; i ++;) 
			{ ini_write_real("Flags", $"flag[{i}]", global.flag[i]); }
		
		for(var i = 0; i < global.cutsceneNum; i ++;) 
			{ ini_write_real("Cutscenes", $"Cutscene {i} done - " + global.cutsceneName[i], global.cutsceneDone[i]);}
		
		for (var i = 0; i <= global.itemNum; i++;) {
			for (var j = 0; j < global.itemID[i].instCount; j++;) 
			{ ini_write_real("Collected items", $"Item {i}, instance {j}", global.itemID[i].pickedUp[j]); }
		}
		
		for(var i = 0; i < 10; i++;)
			{ ini_write_real("Inventory", $"Item {i}", global.inventory[i]); }
	}
	
	if _mode == 1 {
	
		for(var i = 0; i < global.flagNum; i ++;) 
			{ global.flag[i] = ini_read_real("Flags", $"flag[{i}]", 0); }
		
		for(var i = 0; i < global.cutsceneNum; i ++;) 
			{ global.cutsceneDone[i] = ini_read_real("Cutscenes", $"Cutscene {i} done - " + global.cutsceneName[i], false); }
		
		for (var i = 0; i <= global.itemNum; i++;) {
			for (var j = 0; j < global.itemID[i].instCount; j++;) 
			{ global.itemID[i].pickedUp[j] = ini_read_real("Collected items", $"Item {i}, instance {j}", false); }
		}
	
		for(var i = 0; i < 10; i++;) 
			{ global.inventory[i] = ini_read_real("Inventory", $"Item {i}", 0); }
	
		global.spwnRoom = asset_get_index(ini_read_string("Places", "Spawn room", rmMovement));
		global.spwnName = ini_read_string("Places", "Spawn name", "The void");
		global.spwnCoords[0] = ini_read_real("Places", "Spawn coords X", 780);
		global.spwnCoords[1] = ini_read_real("Places", "Spawn coords Y", 120);
	
		global.name = ini_read_string("Stats", "Name", "Krysie");
		global.love = ini_read_real("Stats", "Love", 1);
		global.prevLove = ini_read_real("Stats", "Previous love", 1);
		global.exp = ini_read_real("Stats", "EXP", 0);
		global.gold = ini_read_real("Stats", "Gold", 0);
		global.weapon = ini_read_real("Stats", "Weapon", 1);
		global.armor = ini_read_real("Stats", "Armor", 3);
		global.hubStage = ini_read_real("Stats", "Stage of hub", 0);
		global.gameTime = ini_read_real("Stats", "Time Elapsed", get_timer());
		
		objGM.pauseVolume = ini_read_real("Options", "Volume", 100);
		objGM.speedSelect = ini_read_string("Options", "Text speed", "DEFAULT");
		objGM.noHit = ini_read_string("Options", "No hit", "FALSE");
		
		global.right = ini_read_real("Controls", "Right", vk_right);
		global.down = ini_read_real("Controls", "Down", vk_down);
		global.left = ini_read_real("Controls", "Left", vk_left);
		global.up = ini_read_real("Controls", "Up", vk_up);
		global.rightAlt = ini_read_real("Controls", "RightALT", ord("D"));
		global.downAlt = ini_read_real("Controls", "DownALT", ord("S"));
		global.leftAlt = ini_read_real("Controls", "LeftALT", ord("A"));
		global.upAlt = ini_read_real("Controls", "UpALT", ord("W"));
		global.yes = ini_read_real("Controls", "Yes", ord("Z"));
		global.no = ini_read_real("Controls", "No", ord("X"));
		global.menu = ini_read_real("Controls", "Menu", ord("C"));
		global.yesAlt = ini_read_real("Controls", "YesAlt", vk_enter);
		global.noAlt = ini_read_real("Controls", "NoAlt", vk_shift);
		global.menuAlt = ini_read_real("Controls", "MenuAlt", vk_control);
		global.pause = ini_read_real("Controls", "Options toggle", vk_escape);
	}
	
	if _mode == 2 {
		
		ini_write_real("Options", "Volume", objGM.pauseVolume);
		ini_write_string("Options", "Text speed", objGM.speedSelect);
		ini_write_string("Options", "No hit", objGM.noHit);
		
		ini_write_real("Controls", "Right", global.right);
		ini_write_real("Controls", "Down", global.down);
		ini_write_real("Controls", "Left", global.left);
		ini_write_real("Controls", "Up", global.up);
		ini_write_real("Controls", "RightALT", global.rightAlt);
		ini_write_real("Controls", "DownALT", global.downAlt);
		ini_write_real("Controls", "LeftALT", global.leftAlt);
		ini_write_real("Controls", "UpALT", global.upAlt);
		ini_write_real("Controls", "Yes", global.yes);
		ini_write_real("Controls", "No", global.no);
		ini_write_real("Controls", "Menu", global.menu);
		ini_write_real("Controls", "YesAlt", global.yesAlt);
		ini_write_real("Controls", "NoAlt", global.noAlt);
		ini_write_real("Controls", "MenuAlt", global.menuAlt);
		ini_write_real("Controls", "Options toggle", global.pause);
	}
	
	ini_close();
}

function keyToString(_argument){
	
	switch _argument
	{
		case	17:		return "Ctrl"
		case	27:		return "Esc"
		case	65:		return "A"       
		case	66:		return "B"       
		case	67:		return "C"       
		case	68:		return "D"       
		case	69:		return "E"       
		case	70:		return "F"       
		case	71:		return "G"       
		case	72:		return "H"       
		case	73:		return "I"       
		case	74:		return "J"       
		case	75:		return "K"       
		case	76:		return "L"       
		case	77:		return "M"       
		case	78:		return "N"       
		case	79:		return "O"       
		case	80:		return "P"       
		case	81:		return "Q"       
		case	82:		return "R"       
		case	83:		return "S"       
		case	84:		return "T"       
		case	85:		return "U"       
		case	86:		return "V"       
		case	87:		return "W"       
		case	88:		return "X"       
		case	89:		return "Y"       
		case	90:		return "Z"       
		case	162:	return "L Ctrl"		 
		case	163:	return "R Ctrl"		 
		case	164:	return "L Alt"       
		case	165:	return "R Alt"       
		case	186:	return ";"
		case	222:	return "'"
		case	13:		return "Enter"
		case	220:	return	"\\"
		case	8:		return	"Bcksp"
		case	219:	return "["
		case	221:	return "]"
		case	188:	return ","
		case	190:	return "."
		case	191:	return "/"
		case	16:		return "Shift"
		case	9:		return "Tab"
		case	192:	return "`"
		case	48:		return "0"
		case	49:		return "1"
		case	50:		return "2"
		case	51:		return "3"
		case	52:		return "4"
		case	53:		return "5"
		case	54:		return "6"
		case	55:		return "7"
		case	56:		return "8"
		case	57:		return "9"
		
		case	96:		return "Num 0"
		case	97:		return "Num 1"
		case	98:		return "Num 2"
		case	99:		return "Num 3"
		case	100:	return "Num 4"
		case	101:	return "Num 5"
		case	102:	return "Num 6"
		case	103:	return "Num 7"
		case	104:	return "Num 8"
		case	105:	return "Num 9"
		case	111:	return "Num /"
		case	106:	return "Num *"
		case	107:	return "Num +"
		case	110:	return "Num ."
		case	109:	return "Num -"
		
		case	112:	return "F1"
		case	113:	return "F2"
		case	114:	return "F3"
		case	115:	return "F4"
		case	116:	return "F5"
		case	117:	return "F6"
		case	118:	return "F7"
		case	119:	return "F8"
		case	120:	return "F9"
		case	121:	return "F10"
		case	122:	return "F11"
		case	123:	return "F12"
		case	145:	return "ScrLk"
		case	19:		return "Pause"
		case	20:		return "Caps Lock"
		case	189:	return "-"
		case	187:	return "="
		case	45:		return "Insert"
		case	36:		return "Home"
		case	33:		return "Page Up"
		case	34:		return "Page Down"
		case	35:		return "End"
		case	46:		return "Delete"
		case	144:	return "NumLock"
		case	38:		return "Up"
		case	40:		return "Down"
		case	37:		return "Left"
		case	39:		return "Right"
		case	91:		return "L Windows"
		case	92:		return "R Windows"
		case	32:		return "Space"
		case	0:		return " "
		case	179:	return "Play"
		case	173:	return "Mute"
		case	174:	return "Volume Down"
		case	175:	return "Volume Up"

		default:		return "*ERROR*"
	}
}