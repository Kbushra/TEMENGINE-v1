/// @description Drawing HUD & Fade In

var camX;
var camY;

var camWidth;
var camHeight;

camX = camera_get_view_x(view_camera[0]);
camY = camera_get_view_y(view_camera[0]);

camWidth = camera_get_view_width(view_camera[0]);
camHeight = camera_get_view_height(view_camera[0]);

#region Battle HUD

if global.battling || soulSprite != -1 {
	
	draw_set_font(fntMenu);
	
	draw_set_color(c_white);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	draw_text_transformed(25, 401, global.name, 1.5, 1.5, image_angle);
	draw_text_transformed(140, 401, "LV " + string(global.love), 1.5, 1.5, image_angle);
	draw_text_transformed(260, 403, "HP", 1.2, 1.2, image_angle);
	draw_text_transformed(objHP.rBorder + 10, 402, string(global.hp) + " / " + string(global.maxHp), 1.5, 1.5, image_angle);
}
#endregion

if global.battling {
	
	fade ++;
	
	draw_set_alpha(ease(1, 0, 60, fade, 0)); //Slowly darken everything
	
	//Darken stuff
	draw_rectangle_color(camX, camY, (camX + camWidth) * 2, (camY + camHeight) * 2,
		c_red, c_red, c_red, c_red, false);
		
	draw_set_alpha(1);
}
depth = 0;