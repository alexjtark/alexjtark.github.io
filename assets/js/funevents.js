$(document).ready(function(){
	$('#nav').affix({
      offset: {
        top: $('header').height()-$('#nav').height()
      }
	});	

	$('.lets-talk').hover(function(){$(this).addClass('animated swing');})
});