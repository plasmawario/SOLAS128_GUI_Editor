function PerformExportLogic(){
		
	//store all of our objects in this grid
	var objectList = [];
	with (obj_tileParent){
		array_push(objectList, id);
	}
	
	//sort the array by roomx and roomy, then by tilex and tiley
	
	
	
	//create or open the file for writing
	var file = file_text_open_write(get_save_filename("SOLAS128 level file|*.lvl", ""));
	
	//if the file is successfully opened/accessed, begin writing
	if (file != -1){
		show_debug_message($"now exporting data");
		obj_controller.AddDebugText("now exporting data");
	
		//populate the room with empty tiles first
		file_text_write_string(file, "0, 0, 0-252, 0-252 = empty\n");
		
		for (var i = 0; i < array_length(objectList); i ++){
			file_text_write_string(file, objectList[i].WriteExportFileLine() + "\n");
		}
		
		//close the file
		file_text_close(file);
		
		show_debug_message($"export complete");
		obj_controller.AddDebugText("export complete");
	}
	
}