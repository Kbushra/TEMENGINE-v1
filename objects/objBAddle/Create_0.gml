///@desc Here you'll find help!

myName = "Temaddle"; //This monster's name
myID = 1; //This monster's ID in the global.monsterID array

myType = 0; //A monster type 0 is a non-boss monster. A type 1 is a boss monster

myIntroText[0] = $"* {myName} waddled close!"; //The text that the narrator says in the first turn
myIntroText[1] = $"* Two {myName}s skedaddled towards&you!"; //The text that the narrator says in the first turn
myIntroText[2] = $"* The ocean reveals three&{myName}s!"; //The text that the narrator says in the first turn

//Bosses n' stuff
spareable = false; //If you can spare the monster
outSprite = sprBAddleSpare;
inactive = false; //If this object should not be doing anything

order = 0;
spriteOrder = 0;

fleeable = true;

//Acting-related variables
rightActs = 0; //The amount of right acts you've done
whichAct = 2; //The act that must be done to increment rightActs

//Flavor text of this monster
#region Flavor Text

//Flavor text for single Froggit
myFlavorText[0, 0] = "* It's Temaddle."; //Flavor text 0
myFlavorText[0, 1] = "* Smells like the ocean."; //Flavor text 1
myFlavorText[0, 2] = "* GUYS I CAUGHT A WATER POKEMON."; //Flavor text 1
myFlavorText[0, 3] = "* Its a bit cool in here..."; //Flavor text 2
myFlavorText[0, 4] = "* How did Temaddles legs detach?"; //Flavor text 3
myFlavorText[0, 5] = "* You look in the water and&see Temaddle!"; //Flavor text 4
myFlavorText[0, 6] = "* I mined a diamond guys!!!."; //Flavor text 4
myFlavorText[0, 7] = "* Wiggling with my friend!"; //Flavor text 5

//Flavor text for double froggit
myFlavorText[1, 0] = "* It's two Temaddles.";
myFlavorText[1, 1] = "* You're soaked in water";
myFlavorText[1, 2] = "* You got a load of fish! Wait,&thats not fish.";
myFlavorText[1, 3] = "* Skeddadle tried to be cool.&You start freezing.";
myFlavorText[1, 4] = "* Line of the day:&urMom.pickedUp[urDad]";
myFlavorText[1, 5] = "* Wiggling with my group!!";

//Flavor  text for triple froggit
myFlavorText[2, 0] = "* Three Temaddles? So pog.";
myFlavorText[2, 1] = "* Wiggling with my gang!!!";
myFlavorText[2, 2] = "* You notice them moving in&unison.";

#endregion

//The dialogue this monster says
#region Dialogue

//myDialogue is the dialogue that the game uses randomly during turns
myDialogue[0] = "Splurgle.";
myDialogue[1] = "*Wiggles cutely*";
myDialogue[2] = "Wurgle (Am I cool&enough dad?)";

//myActDialogue is the dialogue that the monster says when you act a certain way
myActDialogue[0] = "Wiggle wiggle&(Im cooler than ever!)";
myActDialogue[1] = "*Disgusted* wurgle...&(I hate being hot)";

//The dialogue when global.turn = 1
myTurnDialogue[0] = "Wurgle.&(Where are my&scales?)";
myTurnDialogue[1] = "*Choking*&(I have become&one with the ice)";

#endregion

//The lines the narrator says (mostly)
#region Narrator

//The text the narrator says when you act a certain way
myActText[0] = "* Temaddle was interested by&your dance.";
myActText[1] = "* Temaddle became irritated&and wants an apology.";

//The ACT options you have
myAct[0] = "* Dance";
myAct[1] = "* Heat up";
myAct[2] = "";

//The text the narrator says when you check the monsters
myInfo = "* TEMADDLE - ATK 10 DEF 6&* His lifelong dream is to be cool.";

#endregion

//Monster Stats
#region Stats
myHP = 50; //The HP of this monster
myMaxHP = 50;

myATK = 10; //The attack of this monster
myDef = 6; //The defense of this monster

myEXP = 30; //The EXP this monster rewards
myGold = 50; //The Gold this monster rewards

myBarSize = 10;

mySequence = -1;
reqSequence = sqTemaddle; //The sequence that the object wants created
#endregion

#region Attacks

spawnCounter = 0;
priority[0] = 2;
priority[1] = 1.1;

chosen[0] = false;
chosen[1] = false;

warner = -1;
arrow = -1;

scaleCount = 0;

#endregion

//Bubble spawning position (defaults to top middle)
bubbleX = objBM.monsterPos[0, spriteOrder];
bubbleY = 50;

grounded = true;

currAttack = 0;