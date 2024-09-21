function CreateColorPropertyBox(source, allowedColors, currentColor, yy){
	var inst = instance_create_layer(PROPERTY_BOX_CREATE_X, yy, "UI_Objs", obj_genericPropertyBox);
	with (inst){
		propertyName = "Color";
		for (var i = 0; i < array_length(allowedColors); i ++){
			array_push(options, [allowedColors[i], GetColorString(allowedColors[i])]);
			show_debug_message([allowedColors[i], GetColorString(allowedColors[i])]);
		}
		sourceTileObject = source;
		selectedText = GetColorString(currentColor);
		
		//define function to set color property
		function SetProperty(property){
			for (var i = 0 ; i < array_length(sourceTileObject.allowedColors); i ++){
				if (sourceTileObject.allowedColors[i] == property){
					sourceTileObject.color = property;
					sourceTileObject.Update();
					show_debug_message($"set {propertyName} of object {sourceTileObject.name} to: {GetColorString(property)}");
					break;
				}
			}
		}
		
		image_xscale = 2.5;
		image_yscale = 0.5;
		dropdownY = sprite_height;
	}
}
function CreateDoorStateOptionBox(source, currentState, yy){
	var inst = instance_create_layer(PROPERTY_BOX_CREATE_X - 64, yy, "UI_Objs", obj_genericOptionBox);
	with (inst){
		propertyName = "State";
		sourceTileObject = source;
		isSelected = currentState;
		
		//define function to set door state property
		function SetProperty(property){
			sourceTileObject.state = property;
			sourceTileObject.Update();
			show_debug_message($"set {propertyName} of object {sourceTileObject.name} to: {property}");
		}
		
		image_xscale = 0.5;
		image_yscale = 0.5;
	}
}
function CreateMoveableOptionBox(source, currentMoveable, yy){
	var inst = instance_create_layer(PROPERTY_BOX_CREATE_X - 64, yy, "UI_Objs", obj_genericOptionBox);
	with (inst){
		propertyName = "Is Moveable";
		sourceTileObject = source;
		isSelected = currentMoveable;
		
		function SetProperty(property){
			sourceTileObject.moveable = property;
			sourceTileObject.Update();
			show_debug_message($"set {propertyName} of object {sourceTileObject.name} to: {property}");
		}
		
		image_xscale = 0.5;
		image_yscale = 0.5;
	}
}
function CreateRotateableOptionBox(source, currentRotateable, yy){
	var inst = instance_create_layer(PROPERTY_BOX_CREATE_X - 64, yy, "UI_Objs", obj_genericOptionBox);
	with (inst){
		propertyName = "Is Rotateable";
		sourceTileObject = source;
		isSelected = currentRotateable;
		
		function SetProperty(property){
			sourceTileObject.rotateable = property;
			sourceTileObject.Update();
			show_debug_message($"set {propertyName} of object {sourceTileObject.name} to: {property}");
		}
		
		image_xscale = 0.5;
		image_yscale = 0.5;
	}
}
function CreateFlipsOptionBox(source, currentFlips, yy){
	var inst = instance_create_layer(PROPERTY_BOX_CREATE_X - 64, yy, "UI_Objs", obj_genericOptionBox);
	with (inst){
		propertyName = "Does Flip";
		sourceTileObject = source;
		isSelected = currentFlips;
		
		function SetProperty(property){
			sourceTileObject.flips = property;
			sourceTileObject.Update();
			show_debug_message($"set {propertyName} of object {sourceTileObject.name} to: {property}");
		}
		
		image_xscale = 0.5;
		image_yscale = 0.5;
	}
}
function CreateDoorTypeNumberBox(source, currentDoorID, yy){
	var inst = instance_create_layer(PROPERTY_BOX_CREATE_X - 16, yy, "UI_Objs", obj_genericNumberBox);
	with (inst){
		propertyName = "Door ID";
		sourceTileObject = source;
		numMin = 1;
		numMax = MAX_DOOR_TYPES;
		numCurrent = currentDoorID;
		
		//define function to set door type property
		function SetProperty(property){
			sourceTileObject.type = property;
			sourceTileObject.Update();
			show_debug_message($"set {propertyName} of object {sourceTileObject.name} to: {property}");
		}
		
		image_xscale = 2;
		image_yscale = 0.5;
	}
}
function CreateTeleporterChannelsNumberBox(source, currentChannel, yy){
	var inst = instance_create_layer(PROPERTY_BOX_CREATE_X - 16, yy, "UI_Objs", obj_genericNumberBox);
	with (inst){
		propertyName = "Channel";
		sourceTileObject = source;
		numMin = 0;
		numMax = 999999;
		numCurrent = currentChannel;
		
		function SetProperty(property){
			sourceTileObject.channel = property;
			sourceTileObject.Update();
			show_debug_message($"set {propertyName} of object {sourceTileObject.name} to: {property}");
		}
		
		image_xscale = 2;
		image_yscale = 0.5;
	}
}