///@desc Here you'll find help!

myName = "Temmit"; //This monster's name
myID = 0; //This monster's ID in the global.monsterID array

myType = 0; //A monster type 0 is a non-boss monster. A type 1 is a boss monster

myIntroText[0] = $"* {myName} hopped close!"; //The text that the narrator says in the first turn
myIntroText[1] = $"* Two {myName}s hopped close!"; //The text that the narrator says in the first turn
myIntroText[2] = $"* How!? Three {myName}s!"; //The text that the narrator says in the first turn

//Bosses n' stuff
spareable = false; //If you can spare the monster
outSprite = sprBFroggitSpare;
inactive = false; //If this object should not be doing anything

order = 0;
spriteOrder = 0;

fleeable = true;

//Acting-related variables
rightActs = 0; //The amount of right acts you've done
whichAct = 1; //The act that must be done to increment rightActs

//Flavor text of this monster
#region Flavor Text

//Flavor text for single Froggit
myFlavorText[0, 0] = "* It's Temmit."; //Flavor text 0
myFlavorText[0, 1] = "* Smells like Temmit."; //Flavor text 1
myFlavorText[0, 2] = "* Guys, I think it's Temmit."; //Flavor text 1
myFlavorText[0, 3] = "* hOI TEMMIT, me DAD"; //Flavor text 2
myFlavorText[0, 4] = "* You wonder what's hiding under&Temmit's legs."; //Flavor text 3
myFlavorText[0, 5] = "* Found you Temmit!"; //Flavor text 4
myFlavorText[0, 6] = "* It's a shiny! Wait, wrong game."; //Flavor text 4
myFlavorText[0, 7] = "* What's he saying again?"; //Flavor text 5

//Flavor text for double froggit
myFlavorText[1, 0] = "* It's two Temmits.";
myFlavorText[1, 1] = "* Smells like a lake...";
myFlavorText[1, 2] = "* Guys, I think they're frogs.";
myFlavorText[1, 3] = "* hOI TEMMITS, me DAD";
myFlavorText[1, 4] = "* You wonder what's hiding under&Temmit's legs.";
myFlavorText[1, 5] = "* Found you Temmit!";

//Flavor  text for triple froggit
myFlavorText[2, 0] = "* How?";
myFlavorText[2, 1] = "* You do realize how rare this is&right?";

#endregion

//The dialogue this monster says
#region Dialogue

//myDialogue is the dialogue that the game uses randomly during turns
myDialogue[0] = "Ribbit, ribbit.&(hOI, HOOMAN!!!!)";
myDialogue[1] = "Ribbit, ribbit, ribbit.&(me name TEMMIT!!!!!)";
myDialogue[2] = "*Sexy frog noises*";

//myActDialogue is the dialogue that the monster says when you act a certain way
myActDialogue[0] = "*Blushes deeply*&Ribbit...";
myActDialogue[1] = "*Shaking*&RIBBIT, RIBBIT!?";

//The dialogue when global.turn = 1
myTurnDialogue[0] = "TeMmit lik tEm!1!!";

#endregion

//The lines the narrator says (mostly)
#region Narrator

//The text the narrator says when you act a certain way
myActText[0] = "* Temmit didn't understand&what you said, but was&flattered anyway.";
myActText[1] = "* Temmit didn't understand&what you said, but was&scared anyway.";

//The ACT options you have
myAct[0] = "* Compliment";
myAct[1] = "* Threat";
myAct[2] = "";

//The text the narrator says when you check the monsters
myInfo = "* TEMMIT - ATK 4 DEF 5&* Life is difficult for this enemy.";

#endregion

//Monster Stats
#region Stats

myHP = 30; //The HP of this monster
myMaxHP = 30;

myBarSize = 10;

myATK = 4; //The attack of this monster
myDef = 5; //The defense of this monster

myEXP = 10; //The EXP this monster rewards
myGold = 20; //The Gold this monster rewards

mySequence = -1;
reqSequence = sqTemmit; //The sequence that the object wants created

#endregion

#region Attacks

spawnCounter = 0;
priority[0] = 0;
priority[1] = 1;

chosen[0] = false;
chosen[1] = false;

#endregion

//Bubble spawning position (defaults to top middle)
bubbleX = objBM.monsterPos[0, spriteOrder];
bubbleY = 50;

grounded = true;

currAttack = 0;

myBarX = objBM.monsterPos[0, spriteOrder];