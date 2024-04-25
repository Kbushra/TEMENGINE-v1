/// @description Dialogue updating

if rightActs == 1 { whichAct = 1; }
if rightActs == 2 { spareable = true; }

if reqSequence == -1 { inactive = true; }

bubbleX = objBM.monsterPos[0, spriteOrder];

if objBM.bubbleSprite == sprBubbleBig {
	
	//myDialogue is the dialogue that the game uses randomly during turns
	myDialogue[0] = "Splurgle.";
	myDialogue[1] = "*Wiggles cutely*";
	myDialogue[2] = "Wurgle (Am I cool&enough dad?)";

	//myActDialogue is the dialogue that the monster says when you act a certain way
	myActDialogue[0] = "Wiggle wiggle&(Im cooler than&ever!)";
	myActDialogue[1] = "*Disgusted* wurgle...&(I hate being hot)";

	//The dialogue when global.turn = 1
	myTurnDialogue[0] = "Wurgle.&(Where are my&scales?)";
	myTurnDialogue[1] = "*Choking*&(I have become&one with the ice)";
	
} else {
	//myDialogue is the dialogue that the game uses randomly during turns
	myDialogue[0] = "Splurgle.";
	myDialogue[1] = "*Wiggles&cutely*";
	myDialogue[2] = "Wurgle&(Am I cool&enough&dad?)";

	//myActDialogue is the dialogue that the monster says when you act a certain way
	myActDialogue[0] = "Wiggle&wiggle&(Im cooler&than ever!)";
	myActDialogue[1] = "*Disgusted*&wurgle...&(I hate&being hot)";

	//The dialogue when global.turn = 1
	myTurnDialogue[0] = "Wurgle.&(Where are&my scales?)";
	myTurnDialogue[1] = "*Choking*&(I have&become&one with&the ice)";
}