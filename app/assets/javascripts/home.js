function init(){
	$('#test1').change(function(){
		if($(this).is(":checked")){
			$("#test2").attr("type","text");
		}else{
			$("#test2").attr("type","password");
		}
	});

	$('#btPhraseSend').click(function(){
		location.href = "./"+$('#test2').val();
	});
}

window.onload = init;