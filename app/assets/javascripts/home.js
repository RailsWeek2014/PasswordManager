
function escapeHtml(unsafe) {
	var res = "";
	for(var i = 0;i < unsafe.length;i++){
		if(unsafe[i] == "/"){
			res += "%2F";
		}else{
			res += unsafe[i];
		}
	}
    return res;
 }

function plainPassword(){
	if($("#cbPhransePlainText").is(":checked")){
		$("#inpPhrase").attr("type","text");
	}else{
		$("#inpPhrase").attr("type","password");
	}
}

function sendPhrase(){
	//var toEnc = $('#inpPhrase').val()+"|"+$('#divUserLastSignIn').html();
	//alert(toEnc);
	//var encrypted = CryptoJS.TripleDES.encrypt(toEnc,$('#aEmail').attr("email"));
	//alert(encrypted);
	//var test = encrypted.replace("/","abcd");
	
	//alert(test);

	var passwd = $('#inpPhrase').val();
	passwd = passwd + "|" + $('#divUserLastSignIn').html();
	var phrase = $('#aEmail').html();

	var encrypted = sjcl.encrypt(phrase,passwd);
	
	location.href = "./"+escapeHtml(encrypted);

}
function sendPhraseInput(e){
	 if (e.keyCode == 13) {
        sendPhrase();
    }
}