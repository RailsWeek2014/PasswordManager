function btEditPhrase(){
	$('#divEdPhError').html("");
	$('#divEdPhErfolg').html("");

	var oldPasswd = $('#inpOldPasswd').val();
	var newPasswd = $('#inpEPPasswd').val();
	var newPasswdWdh = $('#inpEPPasswdWhd').val();

	disableEdPhItems();

	if(oldPasswd == userPhrase){
		if(newPasswd == newPasswdWdh){
			$('#subGetAllPasswords').submit();
		}else{
			$('#divEdPhError').html("Passwörter stimmen nicht überein.");
			enableEdPhItems();
		}
	}else{
		$('#divEdPhError').html("Alte passwörter stimmen nciht überein");
		enableEdPhItems();
	}
}

function disableEdPhItems(){
	$('#inpOldPasswd').attr("disabled","disabled");
	$('#inpEPPasswd').attr("disabled","disabled");
	$('#inpEPPasswdWhd').attr("disabled","disabled");
	$('#btEPSenden').attr("disabled","disabled");
}

function enableEdPhItems(){
	$('#inpOldPasswd').removeAttr("disabled");
	$('#inpEPPasswd').removeAttr("disabled");
	$('#inpEPPasswdWhd').removeAttr("disabled");
	$('#btEPSenden').removeAttr("disabled");
}

function epPhrasePlainText(){
	if($("#cbEditPhrase").is(":checked")){
		$('.inpPhrEd').attr("type","text");
	}else{
		$('.inpPhrEd').attr("type","password");
	}
}

function editPhrase(passwords){
	var oldPasswd = $('#inpOldPasswd').val();
	var newPasswd = $('#inpEPPasswd').val();

	var decrypted;
	var encrypted;

	var res = new Array();

	for(var i = 0;i < passwords.length;i +=2){
		res[i] = passwords[i];
		$('#divEdPhrLager').html(passwords[i+1]);

		var passwd = $('#divEdPhrLager').html();
		decrypted = sjcl.decrypt(userPhrase, passwd);
		encrypted = sjcl.encrypt(newPasswd,decrypted);

		res[i+1] = encrypted;
	}

	userPhrase = newPasswd;
	sendAll(res);
}

function sendAll(passwords){
	for(var i = 0;i < passwords.length;i += 2){
		$('#pwUpdateID').val(passwords[i]);
		$('#pwUpdatePw').val(passwords[i+1]);
		$('#subUpdateAllPasswords').submit();
	}

	$('#divEdPhErfolg').html("Erfolgreich! Sie werden in <div id='divEdPhTime'></div> Sekunden zur startseite weiter geleitet!");

	edPhraseTimer(5);
}

function edPhraseTimer(time,passwd){
	if(time > 0){
		$('#divEdPhTime').html(time);
		time--;
		setTimeout(function() {
			edPhraseTimer(time);
		}, 1000);
	}else{
		location.href = "/";
	}
}