function SetTileX(obj, tile){
	obj.tileX = tile;
}
function SetTileY(obj, tile){
	obj.tileY = tile;
}
function SetRoomX(obj, rooom){
	obj.roomX = rooom;
}
function SetRoomY(obj, rooom){
	obj.roomY = rooom;
}

function UpdateRawPosition(obj){
	
	obj.x = (TILE_SIZE * obj.tileX) + (TILE_SIZE / 2);
	obj.y = (TILE_SIZE * obj.tileY) + (TILE_SIZE / 2);
	
}

function SetGeneralPosition(roomX, roomY, tileX, tileY, obj){
	//set obj properties
	obj.roomX = roomX;
	obj.roomY = roomY;
	obj.tileX = tileX;
	obj.tileY = tileY;
	
	//set raw position
	UpdateRawPosition(obj);
}