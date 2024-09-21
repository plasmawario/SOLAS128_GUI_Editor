function GetDoorStateString(state){
	var text = "";
	
	switch (state){
		case true:
			text = "closed";
			break;
		case false:
			text = "open";
			break;
	}
	
	return text;
}
function GetDoorStateValue(str){
	var val = false;
	switch (str){
		case "closed":
			val = true;
			break;
		case "open":
			val = false;
			break;
	}
	
	return val;
}