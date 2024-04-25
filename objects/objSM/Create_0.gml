#region Sprites and music

keeper = instance_create_layer(162, 124, "Managers", global.shopkeeper);
shop = layer_sprite_create("Shop", 0, 0, sprShopBGs);
layer_sprite_index(shop, keeper.bg);

audio_play_sound(keeper.mus, 10, true);
global.playSong = false;
global.chatting = 0;

#endregion

#region MENU

selection = 0;
mode = -1;
selectLimit = 3; //Starts at 0

pos = 0;

chatbox = 0;
chatpos = 0;
talking = false;

transition = false;

written[0] = false;

//0 for no mode, 1 for all modes, 2 for sell
heartPosX[0] = 240;
heartPosX[1] = 15;
heartPosX[2] = 160;

heartPosY[0, 0] = 137;
heartPosY[0, 1] = 157;
heartPosY[0, 2] = 177;
heartPosY[0, 3] = 197;

heartPosY[1, 0] = 142;
heartPosY[1, 1] = 162;
heartPosY[1, 2] = 182;
heartPosY[1, 3] = 202;

heartPosY[2, 0] = 142;
heartPosY[2, 1] = 167;
heartPosY[2, 2] = 192;
heartPosY[2, 3] = 217;
heartPosY[2, 4] = 142;
heartPosY[2, 5] = 167;
heartPosY[2, 6] = 192;
heartPosY[2, 7] = 217;

#endregion