if mode = 0 {

	draw_sprite_ext(sprRHealth, 0, objBM.namePos[0, objBM.selection[0]] + 302, objBM.namePos[1, objBM.selection[0]], scale2, 1, 0, -1, 1);
	draw_sprite_ext(sprGHealth, 0, objBM.namePos[0, objBM.selection[0]] + 302, objBM.namePos[1, objBM.selection[0]], scale1, 1, 0, -1, 1);
	
	
} else {
	
	damageY = lerp(damageY, y, 0.2);
	
	draw_sprite_ext(sprRHealth, 0, x, y, scale2, 1, 0, -1, 1);
	draw_sprite_ext(sprGHealth, 0, x, y, scale1, 1, 0, -1, 1);
	
	draw_set_font(objBM.damageFont);
	
	draw_set_color(c_red);
	
	draw_set_halign(fa_middle);
	draw_set_valign(fa_bottom);

	draw_text(x + (25 * scale2) / 2, damageY - 15, objBM.damage);
}