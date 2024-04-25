if monsterRef = -1 { exit; }

#region Bubble Position

image_alpha = 1;

image_index = !monsterRef.grounded;

if sprite_index == sprBubbleBig {
	
	x = monsterRef.bubbleX - 20;
	y = monsterRef.bubbleY;

} else if sprite_index == sprBubbleMed {
	
	if image_index == 0 {
	
		x = monsterRef.bubbleX + 150;
		y = monsterRef.bubbleY + 100;
	
	} else {
		
		x = monsterRef.bubbleX - 100;
		y = monsterRef.bubbleY + 100;
	}

} else if sprite_index == sprBubbleSmol {

	if image_index == 0 {
	
		x = monsterRef.bubbleX + 100;
		y = monsterRef.bubbleY + 100;
	
	} else {
		
		x = monsterRef.bubbleX - 100;
		y = monsterRef.bubbleY + 100;
	}
}

#endregion

#region Update Properties

//Convert pixels to scale (20 is the textbox's default size)
image_xscale = lerp(image_xscale, 1, 0.2);
image_yscale = lerp(image_yscale, 1, 0.2);

//Update writeX and writeY
writeX = x;
writeY = y;

#endregion