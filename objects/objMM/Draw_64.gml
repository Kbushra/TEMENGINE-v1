if global.onMenu {
	
	#region Drawing boxes
	
	//Font Alignment
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	draw_set_color(c_white); //Set color
	
	//Draw Box 1 (Name, Love, HP, Gold)
	draw_sprite_ext(sprBoxThick, 0, boxX[0], boxY[3], 140 / 40, 110 / 40, 0, c_white, 1);
	
	//Draw Box 2 (Items, Stats and Phone)
	draw_sprite_ext(sprBoxThick, 0, boxX[0], boxY[1], 140 / 40, 150 / 40, 0, c_white, 1);
	
	//Draw Box 3 (Extra Info)
	if mode == 0 { if menu >= 1 && chatbox == 0 {
		draw_sprite_ext(sprBoxThick, 0, boxX[1], boxY[0], 350 / 40, 370 / 40, 0, c_white, 1);
		draw_sprite_ext(sprBoxThick, 0, boxX[1], boxY[0] + 350, 350 / 40, 70 / 40, 0, c_white, 1);
	} }
	else if menu >= 1 && chatbox == 0 
		{ draw_sprite_ext(sprBoxThick, 0, boxX[1], boxY[0], 350 / 40, 420 / 40, 0, c_white, 1); }
	
	//Box 1 Text 
	draw_set_font(fntUndertale);
	draw_text_transformed(boxX[0] + 16, boxY[3] + 12, global.name, 2, 2, 0);
	
	draw_set_font(fntMenu);
	draw_text(boxX[0] + 16, boxY[3] + 48, "LV");
	draw_text(boxX[0] + 50, boxY[3] + 48, string(global.love));
		
	draw_text(boxX[0] + 16, boxY[3] + 65, "HP");
	draw_text(boxX[0] + 50, boxY[3] + 65, string(global.hp) + "/" + string(global.maxHp));
		
	draw_text(boxX[0] + 16, boxY[3] + 82, "G");
	draw_text(boxX[0] + 50, boxY[3] + 82, string(global.gold));
	
	//Box 2 Text
	draw_set_font(fntUndertale);
	
	if global.invFree == 0 { draw_set_alpha(0.5); } 
	
	draw_text_transformed(boxX[0] + 48, boxY[1] + 24, "ITEM", 2, 2, 0);
	draw_set_alpha(1);
	
	draw_text_transformed(boxX[0] + 48, boxY[1] + 60, "STAT", 2, 2, 0);
	draw_text_transformed(boxX[0] + 48, boxY[1] + 96, "CELL", 2, 2, 0);
	
	//Box 3 Text
	if chatbox == 0 { if menu == 1 || menu == 2 {
		
		switch (mode) {
			
			case 0:
			
			draw_text_transformed(boxX[1] + 48, boxY[0] + 24, global.itemID[global.inventory[0]].myName, 2, 2, 0);
			draw_text_transformed(boxX[1] + 48, boxY[0] + 56, global.itemID[global.inventory[1]].myName, 2, 2, 0);
			draw_text_transformed(boxX[1] + 48, boxY[0] + 88, global.itemID[global.inventory[2]].myName, 2, 2, 0);
			draw_text_transformed(boxX[1] + 48, boxY[0] + 120, global.itemID[global.inventory[3]].myName, 2, 2, 0);
			draw_text_transformed(boxX[1] + 48, boxY[0] + 152, global.itemID[global.inventory[4]].myName, 2, 2, 0);
			draw_text_transformed(boxX[1] + 48, boxY[0] + 184, global.itemID[global.inventory[5]].myName, 2, 2, 0);
			draw_text_transformed(boxX[1] + 48, boxY[0] + 216, global.itemID[global.inventory[6]].myName, 2, 2, 0);
			draw_text_transformed(boxX[1] + 48, boxY[0] + 248, global.itemID[global.inventory[7]].myName, 2, 2, 0);
			draw_text_transformed(boxX[1] + 48, boxY[0] + 280, "EXTRA: " + global.itemID[global.inventory[8]].myName, 2, 2, 0);
			draw_text_transformed(boxX[1] + 48, boxY[0] + 312, "EXTRA: " + global.itemID[global.inventory[9]].myName, 2, 2, 0);
			
			if pos < 8 && selectedItem < 8 { 
				draw_text_transformed(boxX[1] + (48), boxY[0] + 370, "Use", 2, 2, 0);
				draw_text_transformed(boxX[1] + (140), boxY[0] + 370, "Info", 2, 2, 0);
				draw_text_transformed(boxX[1] + (245), boxY[0] + 370, "Drop", 2, 2, 0);
			}
			else {
				draw_text_transformed(boxX[1] + (48), boxY[0] + 370, "Swap", 2, 2, 0);
				draw_text_transformed(boxX[1] + (140), boxY[0] + 370, "Info", 2, 2, 0);
				draw_text_transformed(boxX[1] + (245), boxY[0] + 370, "Drop", 2, 2, 0);
			}
			break;
			
			case 1:
			
			draw_text_transformed(boxX[1] + 30, boxY[0] + 24, "\"" + global.name + "\"", 2, 2, 0);
			draw_text_transformed(boxX[1] + 30, boxY[0] + 88, "LV " + string(global.love), 2, 2, 0);
			draw_text_transformed(boxX[1] + 30, boxY[0] + 120, "HP " + string(global.hp) + " / " + string(global.maxHp), 2, 2, 0);
			draw_text_transformed(boxX[1] + 30, boxY[0] + 184, "ATK " + string(global.attack + global.weaponAtk) + " (BASE " + string(global.attack) + ")", 2, 2, 0);
			draw_text_transformed(boxX[1] + 30, boxY[0] + 216, "DEF " + string(global.defense + global.armorDef) + " (BASE " + string(global.defense) + ")", 2, 2, 0);
			draw_text_transformed(boxX[1] + 30, boxY[0] + 280, "WEAPON: " + global.itemID[global.weapon].myName, 2, 2, 0);
			draw_text_transformed(boxX[1] + 30, boxY[0] + 312, "ARMOR: " + global.itemID[global.armor].myName, 2, 2, 0);
			draw_text_transformed(boxX[1] + 30, boxY[0] + 360, "GOLD: " + string(global.gold), 2, 2, 0);
			
			break;
			
			case 2:
			
			draw_text_transformed(boxX[1] + 48, boxY[0] + 24, global.contactID[global.availableContacts[0]], 2, 2, 0);
			draw_text_transformed(boxX[1] + 48, boxY[0] + 56, global.contactID[global.availableContacts[1]], 2, 2, 0);
			draw_text_transformed(boxX[1] + 48, boxY[0] + 88, global.contactID[global.availableContacts[2]], 2, 2, 0);
			draw_text_transformed(boxX[1] + 48, boxY[0] + 120, global.contactID[global.availableContacts[3]], 2, 2, 0);
			draw_text_transformed(boxX[1] + 48, boxY[0] + 152, global.contactID[global.availableContacts[4]], 2, 2, 0);
			
			break;
			
			default:
			break;
		}
	} }
	
	#endregion
	
	#region Heart Select
	
	if chatbox == 0 { if menu != 2 && mode != 1 {
		
		draw_sprite_ext(sprMenuSoul, 0, heartX[menu, 0], menuPos[pos, menu], 2, 2, 0, c_white, 1);
	} else if mode != 1 {  
		
		draw_sprite_ext(sprMenuSoul, 0, heartX[pos, 1], boxY[0] + 386, 2, 2, 0, c_white, 1);
	} else if menu == 0 {
		
		draw_sprite_ext(sprMenuSoul, 0, heartX[0, 0], menuPos[pos, 0], 2, 2, 0, c_white, 1);
	} else {
		
		draw_sprite_ext(sprMenuSoul, 0, heartX[0, 0], menuPos[1, 0], 2, 2, 0, c_white, 1);
	} }
	
	#endregion
}