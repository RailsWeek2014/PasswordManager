$(document).ready(function(){
	var allPasswords = "<%= escape_javascript(render partial: 'passwordmanager/getAllPasswords', locals: {passwords: @passwords}) %>";

	var passwd = allPasswords.split("&lt;/div&gt;");
	var k = 0;
	var ausgabe = new Array();
	var x = 0;

	for(var i = 0;i < passwd.length;i++){
		var passwd2 = passwd[i].split("&lt;div&gt;");
		for(var j = 0;j < passwd2.length;j++){
			if((k%2) == 1){
				ausgabe[x] = passwd2[j];
				x++;
			}
			k++;
		}
	}

	editPhrase(ausgabe);
})
