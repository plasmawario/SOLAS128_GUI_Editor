function GetColorString(color){
	var text = "";
	
	switch (color){
		case globalColors.VOID:
			text = "void";
			break;
		case globalColors.RED:
			text = "red";
			break;
		case globalColors.GREEN:
			text = "green";
			break;
		case globalColors.BLUE:
			text = "blue";
			break;
		case globalColors.YELLOW:
			text = "yellow";
			break;
		case globalColors.MAGENTA:
			text = "magenta";
			break;
		case globalColors.CYAN:
			text = "cyan";
			break;
		case globalColors.WHITE:
			text = "white";
			break;
		case globalColors.ANY:
			text = "any";
			break;
	}
	
	return text;
}
function GetColorValue(str){
	var val = "";
	
	switch (str){
		case "void":
			val = globalColors.VOID;
			break;
		case "red":
			val = globalColors.RED;
			break;
		case "green":
			val = globalColors.GREEN;
			break;
		case "blue":
			val = globalColors.BLUE;
			break;
		case "yellow":
			val = globalColors.YELLOW;
			break;
		case "magenta":
			val = globalColors.MAGENTA;
			break;
		case "cyan":
			val = globalColors.CYAN;
			break;
		case "white":
			val = globalColors.WHITE;
			break;
		case "any":
			val = globalColors.ANY;
			break;
	}
	
	return val;
}