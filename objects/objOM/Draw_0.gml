var camX;
var camY;

var camWidth;
var camHeight;

camX = camera_get_view_x(view_camera[0]);
camY = camera_get_view_y(view_camera[0]);

camWidth = camera_get_view_width(view_camera[0]);
camHeight = camera_get_view_height(view_camera[0]);

if flag[0] == 1 && global.friskState == 1 { 
	
	draw_sprite(sprAlert, 0, objFrisk.x, objFrisk.y - objFrisk.sprite_height / 2);
}

if global.showHeart {
	
	draw_set_alpha(ease(0, 0.75, 1, alpha, 0)); //Slowly darken everything
	
	//Darken stuff
	draw_rectangle_color(camX, camY, camX + camWidth, camY + camHeight,
		c_black, c_black, c_black, c_black, false);
	
	//Draw soul
	draw_sprite_ext(sprSoul, 0, objFrisk.x, objFrisk.y, 
		0.5, 0.5, 0, c_white, alpha);
	
	//Zoom camera in
	camera_set_view_size(view_camera[0], ease(camWidth, 2, 20, zoom, 1), ease(camHeight, 2, 20, zoom, 1));
		
	draw_set_alpha(1);
}