$(function() {
    window.addEventListener('message', function(event) {
        if (event.data.type == "open") {
            QBRadio.SlideUp()
        }

        if (event.data.type == "close") {
            QBRadio.SlideDown()
        }
    });

    document.onkeyup = function (data) {
        if (data.which == 27) { // Escape key
            $.post('https://et-radio/escape', JSON.stringify({}));
            QBRadio.SlideDown()
        } else if (data.which == 13) { // Enter key
            $.post('https://et-radio/joinRadio', JSON.stringify({
                channel: $("#channel").val()
            }));
        }
    };
});

QBRadio = {}

$(document).on('click', '#submit', function(e){
    e.preventDefault();

    $.post('https://et-radio/joinRadio', JSON.stringify({
        channel: $("#channel").val()
    }));
});

$(document).on('click', '#disconnect', function(e){
    e.preventDefault();

    $.post('https://et-radio/leaveRadio');
});

$(document).on('click', '#volumeUp', function(e){
    e.preventDefault();

    $.post('https://et-radio/volumeUp', JSON.stringify({
        channel: $("#channel").val()
    }));
});

$(document).on('click', '#volumeDown', function(e){
    e.preventDefault();

    $.post('https://et-radio/volumeDown', JSON.stringify({
        channel: $("#channel").val()
    }));
});

$(document).on('click', '#decreaseradiochannel', function(e){
    e.preventDefault();

    $.post('https://et-radio/decreaseradiochannel', JSON.stringify({
        channel: $("#channel").val()
    }));
});

$(document).on('click', '#increaseradiochannel', function(e){
    e.preventDefault();

    $.post('https://et-radio/increaseradiochannel', JSON.stringify({
        channel: $("#channel").val()
    }));
});

$(document).on('click', '#poweredOff', function(e){
    e.preventDefault();

    $.post('https://et-radio/poweredOff', JSON.stringify({
        channel: $("#channel").val()
    }));
});

QBRadio.SlideUp = function() {
    $(".container").css("display", "block");
    $(".radio-container").animate({bottom: "6vh",}, 250);
}

QBRadio.SlideDown = function() {
    $(".radio-container").animate({bottom: "-110vh",}, 400, function(){
        $(".container").css("display", "none");
    });
}
