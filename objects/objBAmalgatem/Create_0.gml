myName = "Amalgatem"; //This monster's name
myID = -1; //This monster's ID in the global.monsterID array

myType = 0; //A monster type 0 is a non-boss monster. A type 1 is a boss monster

myIntroText[0] = $"* {myName} sleep walked to you!"; //The text that the narrator says in the first turn
myIntroText[1] = $"* Two {myName}s approached!"; //The text that the narrator says in the first turn
myIntroText[2] = $"* Shh. Let the 3 {myName}s sleep!"; //The text that the narrator says in the first turn

spareable = true;
outSprite = sprBAmalgaSpare;
inactive = false;

whichAct = -1;

order = 0;
spriteOrder = 0;

fleeable = true;

//Flavor text of this monster
#region Flavour text

myFlavorText[0, 0] = "* Its sleeping.";
myFlavorText[0, 1] = "* Amalgatem's eyes flutter.";
myFlavorText[0, 2] = "* Amalgatem mutters in its&sleep.";
myFlavorText[0, 3] = "* Amalgatem is bothered&by you.";

myFlavorText[1, 0] = "* Ill keep quiet to let them&sleep.";
myFlavorText[1, 1] = "* Im already drooling...";

myFlavorText[2, 0] = "* ZZZZZZZZZZZZ";

#endregion

#region Dialogue

//myDialogue is the dialogue that the game uses randomly during turns
myDialogue[0] = "zzzzzz";
myDialogue[1] = "ZZZZZZZZ";
myDialogue[2] = "Tem waNt SLEEP";

//myActDialogue is the dialogue that the monster says when you act a certain way
myActDialogue[0] = "mMmMmmm";

//The dialogue when global.turn = 1
myTurnDialogue[0] = "TeM hate thIs...";

#endregion

//The lines the narrator says (mostly)
#region Narrator

//The text the narrator says when you act a certain way
myActText[0] = "* You poke its eyes. Nothing&happens.";

//The ACT options you have
myAct[0] = "* Disturb";
myAct[1] = "";
myAct[2] = "";

//The text the narrator says when you check the monsters
myInfo = "* AMALGATEM - ATK 99 DEF 0&* This tem is tired&and vulnerable, but deadly.";

#endregion

//Monster Stats
#region Stats

myHP = 10; //The HP of this monster
myMaxHP = 10;

myBarSize = 10;

myATK = 99; //The attack of this monster
myDef = 0; //The defense of this monster

myEXP = 2; //The EXP this monster rewards
myGold = 12; //The Gold this monster rewards

mySequence = -1;
reqSequence = sqAmalgatem; //The sequence that the object wants created

#endregion

grounded = true;

bubbleX = objBM.monsterPos[0, spriteOrder] + 80;
bubbleY = 50;

myBarX = objBM.monsterPos[0, spriteOrder];