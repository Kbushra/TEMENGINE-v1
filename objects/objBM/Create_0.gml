///@desc Variables, variables, variables

//This variable defines if you're battling or not
if room != rmBattle { global.battling = false; }
	else { global.battling = true; global.currSong = sndEnemy; }

global.currMonster[0] = 0; //Monster you're fighting, the game grabs to use it in the global.monsterID array
global.currMonster[1] = -1; 
global.currMonster[2] = -1; //-1 means no monster

global.monsterNum = choose(0, 1, 2); //Set how many monsters are present in the fight

if global.place == 0 {
	
	//0 = Temmit
	//1 = Temmadle
	
	for ( var i = 0; i <= global.monsterNum; i ++; ) {
		
		var monsterType = irandom_range(0, 1);
		global.currMonster[i] = monsterType;
	}
}

monster = -1; //This variable is to avoid drawing multiple instances of an object when not supposed to

//Get the current monsters
if global.currMonster[0] != -1 { currMonster[0] = global.monsterID[global.currMonster[0]]; }
	else { currMonster[0] = -1; }
	
if global.currMonster[1] != -1 { currMonster[1] = global.monsterID[global.currMonster[1]]; }
	else { currMonster[1] = -1; }
	
if global.currMonster[2] != -1 { currMonster[2] = global.monsterID[global.currMonster[2]]; }
	else { currMonster[2] = -1; }

global.turn = 0; //Turn 0 = player, turn 1 = monster
global.turnNum = 0; //Number of turns that have occured

goldGained = 0;
expGained = 0;

monsterOut[0] = 0;
monsterOut[1] = 0;
monsterOut[2] = 0;

monsterSprite[0] = 0;
monsterSprite[1] = 0;
monsterSprite[2] = 0;

chatbox = 0;

bubble = 0;
atkbubble = 0;
blubbed = false;

bubbleSprite = undefined;
bubbleDirection = undefined;

attacking = false; //Aiming for an attack
damage = 0; //How much damage is outputted from the player

fade = 0;

#region Menu Variables

menu = 0;
onAct = false

currText = 0;
currButton = 0; //0 = Fight, 1 = Act, 2 = Item, 3 = Mercy

buttonX[0] = 36;
buttonX[1] = 198;
buttonX[2] = 361;
buttonX[3] = 526;

buttonY = 450;

//These are the coodinates that indicate were the heart needs to be in the ACT, FIGHT and MERCY menus
namePos[0, 0] = 50; //If selection[0] == 0
namePos[1, 0] = 280; //If selection[0] == 0

namePos[0, 1] = 50; //If selection[0] == 1
namePos[1, 1] = 316; //If selection[0] == 1

namePos[0, 2] = 50; //If selection[0] == 2
namePos[1, 2] = 352; //If selection[0] == 2

//These are the coodinates that indicate were the heart needs to be in the ITEM and ACT menu
itemPos[0, 0] = 50; //If selection[1] == 0
itemPos[1, 0] = 280; //If selection[1] == 0

itemPos[0, 1] = 302; //If selection[1] == 1
itemPos[1, 1] = 280; //If selection[1] == 1

itemPos[0, 2] = 50; //If selection[1] == 2
itemPos[1, 2] = 312; //If selection[1] == 2

itemPos[0, 3] = 302; //If selection[1] == 3
itemPos[1, 3] = 312; //If selection[1] == 3

selection[0] = 0; //The variable that tracks your selection for the ACT, FIGHT and MERCY menus
selection[1] = 0; //The variable that tracks your selection for the ITEM menu

selectLimit[0] = 0; //The limit of the selection for the ACT, FIGHT and MERCY menus
selectLimit[1] = 0; //The limit of the selection for the ITEM and ACT menu

selectMonster = 0; //The selected monster to FIGHT or ACT on
monsterIndex = 0; //The index of selected monster

newList[0] = -1;

currText = "";

//These variables define the position of monsters
monsterPos[0, 0] = 0; //Monster 0, x
monsterPos[0, 1] = 0; //Monster 1, x
monsterPos[0, 2] = 0; //Monster 2, x

monsterPos[1, 0] = 0; //Monster 0, y
monsterPos[1, 1] = 0; //Monster 1, y
monsterPos[1, 2] = 0; //Monster 2, 

page = 0;

#endregion

down = 0; //The amount to go down (recreating gradient)
attackedMonster = -1; //The monster to animate

wait = 0;

removeDamage = 0;

soulSprite = -1;

damageFont = font_add_sprite(sprDamageFont, ord(" "), true, 4);