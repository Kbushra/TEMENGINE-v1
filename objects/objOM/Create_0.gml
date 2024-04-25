//@desc Overworld Manager
playingSound = false;

sndIndex = -1;

#region Heart Animation

global.showHeart = false;

alpha = 0; //Alpha for the showHeart thingy
zoom = 0; //Zoom for the showHeart thingy
move = 0; //Move for the showHeart thingy

#endregion

once[0] = false; //Cringe variable montage
once[1] = false; //Cringe variable montage x 2

flag[0] = 0;

memo = false;

instance_create_layer(x, y, "Managers", objMM);