/// @description

//if we click outside of this bounds
if (!position_meeting(mouse_x, mouse_y, id)){
	//deselect
	if (isSelected){
		isSelected = false;
	}

	HideDropdownMenus(id);
}else{
	//otherwise, do on click logic
	isSelected = !isSelected;

	//if we did select this dropdown, show list
	if (isSelected){
		
		for (var i = 0; i < array_length(options); i ++){
			//create a new list item and simultaniously set its properties appropriately
			array_push(items, instance_create_layer(x, y + (dropdownY * (i + 1)), layer, obj_genericPropertyOption));
			items[i].source = id;
			items[i].text = options[i][1];
			items[i].value = options[i][0];
			items[i].textOffsetX = textOffsetX;
			items[i].image_xscale = image_xscale;
			items[i].image_yscale = image_yscale;
		}
		
	}else{
		for (var i = 0; i < array_length(items); i ++){
			//delete all of the dropdown items that currently exist and then clear the array
			instance_destroy(items[i]);
		}
		items = array_create(0);
	}
}