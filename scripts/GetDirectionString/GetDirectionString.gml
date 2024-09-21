function GetDirectionString(dir){
	var text = "";
	
	switch (dir){
		case globalDirs.LEFT:
			text = "left";
			break;
		case globalDirs.UP:
			text = "up";
			break;
		case globalDirs.RIGHT:
			text = "right";
			break;
		case globalDirs.DOWN:
			text = "down";
			break;
	}
	
	return text;
}
function GetDirectionValue(str){
	var val = "";
	
	switch (str){
		case "left":
			val = globalDirs.LEFT;
			break;
		case "up":
			val = globalDirs.UP;
			break;
		case "right":
			val = globalDirs.RIGHT;
			break;
		case "down":
			val = globalDirs.DOWN;
			break;
	}
	
	return val;
}