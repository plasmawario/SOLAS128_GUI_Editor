/// @description 

event_inherited();

allowedDirs = [globalDirs.LEFT, globalDirs.UP, globalDirs.RIGHT, globalDirs.DOWN];
allowedColors = [globalColors.VOID, globalColors.RED, globalColors.GREEN, globalColors.BLUE, globalColors.YELLOW, globalColors.MAGENTA, globalColors.CYAN, globalColors.WHITE];

//object properties
name = "emitter";
dir = allowedDirs[0];
color = allowedColors[0];

//change properties
function Update() {
	SetDirection(allowedDirs[dir]);
}

//creates all property boxes for this tile object for editing properties
function ShowPropertyBoxes(){
	CreateColorPropertyBox(id, allowedColors, color, 0);
}

//print level line data
function WriteExportFileLine(){
	var tilesCorrected = TileNumberConverter(roomX, roomY, x, y);
	var outputText = $"{roomX}, {roomY}, {tilesCorrected[0]}, {tilesCorrected[1]} = {name}" +
		$" {GetDirectionString(allowedDirs[dir])} {GetColorString(allowedColors[color])}";
	
	return outputText;	
}

//loads in level data into object
function LoadLevelFileData(generalData, objData){
	//load general data
	object_get_parent(object_index).LoadLevelFileData();
	
	//load object-specific data
	for (var i = 0; i < array_length(objData); i ++){
		dir = GetDirectionValue(objData[1]);
		color = GetColorValue(objData[2]);
	}	
}

Update();