Date.prototype.timeNow = function() {
    return ((this.getHours() < 10) ? "0" : "") + this.getHours() + ":" + ((this.getMinutes() < 10) ? "0" : "") + this.getMinutes() + ":" + ((this.getSeconds() < 10) ? "0" : "") + this.getSeconds();
}
Date.prototype.today = function() {
    return ((this.getDate() < 10) ? "0" : "") + this.getDate() + "." + (((this.getMonth() + 1) < 10) ? "0" : "") + (this.getMonth() + 1) + "." + this.getFullYear();
}

$(document).ready(function () {
    $('#Clock').hide();
    setInterval(setTime, 1000)
});

function setTime() {
    var currentdate = new Date();
    $("#time").text(currentdate.today() + " - " + currentdate.timeNow());
    $('#Clock').show();
}