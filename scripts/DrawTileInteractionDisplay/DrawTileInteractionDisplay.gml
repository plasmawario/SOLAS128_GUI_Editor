function DrawTileInteractionDisplay(moveable, rotateable){
	if (moveable){
		if (rotateable){
			draw_sprite(spr_interactionDisplays, 3, x, y);
		}else{
			draw_sprite(spr_interactionDisplays, 1, x, y);
		}
	}else if (rotateable){
		draw_sprite(spr_interactionDisplays, 2, x, y);
	}else{
		draw_sprite(spr_interactionDisplays, 0, x, y);
	}
}