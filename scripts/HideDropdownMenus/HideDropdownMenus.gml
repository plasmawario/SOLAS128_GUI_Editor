function HideDropdownMenus(dropdown = noone){
	//if we only want a specific dropdown menu to hide, specify a parameter
	if (dropdown){
		//remove dropdown items
		for (var i = 0; i < array_length(items); i ++){
			instance_destroy(items[i]);
		}
	
		//reset array
		items = array_create(0);
	}else{
		//otherwise, hide all dropdown menus
		with (obj_genericPropertyBox){
			//remove dropdown items
			for (var i = 0; i < array_length(items); i ++){
				instance_destroy(items[i]);
			}
	
			//reset array
			items = array_create(0);
		}
	}
}