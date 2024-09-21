function TileNumberConverter(roomX, roomY, x, y){
	
	//calculates the start of our rooms in raw coordinates
	var roomTotalSize = (ROOM_SIZE_TILE * TILE_SIZE);
	var roomXViewStart = roomX * (roomTotalSize - TILE_SIZE);
	var roomYViewStart = roomY * (roomTotalSize - TILE_SIZE);

	//calculates the shared tile offset for when we navigate rooms, since each room shares the outer-most
	//tiles. This helps fix that
	var poopfartnutsX = x - (roomXViewStart);
	var poopfartnutsY = y - (roomYViewStart);

	//keep track of the tile and room
	var tileX_corrected = (poopfartnutsX div TILE_SIZE) % (ROOM_SIZE_TILE);
	var tileY_corrected = (poopfartnutsY div TILE_SIZE) % (ROOM_SIZE_TILE);

	return [tileX_corrected, tileY_corrected];
}