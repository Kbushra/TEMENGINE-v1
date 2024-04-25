image_alpha = 0;

memo = false;
if !variable_global_exists("memo") { global.memo = false; }

global.itemNum = 5;
global.cutsceneNum = 1; //Only for 1 time cutscenes
global.flagNum = 3;

global.cutsceneName[0] = "Chara stops you advancing";

for(var i = 0; i <= global.itemNum; i ++) { global.itemID[i] = asset_get_index("objItem" + string(i)); }
for(var i = 0; i <= global.itemNum; i ++) { instance_create_layer(0, 0, "Managers", global.itemID[i]); }

if !variable_global_exists("prevLove") { global.prevLove = 1; }

#region Pause

pauseSelect = 0;

pauseSelectPlus[0] = 0; //X
pauseSelectPlus[1] = 0; //Y

pauseMenu = 0;
volumeTimer = 30;

selectingControl = false;
inputKey = 0;

transition = false;

#endregion

global.gameStarted = false;
global.textDefSpeed = 2;