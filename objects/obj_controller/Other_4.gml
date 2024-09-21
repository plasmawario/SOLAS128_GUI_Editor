/// @description 

//generate border of empty tiles around the whole map
//top
for (var i = 0; i <= TILE_MAX_NUMBER; i ++){
	var xx = ((i * TILE_SIZE) div TILE_SIZE);
	var rmX = i div ROOM_SIZE_TILE;
	
	var inst = instance_create_layer(xx, 0, layer, obj_tileLevelBoundaries);
	SetGeneralPosition(rmX, 0, xx, 0, inst);
}
//right
for (var i = 1; i <= TILE_MAX_NUMBER; i ++){
	var yy = ((i * TILE_SIZE) div TILE_SIZE);
	var rmY = i div ROOM_SIZE_TILE;
	
	var inst = instance_create_layer(TILE_MAX_NUMBER, yy, layer, obj_tileLevelBoundaries);
	SetGeneralPosition(ROOM_MAX_NUMBER, rmY, TILE_MAX_NUMBER, yy, inst);
}
//bottom
for (var i = TILE_MAX_NUMBER - 1; i >= 0; i --){
	var xx = ((i * TILE_SIZE) div TILE_SIZE);
	var rmX = i div ROOM_SIZE_TILE;
	
	var inst = instance_create_layer(xx, TILE_MAX_NUMBER, layer, obj_tileLevelBoundaries);
	SetGeneralPosition(rmX, ROOM_MAX_NUMBER, xx, TILE_MAX_NUMBER, inst);
}
//left
for (var i = TILE_MAX_NUMBER - 1; i >= 1; i --){
	var yy = ((i * TILE_SIZE) div TILE_SIZE);
	var rmY = i div ROOM_SIZE_TILE;
	
	var inst = instance_create_layer(0, yy, layer, obj_tileLevelBoundaries);
	SetGeneralPosition(0, rmY, 0, yy, inst);
}