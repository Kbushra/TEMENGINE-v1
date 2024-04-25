endBattle = false;

if global.cutscene != -1 && global.cutscene != objGameOver && global.cutscene != objIntro {
	
	chatboxPos = global.cutscene.chatboxPos;
	
	writerIndependent = global.cutscene.writerIndependent;
	image_alpha = !writerIndependent;
	
	scale = 1;
	
} else if global.cutscene == objGameOver {
	
	chatboxPos = 3; 
	writerIndependent = true;
	image_alpha = 0; 
	
	scale = 2;
	
} else if global.onMenu {

	chatboxPos = objMM.chatboxPos; 
	writerIndependent = false;
	image_alpha = 1; 
	
	scale = 1;

} else if room == rmBattle { 
	
	writerIndependent = true;
	image_alpha = 0;
	
	scale = 2;
	
} else if global.cutscene == objIntro {
    
	writerIndependent = true;
	image_alpha = 0;
    
    scale = 1;

} else if room == rmShop {
	
	writerIndependent = true;
	image_alpha = 0;
	
	scale = 1;
	
} else { 
	
	chatboxPos = 0;
	writerIndependent = false;
	image_alpha = 1;
	
	scale = 1;
}

chatboxPosX[0] = camera_get_view_x(view_camera[0]) + 20;
chatboxPosY[0] = camera_get_view_y(view_camera[0]) + 155;
chatboxPosX[1] = camera_get_view_x(view_camera[0]) + 20;
chatboxPosY[1] = camera_get_view_y(view_camera[0]) + 5;

chatboxMode = 0; //0 = regular text, 1 = 2 Choices

choice[0] = "";
choice[1] = "";

currChoice = 0;

if !writerIndependent { 

	x = chatboxPosX[chatboxPos];
	y = chatboxPosY[chatboxPos];
}

//Text
if !writerIndependent { writeX = x + 16; writeY = y + 12; } 
	else { writeX = x; writeY = y; }

choiceX[0] = (x + 100) - (string_length(choice[0]) * 2) - (string_length(choice[1]) * 2);
choiceX[1] = (x + 190) + (string_length(choice[1])) - ((string_length(choice[0]) * 2) + string_length(choice[0]));

//Face
faceX = x + 8;
faceY = y + 8;

textToDraw = ""; //Text to draw
textLength = 0; //How much of the text we have drawn

textDelay = global.textDefSpeed; //Delay of every letter
currentDelay = 0; //Delay counter

canAdvance = true; //If the player can advance to the next page of the text
canSkip = true; //If the player can skip the text
isWriting = true; //If the chatbox is writing

page = 0; //Current page

defaultColor = c_white;

//Monster-related stuff
currMonster = 0;

monsterID[0] = objNarrator;
monsterID[1] = objChatboxChara;
monsterID[2] = objChatboxFrisk;

chatboxOrigin = noone;

//Action
yesAction = "";
noAction = "";

//This variable reflects in which page a choice is present
choicePage = 999; //By default the value is 999

once = true; //*Lenny Face*

closeMenu = false;
cutscenePrevent = false;

npcName = "";
npcOffset = 0;
talking = false;

//Create all of the objects that talk in the chatbox
instance_create_layer(x, y, "Chatbox", monsterID[0]);
instance_create_layer(x, y, "Chatbox", monsterID[1]);
instance_create_layer(x, y, "Chatbox", monsterID[2]);