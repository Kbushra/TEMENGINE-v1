#region .ini

//FLAGS!!!! They make the game progress
if !file_exists("TEMENGINE.ini") {
	
	show_debug_message("ini created");
	
	global.gameTime = 0;
	
	global.flag[0] = false;
	global.flag[1] = false;
	global.flag[2] = false;
	
	global.spwnRoom = rmIntro;
	global.spwnName = "The Void";
	global.spwnCoords[0] = 780;
	global.spwnCoords[1] = 120;
	
	global.hubStage = 0;
	
	for( var i = 0; i < global.cutsceneNum; i++; ) 
	{ global.cutsceneDone[i] = false; }
	
	global.prevLove = 1;
	global.love = 1;
	global.exp = 0;
	global.gold = 0;
	global.weapon = 1;
	global.armor = 3;
	global.name = "";
	
	global.inventory[0] = 0;
	global.inventory[1] = 0;
	global.inventory[2] = 0;
	global.inventory[3] = 0;
	global.inventory[4] = 0;
	global.inventory[5] = 0;
	global.inventory[6] = 0;
	global.inventory[7] = 0;
	global.inventory[8] = 0;
	global.inventory[9] = 0;
	
	pauseVolume = 100;
	speedSelect = "DEFAULT";
	noHit = "FALSE";
	
	#region Controls

	//Modifiable Controls
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

	#endregion
	
	ini_all(0);
	
} else {
	
	show_debug_message("ini read");
	ini_all(1);
}

#endregion

#region Global Game Variables

randomize();

global.shaking = false;

for(var i = 0; i <= global.itemNum; i ++) { global.itemID[i] = asset_get_index("objItem" + string(i)); }
for(var i = 0; i <= global.itemNum; i ++) { instance_create_layer(0, 0, "Managers", global.itemID[i]); }

global.place = 0; //0 is ruins
global.doorID = -1;

global.shopkeeper = -1;

global.soundID = -1;

global.delay = 0;

global.battling = false;

//Monster IDs of all the monsters (0 to 1 is ruins)
global.monsterID[0] = objBTemmit;
global.monsterID[1] = objBAddle;

global.priority = 0; //Attack with highest priority will determine size and length
global.atkChosen[0] = 0; //How many have been used (stores priority)

global.debug = false;
global.chatting = 0; //This variable defines if Frisk is chatting with a character or not
global.cutscene = -1; //-1 means not in a cutscene

global.pastCamX = camera_get_view_x(view_camera[0]);
global.pastCamY = camera_get_view_y(view_camera[0]);

global.onMenu = false;
global.onPause = false;

if global.place = 0 {

	global.bgMusic = sndRuins;
	global.playSong = true;
}

global.currMonster = 0;

global.soulLastX = 320;
global.soulLastY = 240;

//STATS

//global.name
//global.love
//global.exp
global.maxHp = 16 + (4 * global.love);
global.hp = global.maxHp;

global.reqExp[0] = 10;
global.reqExp[1] = 20;
global.reqExp[2] = 40;
global.reqExp[3] = 50;
global.reqExp[4] = 80;
global.reqExp[5] = 100;
global.reqExp[6] = 200;
global.reqExp[7] = 300;
global.reqExp[8] = 400;
global.reqExp[9] = 500;
global.reqExp[10] = 800;
global.reqExp[11] = 1000;
global.reqExp[12] = 1500;
global.reqExp[13] = 2000;
global.reqExp[14] = 3000;
global.reqExp[15] = 5000;
global.reqExp[16] = 10000;
global.reqExp[17] = 25000;
global.reqExp[18] = 50000;

global.attack = -2 + (2 * global.love);
global.defense = floor((global.love - 1) / 4);

global.weaponAtk = 0;
global.armorDef = 0;

global.healer = 0;

#endregion

#region Items

global.itemInfo[0] = "";
global.itemInfo[1] = "* A trusty stick. Good for poking&things. (ATK+0)";
global.itemInfo[2] = "* This knife won't harm a child!&..But it can harm a monster.&(ATK+2)";
global.itemInfo[3] = "* Bandages are known for healing,&but this bandage looks centuries&old. (DEF+0)";
global.itemInfo[4] = "* This cute ribbon may save your&life today, so take care of it.&(DEF+2)";
global.itemInfo[5] = "* Stale bread never loses.&(HEALS 5HP)";

global.itemUse[0] = "";
global.itemUse[1] = "* Stick ready for throwing!";
global.itemUse[2] = "* Monsters better be scared of&play pretend.";
global.itemUse[3] = "* Ugh, that fell gross... minus&10 frisk points.";
global.itemUse[4] = "* You became a cutie pie.";
global.itemUse[5] = "* Mmmm, I do love bread that&takes an hour to eat.";

//0 = Weapon, 1 = Armor, 2 = Healing

global.itemClass[0] = "";
global.itemClass[1] = "Weapon";
global.itemClass[2] = "Weapon";
global.itemClass[3] = "Armour";
global.itemClass[4] = "Armour";
global.itemClass[5] = "Healing";

#endregion

#region Contacts

global.contactID[0] = "";
global.contactID[1] = "Chara";
global.contactID[2] = "Yourself";
global.contactID[3] = "";
global.contactID[4] = "";

global.availableContacts[0] = 1;
global.availableContacts[1] = 2;
global.availableContacts[2] = 0;
global.availableContacts[3] = 0;
global.availableContacts[4] = 0;

global.contactDialogue[0, 0] = "/1_6 * You don't need to call&me!";
global.contactDialogue[0, 1] = "/1_3 @4 * Just look behind you";
global.contactDialogue[1, 0] = "* Ringing...";

global.startDialogue = 0;
global.dialogueCount = 0;
global.contactLength = 2;

#endregion

#region Frisk's Properties

global.friskSpd = 1; //This variable defines Frisk's Overworld speed
global.friskBattleSpd = 1; //This varaible defines Frisk's Battle speed

//State 0 - Free Roam, State 1 - Freeze, State 2 - Deactivated
global.friskState = 0;
global.friskAppearance = "";

//global.inventory[0 - 8]

for(var i = 0; i < 10; i ++) { 
	
	if global.inventory[i] == 0 { global.invFree = i; exit; } else if i != 9 { continue; } 
	
	global.invFree = -1;
}

#endregion