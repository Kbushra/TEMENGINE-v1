if global.m { if global.friskState == 0 || global.onMenu { global.onMenu = !global.onMenu; } }

if global.invFree != -1 { global.invLength = global.invFree; } else { global.invLength = 10; }

#region Stat updates

switch(global.weapon) {
	
	case 2: 
	global.weaponAtk = 2;
	break;
	
	default:
	
	global.weaponAtk = 0;
	break;
}

switch(global.armor) {
	
	case 3:
	global.armorDef = 0;
	break;
	
	case 4:
	global.armorDef = 2;
	break;
	
	default: break;
}

switch(global.healer) {
	
	case -1: //Healing bullets
	if global.hp + 2 <= global.maxHp { global.hp += 2; }
	else { global.hp = global.maxHp; }
	
	audio_play_sound(sndHeal, 10, false);
	global.healer = 0;
	break;
	
	case 5:
	if global.hp + 5 <= global.maxHp { global.hp += 5; }
	else { global.hp += global.maxHp - global.hp; }
	
	global.healer = 0;
	break;
	
	default: break;
}

if global.prevLove != global.love && global.love != 20 {
	global.maxHp = 16 + (4 * global.love);
	global.hp = global.maxHp;
	global.attack = -2 + (2 * global.love);
	global.defense = floor((global.love - 1) / 4);

	global.prevLove = global.love;
}
else if global.prevLove != global.love {
	global.maxHp = 99;
	global.hp = global.maxHp;
	global.attack = 999;
	global.defense = 999;
	
	global.prevLove = global.love;
}
	
#endregion