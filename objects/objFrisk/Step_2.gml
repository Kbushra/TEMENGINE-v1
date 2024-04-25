//Overworld encounters!
if canEncounter && global.friskState == 0 {

	if state != "I" {
	
		encounterTime --;
	
		if encounterTime <= 0 {
		
			encountered = true;
			encounterTime = random_range(300, 1000);
		}
	}
}