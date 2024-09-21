/// @description 

event_inherited();

//object properties
name = "door";
type = 1;
state = false;

//change properties
function Update() {
}

//creates all property boxes for this tile object for editing properties
function ShowPropertyBoxes(){
	CreateDoorTypeNumberBox(id, type, 0);
	CreateDoorStateOptionBox(id, state, 32);
}

//writes data in the format that can be loaded into SOLAS 128
function WriteExportFileLine(){
	var tilesCorrected = TileNumberConverter(roomX, roomY, x, y);
	var outputText = $"{roomX}, {roomY}, {tilesCorrected[0]}, {tilesCorrected[1]} = {name}" +
	 $" {type} {GetDoorStateString(state)}";
	
	return outputText;	
}

//loads in level data into object
function LoadLevelFileData(generalData, objData){
	//load general data
	object_get_parent(object_index).LoadLevelFileData();
	
	//load object-specific data
	for (var i = 0; i < array_length(objData); i ++){
		type = real(objData[1]);
		state = GetDoorStateValue(objData[2]);
	}	
}