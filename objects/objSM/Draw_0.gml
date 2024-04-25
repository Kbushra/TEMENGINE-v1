#region Boxes

//Font Alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);
	
draw_set_color(c_white); //Set color
	
draw_sprite_ext(sprBox, 0, 0, 120, 324/20, 120/20, 0, c_white, 1);
if mode != 1 && !talking { draw_sprite_ext(sprBox, 0, 215, 120, 109/20, 120/20, 0, c_white, 1); }
if mode == 0 { draw_sprite_ext(sprBox, 0, 215, 30, 109/20, 90/20, 0, c_white, 1); }

if mode == -1 {
	
	draw_text(heartPosX[0] + 20, heartPosY[0, 0] - 7, "BUY");
	draw_text(heartPosX[0] + 20, heartPosY[0, 1] - 7, "SELL");
	draw_text(heartPosX[0] + 20, heartPosY[0, 2] - 7, "TALK");
	draw_text(heartPosX[0] + 20, heartPosY[0, 3] - 7, "EXIT");
	draw_text(heartPosX[0] - 10, heartPosY[0, 3] + 18, string(global.gold) + "G");
	draw_text(heartPosX[0] + 40, heartPosY[0, 3] + 18, string(global.invLength) + "/10");
}
else if mode == 0 {
	
	for( var i = 0; i < 4; i++; ) { written[i] = false; }
	
	for( var i = 0; i < array_length(keeper.itemBuy); i++; )
	{ draw_text(heartPosX[1] + 20, heartPosY[1, i] - 7, "* " + keeper.itemBuy[i].myName + " - " + string(keeper.itemPrice[i]) + "G"); written[i] = true; }
	
	for( var i = 3; i >= array_length(keeper.itemBuy); i--; )
	{ if !written[i] { draw_text(heartPosX[1] + 20, heartPosY[1, i] - 7, "----------------"); } }
	
	draw_text(heartPosX[1], heartPosY[1, 3] + 10, string(global.gold) + "G");
	draw_text(heartPosX[1] + 150, heartPosY[1, 3] + 10, string(global.invLength) + "/10");
	
	draw_text(225, 55, keeper.itemBuy[selection].myBuyInfo);
}
else if mode == 2 && !talking {
	
	for( var i = 0; i < array_length(keeper.topic); i++; )
	{ draw_text(heartPosX[1] + 20, heartPosY[1, i] - 7, "* " + keeper.topic[i]); }
}
else if mode == 1 && !talking {
	
	for( var i = 0; i < global.invLength; i++; ) {
		
		if i > 7 { break; }
		
		if i < 4 { draw_text(heartPosX[1] + 20, heartPosY[2, i] - 7, "* " + global.itemID[global.inventory[i]].myName + " - " + string(keeper.sellPrice[global.inventory[i]]) + "G"); }
		else { draw_text(heartPosX[2] + 20, heartPosY[2, i] - 7, "* " + global.itemID[global.inventory[i]].myName + " - " + string(keeper.sellPrice[global.inventory[i]]) + "G"); }
	}
}

#endregion

draw_set_alpha(!talking);

if mode != 1 || selection > 3 { draw_sprite(sprMenuSoul, 0, heartPosX[pos], heartPosY[pos, selection]); }
else if mode == 1 { draw_sprite(sprMenuSoul, 0, heartPosX[1], heartPosY[2, selection]); }

draw_set_alpha(1);