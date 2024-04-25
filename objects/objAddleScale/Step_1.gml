/// @description Actions specific to this bullet
if !variable_instance_exists(id, "flipped") { flipped = false; }

x -= 10;
if x < objBattleBox.lBorder - 20 && !flipped { instance_destroy(); }
if x < objBattleBox.lBorder + 60 && flipped { instance_destroy(); }
if flipped { image_angle = 180; flipped = true; }