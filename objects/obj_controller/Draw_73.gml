/// @description 

//draws the object's sprite that we're currently holding on the mouse position
if (objectHolding){
	draw_set_alpha(0.5);
	draw_sprite(objectHolding.sprite_index, objectHolding.image_index, mouse_x, mouse_y);
	draw_set_alpha(1);
}