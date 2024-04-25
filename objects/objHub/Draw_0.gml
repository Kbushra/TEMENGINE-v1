#region Drawing lol

draw_set_font(fntUndertale);

draw_sprite_ext(sprMenuBGs, global.hubStage, x, y, image_xscale, image_yscale, 0, c_white, 1);

draw_text(50, 70, global.name);
draw_text(150, 70, "LV " + string(global.love));
draw_text(250, 70, $"{string(minutes)}:{string(seconds)}");

draw_text(50, 90, global.spwnName);

if selection == 0 { draw_set_color(c_yellow); }
draw_text(80, 130, "Continue");
if selection == 1 { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
draw_text(190, 130, "Reset");
draw_set_color(c_white);

#endregion