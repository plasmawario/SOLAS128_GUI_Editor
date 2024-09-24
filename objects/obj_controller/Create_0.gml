/// @description general editor handler

roomX = 0;
roomY = 0;
bgColor = bgColors.intro;	//updates room background color	

roomTotalSize = (ROOM_SIZE_TILE * TILE_SIZE);
roomXViewStart = roomX * roomTotalSize;
roomYViewStart = roomY * roomTotalSize;
roomXViewEnd = (roomX + 1) * roomTotalSize;
roomYViewEnd = (roomY + 1) * roomTotalSize;

debugInitTimer = 60 * 10;
debugFadeTime = 60;
debugInitAlpha = 1;
debugText = [];

//calculates the shared tile offset for when we navigate rooms, since each room shares the outer-most
//tiles. This helps fix that
var poopfartnutsX = mouse_x - (roomX * (roomTotalSize - TILE_SIZE));
var poopfartnutsY = mouse_y - (roomY * (roomTotalSize - TILE_SIZE));

mouseTileX_Visual = (poopfartnutsX div TILE_SIZE) % (ROOM_SIZE_TILE);
mouseTileY_Visual = (poopfartnutsY div TILE_SIZE) % (ROOM_SIZE_TILE);
mouseTileX = (mouse_x div TILE_SIZE) % (ROOM_SIZE_TILE);
mouseTileY = (mouse_y div TILE_SIZE) % (ROOM_SIZE_TILE);
//mouseRoomX = (mouse_x div roomTotalSize);
//mouseRoomY = (mouse_y div roomTotalSize);
mouseIsInRoomBounds = mouse_x > roomXViewStart && mouse_y > roomYViewStart && mouse_x < roomXViewEnd && mouse_y < roomYViewEnd;

objectHolding = noone;
objectSelected = noone;
objectLibrarySelectedIndex = -1;
objectSelectedColor = make_color_rgb(255, 245, 170);
camera.x = (roomX * roomTotalSize) + (roomTotalSize / 2);
camera.y = (roomY * roomTotalSize) + (roomTotalSize / 2);

//debug setting-up
function AddDebugText(newText){
	//create a new debug text struct
	var debugTextObj = {
		text: newText,
		timer: debugInitTimer,
		alpha: debugInitAlpha
	};
	
	//push it into the debug text array
	array_push(debugText, debugTextObj);
}

AddDebugText("debug text will go here");