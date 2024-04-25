dest = (start - objBM.damage / objBM.selectMonster.myBarSize);

if mode == 0 {
	
	scale1 = objBM.selectMonster.myHP / objBM.selectMonster.myBarSize;
	scale2 = objBM.selectMonster.myMaxHP / objBM.selectMonster.myBarSize;
}

if mode == 1 {

	prog += 1;

	scale1 = ease(start, dest, 45, prog, 0);
	scale2 = objBM.selectMonster.myMaxHP / objBM.selectMonster.myBarSize;
}

if scale1 <= 0 { scale1 = 0; }

if move == 0 { y = lerp(y, targetPos, 0.1); }
if move == 1 { y = lerp(y, -30, 0.175); }

if move == 1 && y <= -28 { instance_destroy(); }