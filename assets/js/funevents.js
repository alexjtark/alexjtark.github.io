$(document).ready(function(){
	$('#nav').affix({
      offset: {
        top: $('header').height()-$('#nav').height()
      }
	});	


});