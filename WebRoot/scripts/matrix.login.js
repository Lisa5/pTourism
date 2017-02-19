
$(document).ready(function(){
//alert("hello ,login");
	var login = $('#loginform');
	var recover = $('#recoverform');
	var speed = 400;

	$('#to-recover').click(function(){
		
		$("#loginform").slideUp();
		$("#recoverform").fadeIn();
	});
	$('#to-login').click(function(){
		
		$("#recoverform").hide();
		$("#loginform").fadeIn();
	});
	
	
	$('#to-login').click(function(){
	
	});
    
    if($.browser.msie == true && $.browser.version.slice(0,3) < 10) {
        $('input[placeholder]').each(function(){ 
       
        var input = $(this);       
       
        $(input).val(input.attr('placeholder'));
               
        $(input).focus(function(){
             if (input.val() == input.attr('placeholder')) {
                 input.val('');
             }
        });
       
        $(input).blur(function(){
            if (input.val() == '' || input.val() == input.attr('placeholder')) {
                input.val(input.attr('placeholder'));
            }
        });
    });        
    }
    //usernameµÄchangeÊÂ¼þ
   // $(":input[name=userName]").change(function() {
    $("#userName").change(function(){
    	alert(hello);
		var username = $(this).val();
		username = $.trim(username);

		if (username != "") {
			alert("ajax");
		} else {
			alert("null");
			this.val("");
			// this.focus();
		}
	});
});