/// @description 

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_self();
draw_text(x + textOffsetX, y - 32, propertyName);
draw_text(x + textOffsetX, y, numCurrent);
draw_sprite(spr_ArrowButton, 0, x + arrowButtonX, y - 8);
draw_sprite_ext(spr_ArrowButton, 0, x + arrowButtonX, y + 8, 1, 1, 180, image_blend, image_alpha);

//draw_rectangle_color(x + arrowButtonX - 16, y - 16, x + arrowButtonX + 16, y, c_red, c_red, c_red, c_red, true);
//draw_rectangle_color(x + arrowButtonX - 16, y, x + arrowButtonX + 16, y + 16, c_red, c_red, c_red, c_red, true);