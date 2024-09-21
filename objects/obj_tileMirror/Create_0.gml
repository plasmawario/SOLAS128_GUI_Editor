/// @description 

event_inherited();

allowedDirs = [globalDirs.LEFT, globalDirs.UP];

//object properties
name = "mirror";
dir = allowedDirs[0];
moveable = false;
rotateable = false;
flips = false;

//change properties
function Update() {
	switch (allowedDirs[dir]){
		case globalDirs.LEFT:
			if (flips){
				image_index = 2;
			}else{
				image_index = 0;
			}
			break;
		case globalDirs.UP:
			if (flips){
				image_index = 3;
			}else{
				image_index = 1;
			}
			break;
	}
}

//creates all property boxes for this tile object for editing properties
function ShowPropertyBoxes(){
	CreateMoveableOptionBox(id, moveable, 0);
	CreateRotateableOptionBox(id, rotateable, 32);
	CreateFlipsOptionBox(id, flips, 64);
}

//print level line data
function WriteExportFileLine(){
	var tilesCorrected = TileNumberConverter(roomX, roomY, x, y);
	var outputText = $"{roomX}, {roomY}, {tilesCorrected[0]}, {tilesCorrected[1]} = {name}" +
		$" {GetDirectionString(allowedDirs[dir])}";
		outputText += moveable ? " true" : " false";
		outputText += rotateable ? " true" : " false";
		outputText += flips ? " true" : " false";
	
	return outputText;	
}

//loads in level data into object
function LoadLevelFileData(generalData, objData){
	//load general data
	object_get_parent(object_index).LoadLevelFileData();
	
	//load object-specific data
	for (var i = 0; i < array_length(objData); i ++){
		dir = GetDirectionValue(objData[1]);
		moveable = objData[2] == "true";
		rotateable = objData[3] == "true";
		flips = objData[4] == "true";
	}	
}