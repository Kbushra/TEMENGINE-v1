if flag > 0 {  
	
	depth = objFrisk.depth + 1;
	
	if flag < 2 { draw_sprite(sprCharaDI, charaFrame, objFrisk.x, 100 + charaY); }
		else if flag < 4 { draw_sprite(sprCharaDS, charaFrame, objFrisk.x, 100 + charaY); }
			else if flag < 6 { draw_sprite(sprCharaDI, charaFrame, objFrisk.x, 100 + charaY); }
}