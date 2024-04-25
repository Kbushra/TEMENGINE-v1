///@desc Mask the attacks

depth = layer_get_depth("Sprites") - 50; //Set BG depth
draw_rectangle_color(lBorder + 3, uBorder + 3, rBorder - 3, dBorder - 3, c_black, c_black, c_black, c_black, false);

depth = layer_get_depth(layer); //Set correct depth

//Draw the bullets below the Battle Box, and mask them to the box
draw_surface_part_ext(global.battleSurface,
	lBorder, uBorder, bbWidth, bbHeight, bbX - bbWidth / 2, bbY - bbHeight / 2, 1, 1, c_white, 1);

surface_set_target(global.battleSurface);
draw_clear_alpha(c_black, 0);
surface_reset_target();

//Draw itself (with the right depth)
draw_self();