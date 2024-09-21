/// @description 

event_inherited();

//object properties
name = "button";
type = 1;

//change properties
function Update() {
}

//creates all property boxes for this tile object for editing properties
function ShowPropertyBoxes(){
	CreateDoorTypeNumberBox(id, type, 0);
}

//print level line data
function WriteExportFileLine(){
	var tilesCorrected = TileNumberConverter(roomX, roomY, x, y);
	var outputText = $"{roomX}, {roomY}, {tilesCorrected[0]}, {tilesCorrected[1]} = {name}" +
	 $" {type}";
	
	return outputText;	
}

//loads in level data into object
function LoadLevelFileData(generalData, objData){
	//load general data
	object_get_parent(object_index).LoadLevelFileData();
	
	//load object-specific data
	for (var i = 0; i < array_length(objData); i ++){
		type = real(objData[1]);
	}	
}