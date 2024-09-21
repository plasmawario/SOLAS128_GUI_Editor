/// @description rotate object

if (objectSelected && variable_instance_exists(objectSelected, "dir")){
	with (objectSelected){
		dir ++;
		if (dir >= array_length(allowedDirs)) {
			dir = 0;
		}
		
		//update object properties
		Update();
	}
}