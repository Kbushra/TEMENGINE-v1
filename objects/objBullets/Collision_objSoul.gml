if myType == 0 {
	objBattleBox.queuedDmg += myDamage;
	instance_destroy();
}
else if myType == 1 && objSoul.moving {
	objBattleBox.queuedDmg += myDamage;
	instance_destroy();
}
else if myType == 2 && !objSoul.moving {
	objBattleBox.queuedDmg += myDamage;
	instance_destroy();
}
else if myType == 3 {
	global.healer = -1;
	instance_destroy();
}
else if myType == 4 {
	objBattleBox.queuedMDmg += myDamage;
	instance_destroy();
}