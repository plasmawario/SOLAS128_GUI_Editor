/// @description 

event_inherited();

//object properties
name = "teleporter";
channel = 0;

//change properties
function Update() {
}

//creates all property boxes for this tile object for editing properties
function ShowPropertyBoxes(){
	CreateTeleporterChannelsNumberBox(id, channel, 0);
}

//print level line data
function WriteExportFileLine(){
	var tilesCorrected = TileNumberConverter(roomX, roomY, x, y);
	var outputText = $"{roomX}, {roomY}, {tilesCorrected[0]}, {tilesCorrected[1]} = {name}" +
	 $" {channel}";
	
	return outputText;	
}

//loads in level data into object
function LoadLevelFileData(generalData, objData){
	//load general data
	object_get_parent(object_index).LoadLevelFileData();
	
	//load object-specific data
	for (var i = 0; i < array_length(objData); i ++){
		channel = objData[1];
	}	
}