/// @description 

draw_self()

//draws text next to the checkbox
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(x + sprite_width / 2 + 8, y, propertyName);

//draws a filled in rectangle when enabled
if (isSelected){
	draw_rectangle(x - sprite_width / 2 + 4, y - sprite_height / 2 + 4, x + sprite_width / 2 - 5, y + sprite_height / 2 - 5, false);
}