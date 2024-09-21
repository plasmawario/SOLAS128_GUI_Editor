/// @description black bars

draw_set_color(c_white);

//black boxes to obscure other rooms that is not our current room
var _x1 = camera.x -  camera.camWidth / 2;
var _y1 = camera.y -  camera.camHeight / 2;
var _x2 = camera.x +  camera.camWidth / 2;
var _y2 = camera.y +  camera.camHeight / 2;
var _box_w = (camera.camWidth - camera.camHeight) / 2;
var _box_h = camera.viewportWidth;
draw_sprite_ext(spr_pines, 0, _x1, _y1, _box_w, _box_h, 0, c_black, 1);
draw_sprite_ext(spr_pines, 0, _x2 - _box_w, _y1, _box_w, _box_h, 0, c_black, 1);

//draw object boxes
var colNum = 5;
var boxSide = TILE_SIZE * 2;
for (var i = 0; i < array_length(library); i ++){
	var xx = _x1 + (i % colNum) * boxSide;
	var yy = _y1 + (i div colNum) * boxSide;
	
	//color sprite border yellow if it is the last selected object
	if (i == objectLibrarySelectedIndex) {
		draw_sprite_stretched_ext(spr_editorIconButton, 1, xx, yy, boxSide, boxSide, objectSelectedColor, image_alpha);
	}else{
		draw_sprite_stretched_ext(spr_editorIconButton, 0, xx, yy, boxSide, boxSide, c_white, image_alpha);
	}
	
	
	//draw object icons
	draw_sprite_stretched(object_get_sprite(library[i].data), 0, xx + boxSide / 4, yy + boxSide / 4, 32, 32);
	
	//show name of object when hovering over the library icon for it
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	var isHoveringOverBox = point_in_rectangle(mouse_x, mouse_y, xx, yy, xx + boxSide - 1, yy + boxSide - 1);
	if (isHoveringOverBox){
		//show name on hover
		draw_text(roomXViewStart + 8, _y1 + boxSide / 2, library[i].name);
		
		//if we click on the library object button, create it
		if (mouse_check_button_pressed(mb_left)){
			//objectHolding = instance_create_layer(xx, yy, layer, library[i].data);	
			objectLibrarySelectedIndex = i;
			show_debug_message($"library selection set to {library[objectLibrarySelectedIndex].name}");
		}
	}
}

//draw function boxes
for (var i = 0; i < array_length(functionButtons); i ++){
	var xx = _x2 - (i % colNum) * boxSide;
	var yy = _y1 - (i div colNum) * boxSide;
	
	//draw icon box
	draw_sprite_stretched_ext(spr_editorIconButton, 0, xx - boxSide, yy, boxSide, boxSide, c_white, image_alpha);
	draw_sprite_stretched(spr_funcIcons, functionButtons[i].iconIndex, xx - boxSide + boxSide / 4, yy + boxSide / 4, 32, 32);
	
	//show name of object when hovering over the library icon for it
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	
	var isHoveringOverBox = point_in_rectangle(mouse_x, mouse_y, xx - boxSide, yy, xx - 1, yy + boxSide - 1);
	if (isHoveringOverBox){
		//show name on hover
		draw_text(roomXViewEnd - 8, _y1 + boxSide / 2, functionButtons[i].name);
		
		//if we click on the function button, perform logic based on what it is
		if (mouse_check_button_pressed(mb_left)){	
			switch (functionButtons[i].name){
				case "Export":
					PerformExportLogic();
					break;
				case "Load":
					PerformLoadLogic();
					break
			}
		}
	}
}

//draw square over currently selected tile object
if (objectSelected){
	draw_sprite_stretched(spr_box, 0, objectSelected.x - 21, objectSelected.y - 21, 42, 42);
}

//draw editor toggle buttons
/*for (var i = 0; i < 1; i ++){
	//draw outline box and color it if the function is enabled
	var xx = _x1 + colNum * boxSide;
	var yy = _y1 * i;
	
	//autoplace
	if (objectAutoplace && i == 0) draw_set_color(c_yellow);
	
	draw_sprite_stretched(spr_editorIconButton, 0, xx, yy, boxSide, boxSide);
	
	//draw each icon
	draw_sprite(spr_editorFunctionIcons, i, xx, yy);
}*/

//draw object name when mousing over it
if (position_meeting(mouse_x, mouse_y, obj_tileParent)){
	draw_set_halign(fa_left);
	draw_text(roomXViewStart + 8, _y1 + boxSide / 2, instance_position(mouse_x, mouse_y, obj_tileParent).name);
}

//draw information
draw_set_halign(fa_center);
draw_text(camera.x, roomYViewStart - 32, $"room: ({roomX}, {roomY})  tile: ({mouseTileX_Visual}, {mouseTileY_Visual})");

draw_set_halign(fa_left);

draw_sprite(spr_Arrowkeys, 0, camera.x - 256 + 8, roomYViewEnd + 32);
draw_text(camera.x - 256 + 32, roomYViewEnd + 32, "- move between rooms");
draw_sprite(spr_mouse, 1, camera.x - 256, roomYViewEnd + 64);
draw_text(camera.x - 256 + 16, roomYViewEnd + 64, "- select/create objects");
draw_sprite(spr_mouse, 2, camera.x - 256, roomYViewEnd + 96);
draw_text(camera.x - 256 + 16, roomYViewEnd + 96, "- delete objects");

draw_set_halign(fa_right);
draw_sprite(spr_r_key, 0, camera.x + 256, roomYViewEnd + 32);
draw_text(camera.x + 256 - 16, roomYViewEnd + 32, "rotate selected object - ");

draw_set_valign(fa_top);

//draw room boundaries
draw_rectangle_color(roomXViewStart, roomYViewStart, roomXViewEnd, roomYViewEnd, c_red, c_red, c_red, c_red, true);