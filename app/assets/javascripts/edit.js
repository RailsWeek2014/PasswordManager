function btClickVerschl(){
	$('#btEdNeSenden').removeAttr("disabled");
	$('#btVerschluesseln').attr("disabled","disabled");
}

function showPlainText(){
	if($("#cbEdNePlaintext").is(":checked")){
		$("#inpEdNePasswd").attr("type","text");
	}else{
		$("#inpEdNePasswd").attr("type","password");
	}
}