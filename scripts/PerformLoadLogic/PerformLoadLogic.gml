function PerformLoadLogic(){

	var file = file_text_open_read((get_open_filename("SOLAS128 level file|*.lvl", "")));
	
	//check if file exists
	if (file != -1){
		//read contents of file and perform logic
		var line = file_text_read_string(file);
		file_text_readln(file);	//next line
		while (!file_text_eof(file)){
			
			show_debug_message("reading: " + line);
			
			try{
			
				//ignore lines that begin with a #, which indicate comments
				if (string_char_at(line, 0) == "#" || line == "") {
					//perform line read
					line = file_text_read_string(file);
					file_text_readln(file);	//next line
				
					continue;
				}
		
				//divide line into 2 parts to be processed differently:
				//part 1 = obj coordinates, part 2 = object & properties
				var currentLine = string_split(line, "=");
				var lineCoords = string_split(currentLine[0], ",", true);
				var lineObj = string_split(currentLine[1], " ", true);
				var currentObj = noone;
		
				//find the object we need to create
				var objectList = tag_get_asset_ids("tile obj", asset_object);
				for (var i = 0; i < array_length(objectList); i ++){
					//use a temp instance to reference the name property of object
					var dummyInst = instance_create_depth(0, 0, 99999, objectList[i]);
			
					//determin if this is the right object (exclude certain tile objs)
					if (dummyInst.name == lineObj[0] && dummyInst.name != "empty"){
						currentObj = objectList[i];
				
						//delete temp instance
						instance_destroy(dummyInst);
				
						break;
					}
			
					//delete temp instance
					instance_destroy(dummyInst);
				}
		
				//if we found the object, then create it and set its properties
				if (currentObj != noone){
			
					//translate the room and tile coordinates to raw x and y values
					var rawTileX = real(lineCoords[2]) + (real(lineCoords[0]) * (ROOM_SIZE_TILE - 1));
					var rawTileY = real(lineCoords[3]) + (real(lineCoords[1]) * (ROOM_SIZE_TILE - 1));
					var xx = (rawTileX * TILE_SIZE) + (TILE_SIZE / 2);
					var yy = (rawTileY * TILE_SIZE) + (TILE_SIZE / 2);
			
					//if there is already an instance at the spot we are trying to create an object at, ignore
					if (!place_meeting(xx, yy, obj_tileParent)){
						//create our object
						var inst = instance_create_layer(xx, yy, "Instances", currentObj);
						SetGeneralPosition(real(lineCoords[0]), real(lineCoords[1]), rawTileX, rawTileY, inst);

						//call object-specific function to load in the properties back into each object properly
						inst.LoadLevelFileData([real(lineCoords[0]), real(lineCoords[1]), rawTileX, rawTileY], lineObj);
						inst.Update();
					}else{
						var msg = "Tried to create an object in a space that is already occupied! Ignoring";
						show_debug_message(msg);
						obj_controller.AddDebugText(msg);
					}
			
				}else{
					//unexpected item in the bagging area
					if (lineObj[0] != "empty"){
						var msg = $"could not create tile object: {lineObj[0]}. Foreign object, or missing tag?";
						show_debug_message(msg);
						obj_controller.AddDebugText(msg);
					}
				}
				
			}catch (error){
				obj_controller.AddDebugText(error.message);
				show_debug_message(error.longMessage + "\n" + error.script);
			}
		
			//perform line read
			line = file_text_read_string(file);
			file_text_readln(file);	//next line
		}
		
		//close the file
		file_text_close(file);
	}
}