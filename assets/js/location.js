$.get("http://ipinfo.io", function (response) {
    $("#address").html("Greetings Visitor From " + response.city + "!");
    $("#details").html(JSON.stringify(response, null, 4));
}, "jsonp");