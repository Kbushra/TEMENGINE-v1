image_alpha = 0;

chatboxWidth = 80; //This variable defines the chatbox's width in pixels
chatboxHeight = 160; //This variable defines the chatbox's height in pixels

//Convert pixels to scale (20 is the textbox's default size)
image_xscale = 1;
image_yscale = 1;

//Text
writeX = x;
writeY = y;

textToDraw = ""; //Text to draw
textLength = 0; //How much of the text we have drawn

textDelay = 2; //Delay of every letter
currentDelay = 0; //Delay counter

canAdvance = true; //If the player can advance to the next page of the text
isWriting = true; //If the chatbox is writing

page = 0; //Current page

defaultColor = c_black;

chatboxOrigin = noone;
monsterRef = -1;