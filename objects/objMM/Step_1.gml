if camera_get_view_y(view_camera[0]) + 120 > objFrisk.y { boxY[3] = 30; boxY[1] = 145; boxY[2] = 300; }
else { boxY[3] = 340; boxY[1] = 185; boxY[2] = 340; }

menuPos[0, 0] = boxY[1] + 38;
menuPos[1, 0] = boxY[1] + 74;
menuPos[2, 0] = boxY[1] + 110;

if global.n && chatbox == 0 { menu --; if menu = 0 { pos = mode; } if menu = 1 { pos = selectedItem; } } //X to go back

if menu = -1 { global.onMenu = false; } //Prevent game crashing lol

if global.onMenu { //Heart selection and different menus
	
	#region Functionality
	
	if global.y {
		
		if menu == 0 { 
			if pos != 0 { menu ++; mode = pos; pos = 0; } 
			else if global.invFree != 0 { menu ++; mode = pos; pos = 0; } 
			exit;
		}
			
		else if menu == 1 && mode == 0 {
			if !swapping { menu ++; selectedItem = pos; pos = 0; }
			else {
				var temp = global.inventory[selectedSwap];
				
				global.inventory[selectedSwap] = global.inventory[pos];
				global.inventory[pos] = temp;
				
				swapping = false;
			}
		} 
		
		else if menu == 1 && mode == 2 {
			
			selectedItem = pos;
			
			if boxY[3] == 30 { chatboxPos = 0; }
			else { chatboxPos = 1; }
			
			chatbox = instance_create_layer(x, y, "Chatbox", objChatbox);
			
			chatbox.chatboxOrigin = id;
			chatbox.textToDraw = "* Ringing...";
			chatbox.closeMenu = true;
			
			global.y = false;
			
			global.onMenu = false;
			
			audio_pause_all();
			audio_play_sound(sndRing, 10, false);
			
			if global.availableContacts[selectedItem] == 1 { global.startDialogue = 0; global.dialogueCount = 2; }
			else if global.availableContacts[selectedItem] == 2 { global.startDialogue = 0; global.dialogueCount = 1; }
			
			for( var i = 0; i < global.dialogueCount; i++; ) { chatbox.textQueue[i] = global.contactDialogue[selectedItem, i + global.startDialogue]; }
		}
		
		else if menu == 2 {
			
			if pos == 0 && selectedItem > 7 { //If you SWAP an item
				
				menu --;
				pos = selectedItem;
				selectedSwap = selectedItem;
				swapping = true;
				
				exit;
			}
			
			if chatbox != 0 {
				
				instance_destroy(chatbox);
				chatbox = 0;
				
				if pos == 2 { global.onMenu = false; exit; }
				
				if global.inventory[selectedItem] == 0 && selectedItem == 0 { menu = 0; }
				else { menu = 1; }
				
				if global.inventory[selectedItem] != 0 { pos = selectedItem; }
				else { pos = 0; }
				exit;
			}
			
			if boxY[3] == 30 { chatboxPos = 0; }
			else { chatboxPos = 1; }
			
			chatbox = instance_create_layer(x, y, "Chatbox", objChatbox);
			
			chatbox.chatboxOrigin = id;
			
			
			if pos == 0 { //If you USE an item
				
				var selectItemID = global.itemID[global.inventory[selectedItem]]; //LOL
				
				var temp = global.weapon; //LOL^2
				var temp2 = global.armor; //LOL^3
				
				chatbox.textToDraw = selectItemID.myUseText;
				
				//Do each items action
				if selectItemID.myClass == 0 { global.weapon = global.inventory[selectedItem]; global.inventory[selectedItem] = temp; }
				else if selectItemID.myClass == 1 { global.armor = global.inventory[selectedItem]; global.inventory[selectedItem] = temp2; }
				else if selectItemID.myClass == 2 { global.healer = global.inventory[selectedItem]; audio_play_sound(sndHeal, 5, false); }
				
				if selectItemID.myClass == 2 {
					
					//Reorganize...
					global.inventory[selectedItem] = 0;
					
					for (var i = 0; i < global.invLength - 1 - selectedItem; i ++;) {
						
						global.inventory[selectedItem + i] = global.inventory[selectedItem + i + 1];
						global.inventory[selectedItem + i + 1] = 0;
					}
				}
				else { audio_play_sound(sndEquip, 10, false); }
			}
			else if pos == 1 
			{ chatbox.textToDraw = global.itemInfo[global.inventory[selectedItem]]; }
			else { 
				chatbox.textToDraw = $"* You dropped the {global.itemID[global.inventory[selectedItem]].myName}."; 
				
				//Reorganize...
				global.inventory[selectedItem] = 0;
				
				for( var i = 0; i < global.invLength - 1 - selectedItem; i++; ) {
					global.inventory[selectedItem + i] = global.inventory[selectedItem + i + 1];
					global.inventory[selectedItem + i + 1] = 0;
				}
			}
		}
	}
	
	#endregion
	
	#region Menu moving
	
	if menu == 0 || menu == 2 { posMax = 2; }
	if menu == 1 && mode == 0 { posMax = global.invLength - 1; }
	if menu == 1 && mode == 2 { posMax = global.contactLength - 1; }
	
	if menu == 1 && mode == 0 { selectedItem = pos; }
	
	if mode != 1 || menu != 1 { if menu != 2 {
		
		if global.dPressed { pos ++; if pos > posMax { pos = 0; } }
		if global.uPressed { pos --; if pos < 0 { pos = posMax; } }
		
	} else {
	
		if global.rPressed { pos ++; if pos > posMax { pos = 0; } }
		if global.lPressed { pos --; if pos < 0 { pos = posMax; } }
		
	} }
	
	#endregion
	
} else { pos = 0; mode = 0; menu = 0; }