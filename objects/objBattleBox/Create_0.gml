//Default width and height for the player's turn
chatWidth = 600;
chatHeight = 140;

//Default width and height for the monster's turn
battleWidth = 140;
battleHeight = 140;

bbWidth = 600; //Battle Box width (in pixels)
bbHeight = 140; //Battle Box height (in pixels)

chatX = 320;
chatY = 320;

battleX = 320;
battleY = 320;

bbX = 320;
bbY = 320;

lBorder = x - (sprite_width / 2) + 10;
rBorder = x + (sprite_width / 2);

uBorder = y - (sprite_height / 2) + 3;
dBorder = y + (sprite_height / 2);

sizeChanging = false;

global.battleSurface = -1;

#region Monsters turn

atkLength = 300;
currLength = 300;
atkStarted = false;
MMHp = global.maxHp;

queuedDmg = 0;
queuedMDmg = 0;

preventChange = false;

change1 = false; //Used to scale battlebox to default scale before scaling to attack scale
once = true;

#endregion