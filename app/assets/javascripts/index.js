function reorderList(which){
	var id = $('#orderID').val();
	var newID = 1;
	switch(which){
		case "loginASC":
			newID = 1;
			break;
		case "loginDESC":
			newID = 2;
			break;
		case "urlASC":
			newID = 3;
			break;
		case "urlDESC":
			newID = 4;
	}

	if(id != newID){
		$('#orderID').val(newID);
		$('#orderSubmit').submit();
	}
}