/// @description 

//set the property of the root tile object accordingly
if (source){
	with (source){
		selectedValue = other.value;
		selectedText = other.text;
		isSelected = false;
		SetProperty(selectedValue);
	}
}