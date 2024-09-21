function SetDirection(dir){
	switch (dir){
		case globalDirs.LEFT:
			image_angle = 0;
			break;
		case globalDirs.UP:
			image_angle = 90;
			break;
		case globalDirs.RIGHT:
			image_angle = 180;
			break;
		case globalDirs.DOWN:
			image_angle = 270;
			break;
	}
}