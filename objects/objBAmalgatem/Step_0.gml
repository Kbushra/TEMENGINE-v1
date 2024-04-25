bubbleX = objBM.monsterPos[0, spriteOrder] + 80;
bubbleY = 50;

//The dialogue this monster says
#region Dialogue

if objBM.bubbleSprite == sprBubbleBig {

	//myDialogue is the dialogue that the game uses randomly during turns
	myDialogue[0] = "zzzzzz";
	myDialogue[1] = "ZZZZZZZZ";
	myDialogue[2] = "Tem waNt SLEEP";

	//myActDialogue is the dialogue that the monster says when you act a certain way
	myActDialogue[0] = "mMmMmmm";

	//The dialogue when global.turn = 1
	myTurnDialogue[0] = "TeM hate thIs...";
}
else {

	//myDialogue is the dialogue that the game uses randomly during turns
	myDialogue[0] = "zzz&zzz";
	myDialogue[1] = "ZZZZ&ZZZZ";
	myDialogue[2] = "Tem&waNt&SLEEP";

	//myActDialogue is the dialogue that the monster says when you act a certain way
	myActDialogue[0] = "mMmM&mmm";

	//The dialogue when global.turn = 1
	myTurnDialogue[0] = "TeM&hate&thIs...";
}

#endregion