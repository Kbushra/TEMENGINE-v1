/// @description Dialogue updating

if rightActs == 1 { spareable = true; }

if reqSequence == -1 { inactive = true; }

bubbleX = objBM.monsterPos[0, spriteOrder];

if objBM.bubbleSprite == sprBubbleBig {
	
	//myDialogue is the dialogue that the game uses randomly during turns
	myDialogue[0] = "Ribbit, ribbit.&(hOI, HOOMAN!!!!)";
	myDialogue[1] = "Ribbit, ribbit.&(me name FROGGIT!!!!)";
	myDialogue[2] = "*Sexy frog noises*";

	//myActDialogue is the dialogue that the monster says when you act a certain way
	myActDialogue[0] = "*Blushes deeply*&Ribbit...";
	myActDialogue[1] = "*Shaking*&RIBBIT, RIBBIT!?";
	
	//The dialogue when global.turn = 1
	myTurnDialogue[0] = "TeMmit lik tEm!1!!";
	myTurnDialogue[1] = "i h3ppy!";
} else {
	//myDialogue is the dialogue that the game uses randomly during turns
	myDialogue[0] = "Ribbit,&ribbit.&(hOI,&HOOMAN!!!!)";
	myDialogue[1] = "Ribbit,&ribbit.&(me name&FROGGIT!!!!)";
	myDialogue[2] = "*Sexy&frog&noises*";

	//myActDialogue is the dialogue that the monster says when you act a certain way
	myActDialogue[0] = "*Blushes&deeply*&Ribbit...";
	myActDialogue[1] = "*Shaking*&RIBBIT,&RIBBIT!?";
	
	//The dialogue when global.turn = 1
	myTurnDialogue[0] = "TeMmit&lik&tEm!1!!";
	myTurnDialogue[1] = "i h3ppy!";
}