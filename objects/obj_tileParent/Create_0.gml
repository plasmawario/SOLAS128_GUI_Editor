/// @description yes

//global properties
roomX = -1;
roomY = -1;
tileX = -1;
tileY = -1;
displayName = "";
name = "";
protected = false;

//change properties
function Update() {
}

//creates all property boxes for this tile object for editing properties
function ShowPropertyBoxes(){
}

//print level line data
function WriteExportFileLine(){
	var tilesCorrected = TileNumberConverter(roomX, roomY, x, y);
	var outputText = $"{roomX}, {roomY}, {tilesCorrected[0]}, {tilesCorrected[1]} = {name}";
	
	return outputText;	
}

//loads in level data into object
function LoadLevelFileData(generalData, objData){
	//load general data
	for (var i = 0; i < array_length(generalData); i ++){
		roomX = generalData[0];
		roomY = generalData[1];
		tileX = generalData[2];
		tileY = generalData[3];
		name = objData[0];
	}
	
	//load object-specific data
		//do in each object
}