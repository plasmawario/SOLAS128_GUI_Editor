/// @description 

event_inherited();

//increment button
if (point_in_rectangle(mouse_x, mouse_y, x + arrowButtonX - 16, y - 16, x + arrowButtonX + 16, y)){
	//show_debug_message("increment");
	if (mouse_check_button_released(mb_left)){
		numCurrent = clamp(numCurrent + 1, numMin, numMax);
		SetProperty(numCurrent);
		show_debug_message($"incremented value to {numCurrent}");
	}
}

//decrement button
if (point_in_rectangle(mouse_x, mouse_y, x + arrowButtonX - 16, y, x + arrowButtonX + 16, y + 16)){
	//show_debug_message("decrement");
	if (mouse_check_button_released(mb_left)){
		numCurrent = clamp(numCurrent - 1, numMin, numMax);
		SetProperty(numCurrent);
		show_debug_message($"decremented value to {numCurrent}");
	}
}