// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

var userPhrase;

function setTime(id,timeLeft,input){
	if(timeLeft > 0){
		$(id).html(timeLeft);
		timeLeft--;

		window.setTimeout(function(){
			setTime(id,timeLeft,input);
		},1000);
	}else{
		$(id).html(input);
		$(".divPasswdUeber").unbind("click");
		setPasswdEncrypt();
	}
}

function setPasswdEncrypt(){
	$('.divPasswdUeber').click(function(){
		var id = $(this).attr("passwordID");
		var query = "#divPasswdUeber"+id;
		var passwd = $(query+"passwd").html();
		var decrypted = sjcl.decrypt(userPhrase, passwd)


		$(query).html(decrypted);
		window.setTimeout(function(){
			$(query).html("********************");
		},3000);
		setTime("#tdPasswdTimer"+id,3,$('#tdPasswdTimer'+id).html());
	});
}

function calUserPhrase(){
	var passwd = $('#divUserPhrase').html();
	var phrase = $('#aEmail').html();

	var decrypted = userPhrase = sjcl.decrypt(phrase,passwd);
	var zwischen = decrypted.split("|");
	var loggedIn = $('#divUserLastSignIn').html();
	if(zwischen[1] == loggedIn){
		userPhrase = zwischen[0];
	}
}

function displayErrorTimer(){

}

function displayErrorinit(){
	$('.error').load(function(){
		
	})
}

function init(){
	calUserPhrase();
	setPasswdEncrypt();
	displayErrorinit();
}

window.onload = init;