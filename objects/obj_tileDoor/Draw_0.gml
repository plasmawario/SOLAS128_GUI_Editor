/// @description 

if (state){
	draw_sprite(sprite_index, type - 1, x, y);
}else{
	draw_sprite_ext(sprite_index, type - 1, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.5);
}