function TryCreateProtectedIndicator(inst){
	
	var prot = instance_position(mouse_x, mouse_y, obj_protectedIndicator)
	if (!prot){
		prot = instance_create_depth(inst.x, inst.y, depth - 1, obj_protectedIndicator);
	}
	prot.alpha = 1;
}