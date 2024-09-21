/// @description 

draw_self();

//draw color this emitter will emit
switch (allowedDirs[dir]){
	case globalDirs.LEFT:
		draw_sprite_stretched(spr_colors, allowedColors[color], x - 8 - 8, y - 8, 16, 16);
		break;
	case globalDirs.UP:
		draw_sprite_stretched(spr_colors, allowedColors[color], x - 8, y + 8 - 8, 16, 16);
		break;
	case globalDirs.RIGHT:
		draw_sprite_stretched(spr_colors, allowedColors[color], x + 8 - 8, y - 8, 16, 16);
		break;
	case globalDirs.DOWN:
		draw_sprite_stretched(spr_colors, allowedColors[color], x - 8, y - 8 - 8, 16, 16);
		break;
}