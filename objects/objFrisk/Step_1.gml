sprite_index = asset_get_index("sprFrisk" + dir + state + global.friskAppearance); //Setting Frisk's Sprite

//Setting "global.refRoom" to the room Frisk was in before a battle
if room != rmBattle && room != rmShop { global.refRoom = room; }

depth = -bbox_bottom;