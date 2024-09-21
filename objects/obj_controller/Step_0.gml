/// @description 

//define view vars
roomTotalSize = (ROOM_SIZE_TILE * TILE_SIZE);
roomXViewStart = roomX * (roomTotalSize - TILE_SIZE);
roomYViewStart = roomY * (roomTotalSize - TILE_SIZE);
roomXViewEnd = roomXViewStart + roomTotalSize;
roomYViewEnd = roomYViewStart + roomTotalSize;

//calculates the shared tile offset for when we navigate rooms, since each room shares the outer-most
//tiles. This helps fix that
var poopfartnutsX = mouse_x - (roomXViewStart);
var poopfartnutsY = mouse_y - (roomYViewStart);

//keep track of the tile and room that the mouse is currently hovering over
mouseTileX_Visual = (poopfartnutsX div TILE_SIZE) % (ROOM_SIZE_TILE);
mouseTileY_Visual = (poopfartnutsY div TILE_SIZE) % (ROOM_SIZE_TILE);
mouseTileX = (mouse_x div TILE_SIZE);
mouseTileY = (mouse_y div TILE_SIZE);
//mouseRoomX = (mouse_x div (roomTotalSize));
//mouseRoomY = (mouse_y div (roomTotalSize));
mouseIsInRoomBounds = mouse_x > roomXViewStart && mouse_y > roomYViewStart && mouse_x < roomXViewEnd && mouse_y < roomYViewEnd;

//move camera position to room center
camera.x = lerp(camera.x, (roomXViewStart) + ((roomTotalSize - TILE_SIZE) / 2), 0.1);
camera.y = lerp(camera.y, (roomYViewStart) + ((roomTotalSize - TILE_SIZE) / 2), 0.1);

//start holding new object
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, obj_tileParent) && mouseIsInRoomBounds){
	
	//cannot hold protected object
	var inst = instance_position(mouse_x, mouse_y, obj_tileParent);
	if (!inst.protected){
		objectHolding = inst;
		show_debug_message($"moving {objectHolding.name}");
	}else{
		TryCreateProtectedIndicator(inst);
		show_debug_message($"cannot hold protected tile: {inst.name}");
	}

//create new object when mouseing and pressing over empty tile spaces
}else if (mouse_check_button(mb_left) && !position_meeting(mouse_x, mouse_y, [obj_tileParent, obj_genericPropertyParent]) && mouseIsInRoomBounds){
	
	//create the object if it's in a valid spot and we have a library object selected and we are not holding an object
	if (mouseTileX >= 0 && mouseTileY >= 0 && mouseTileX <= TILE_MAX_NUMBER && mouseTileY <= TILE_MAX_NUMBER && objectLibrarySelectedIndex >= 0 && !objectHolding){	
		
		//create the object, set its position properties, and mark it as selected
		var inst = instance_create_layer(mouseTileX, mouseTileY, layer, library[objectLibrarySelectedIndex].data);
		SetGeneralPosition(roomX, roomY, mouseTileX, mouseTileY, inst);
		objectSelected = inst;
		
		//clear existing property boxes
		HideDropdownMenus();
		with (obj_genericPropertyParent){
			instance_destroy();
		}
		
		//create property boxes for this object
		objectSelected.ShowPropertyBoxes();
		
		show_debug_message($"created new {library[objectLibrarySelectedIndex].name} at tile: ({inst.tileX}, {inst.tileY})  room: ({inst.roomX}, {inst.roomY})");
	}
}else if (mouse_check_button(mb_left) && !position_meeting(mouse_x, mouse_y, [obj_tileParent, obj_genericPropertyParent]) && !mouseIsInRoomBounds){
	//clear existing property boxes
	HideDropdownMenus();
	with (obj_genericPropertyParent){
		instance_destroy();
	}
	
	//deselect object
	objectSelected = noone;
}

//release currently held object
if (mouse_check_button_released(mb_left)){
	if (objectHolding){
		
		//check if we are mousing over outside of the room area
		if (mouseTileX < 0 || mouseTileY < 0 || mouseTileX > TILE_MAX_NUMBER || mouseTileY > TILE_MAX_NUMBER){
			//destroy it
			show_debug_message($"deleted {objectHolding.name}");
			instance_destroy(objectHolding);
			objectHolding = noone;
			return;
		}
		
		//check if a tile object already exists at the target location
		if (!position_meeting(mouse_x, mouse_y, obj_tileParent)){
			SetGeneralPosition(roomX, roomY, mouseTileX, mouseTileY, objectHolding);
			show_debug_message($"new {objectHolding.name} position set: tile:({objectHolding.tileX}, {objectHolding.tileY}), room: ({objectHolding.roomX}, {objectHolding.roomY})");
		}
				
		//set object as selected
		objectSelected = objectHolding;
		
		//clear existing property boxes
		HideDropdownMenus();
		with (obj_genericPropertyParent){
			instance_destroy();
		}
		
		//create property boxes for this object
		objectSelected.ShowPropertyBoxes();
		
		show_debug_message($"selected {objectHolding.name}");
		
		//we are no longer holding an object
		objectHolding = noone;
	}
}

//delete the object we are mousing over
if (mouse_check_button(mb_right) && position_meeting(mouse_x, mouse_y, obj_tileParent)){
	var inst = instance_position(mouse_x, mouse_y, obj_tileParent);
	
	//don't delete object if protected
	if (!inst.protected){
		//clear dropdown boxes if the object we're destroying is the currently selected object
		if (objectSelected == inst){
			//clear existing property boxes
			HideDropdownMenus();
			with (obj_genericPropertyParent){
				instance_destroy();
			}
		
			objectSelected = noone;
		}
	
		show_debug_message($"deleted {inst.name}");
		instance_destroy(inst);
	}else{
		TryCreateProtectedIndicator(inst);
		show_debug_message($"cannot delete protected tile: {inst.name}");
	}
}