function plainPassword(){
	if($("#cbPhransePlainText").is(":checked")){
		$("#inpPhrase").attr("type","text");
	}else{
		$("#inpPhrase").attr("type","password");
	}
}

function sendPhrase(){
	location.href = "./"+$('#inpPhrase').val();
}

//window.onload = init;