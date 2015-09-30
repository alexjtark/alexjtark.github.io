function loadPortfolio(){
	document.getElementById("content").innerHTML='<object type="text/html" data="portfolio.html" ></object>';
}

function loadAbout(){
	document.getElementById("content").innerHTML='<object type="text/html" data="about.html" ></object>';
}

$(document).ready(function () {
  $(".navbar-nav li a").click(function(event) {
    $(".navbar-collapse").collapse('hide');
  });
});