
$(document).ready(function(){
	$('#nav').affix({
      offset: {
        top: $('header').height()-$('#nav').height()
      }
	});	

	$('.lets-talk').hover(function(){$(this).addClass('animated swing');})

	$('a').click(function(){
	    $('html, body').animate({
	        scrollTop: $( $(this).attr('href') ).offset().top
	    }, 500);
	    return false;
	});
});