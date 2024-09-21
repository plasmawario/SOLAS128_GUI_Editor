randomize();
	
//define enums
enum globalColors {
	VOID,
	RED,
	GREEN,
	BLUE,
	YELLOW,
	MAGENTA,
	CYAN,
	WHITE,
	ANY
}
enum globalDirs{
	LEFT,
	UP,
	RIGHT,
	DOWN,
}
enum globalZones{
	UNKNOWN,
	INTRO,
	BLUE,
	RED,
	GREEN,
	HUB,
	BOSS,
	NONE,
}

#macro MAX_DOOR_TYPES 30
	
//global variables
globalvar camera; camera = noone;

//set bg colors for the rooms
globalvar bgColors; bgColors = {
	intro: make_color_rgb(150, 60, 150),
	red: make_color_rgb(150, 60, 60),
	blue: make_color_rgb(60, 60, 150),
	green: make_color_rgb(60, 150, 60),
	void: make_color_rgb(170, 140, 100)
}

//build the game object library
globalvar library; library = [
	{data: obj_tileMirror, name: "mirror"}, 
	{data: obj_tilePrism, name: "prism"}, 
	{data: obj_tileEmitter, name: "emitter"}, 
	{data: obj_tileReceiver, name: "receiver"}, 
	{data: obj_tileTeleporter, name: "teleport"}, 
	{data: obj_tileDoor, name: "door"}, 
	{data: obj_tileButton, name: "button"}, 
	{data: obj_tileWall, name: "wall"}, 
	{data: obj_tileNoplace, name: "noplace"},
	{data: obj_tileGlitch, name: "glitch"},
	{data: obj_tileGlitchDestroyer, name: "glitchdestroyer"},
	{data: obj_tileOutOfBounds, name: "outofbounds"},
	{data: obj_tileBlocker, name: "blocker"},
];

globalvar functionButtons; functionButtons = [
	{iconIndex: 1, name: "Load"},
	{iconIndex: 0, name: "Export"},
];
/*library = [{data: obj_tileMirror, name: "Mirror"}, obj_tilePrism, obj_tileEmitter, obj_tileReceiver, obj_tileTeleporter, 
	obj_tileDoor, obj_tileWall, obj_tileNoplace];*/
	
//define editor toggles
//globalvar autoplace; autoplace = false;
	
#macro TILE_SIZE 32
#macro ROOM_SIZE_TILE 15
#macro ROOM_MAX_NUMBER 18 - 1
#macro TILE_MAX_NUMBER 253 - 1
#macro PROPERTY_BOX_CREATE_X 512