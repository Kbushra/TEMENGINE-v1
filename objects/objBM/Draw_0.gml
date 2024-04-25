///@desc Draw all of the menus (duh)

if global.turn == 0 && global.battling && !attacking {
	
	if menu == 1 { //Draw 1st Menu
		
		if chatbox != 0 { instance_destroy(chatbox); }
		
		//Setting up draw
		set_up_text(fntItems, c_white, fa_left, fa_top);
	
		draw_battle_menu_items(0); //Actually draw things
	}
	else if menu == 2 { //Draw 2nd menu
		
		if chatbox != 0 { instance_destroy(chatbox); }
		
		//Setting up draw
		set_up_text(fntItems, c_white, fa_left, fa_top);
	
		draw_battle_menu_items(1); //Actually draw things
	}
}

if attackedMonster != -1 {
    
    draw_sprite_part(attackedMonster.outSprite, 0, 0, down, 
    sprite_get_width(attackedMonster.outSprite), sprite_get_height(attackedMonster.outSprite) - down,
    monsterPos[0, attackedMonster.spriteOrder], monsterPos[1, attackedMonster.spriteOrder] + down);
	
    down += 3;
    
    if down >= sprite_get_height(attackedMonster.outSprite) {
        down = 0;
        attackedMonster = -1;
    }
}