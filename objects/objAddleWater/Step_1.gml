/// @description Actions specific to this bullet
depth = 410;

if !variable_instance_exists(id, "up") { up = 0; }

image_xscale = objBattleBox.battleWidth / 64 - 0.2;
if y > objBattleBox.uBorder - 10 { image_yscale += 0.08; y -= 1.12; up += 1.12 }
