function btClickVerschl(){
	$('#btEdNeSenden').removeAttr("disabled");
	$('#btVerschluesseln').attr("disabled","disabled");

	var passwd = $('#inpEdNePasswd').val();

	var encrypted = sjcl.encrypt(userPhrase, passwd);

	$('#inpEdNePasswd').val(encrypted);
}

function showPlainText(){
	if($("#cbEdNePlaintext").is(":checked")){
		$("#inpEdNePasswd").attr("type","text");
	}else{
		$("#inpEdNePasswd").attr("type","password");
	}
}