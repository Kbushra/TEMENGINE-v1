halfMemo = false;

if global.doorID == doorID { 
	
	switch(dir) {
		
		case "C":
		
		objFrisk.x = x;
		objFrisk.y = y;
		
		objFrisk.dir = "D";
		
		instance_destroy();
		break;
		
		case "R":
		
		objFrisk.x = x + 20;
		objFrisk.y = y;
		break;
		
		case "L":
		
		objFrisk.x = x - 20;
		objFrisk.y = y;
		break;
		
		case "D":
		
		objFrisk.x = x;
		objFrisk.y = y + 20;
		break;
		
		case "U":
		
		objFrisk.x = x;
		objFrisk.y = y - 20;
		break;
	}
	
	global.doorID = -1; 
}