$(function() {
    window.addEventListener('message', function(event) {
        if(event.data.type == "publicphoneopen"){
            $('.publicphonebase').css('display', 'block');
        } else if (event.data.type == "publicphoneclose"){
            $('.publicphonebase').css('display', 'none');
            $.post('https://et-phone/publicphoneclose', JSON.stringify({}));
        }
    });
});

$(".publicphoneclosebtn").click(function(){
    $.post('https://et-phone/publicphoneclose', JSON.stringify({}));
    $('.publicphonebase').css('display', 'none');
    $("#publicphonechannelnumpad").val("");
});
$(".publicphonecallbtn").click(function(){
    $.post('https://et-phone/publicphoneclose', JSON.stringify({}));
    $('.publicphonebase').css('display', 'none');
    setTimeout(function(){
        $("#publicphonechannelnumpad").val("");
    }, 100);

});



$(document).on('click', ".publicphonecallbtn", function(e){
    e.preventDefault();

    var publicphoneInputNum = $("#publicphonechannelnumpad").val();

    cData = {
        number: publicphoneInputNum,
        name: publicphoneInputNum,
    }

    $.post('https://et-phone/CallContact', JSON.stringify({
        ContactData: cData,
        Anonymous: true,
    }), function(status){
        if (cData.number !== QB.Phone.Data.PlayerData.charinfo.phone) {
            if (status.IsOnline) {
                if (status.CanCall) {
                    if (!status.InCall) {
                        $(".phone-call-outgoing").css({"display":"none"});
                        $(".phone-call-incoming").css({"display":"none"});
                        $(".phone-call-ongoing").css({"display":"none"});
                        $(".phone-call-outgoing-caller").html(cData.name);
                        QB.Phone.Functions.HeaderTextColor("white", 400);
                        QB.Phone.Animations.TopSlideUp('.phone-application-container', 400, -160);

                        setTimeout(function(){
                            $(".phone-app").css({"display":"none"});
                            QB.Phone.Animations.TopSlideDown('.phone-application-container', 400, -160);
                            QB.Phone.Functions.ToggleApp("phone-call", "block");
                            $(".phone-currentcall-container").css({"display":"block"});
                            $("#incoming-answer").css({"display":"none"});
                        }, 450);

                        CallData.name = cData.name;
                        CallData.number = cData.number;

                        QB.Phone.Data.currentApplication = "phone-call";
                    } else {
                        QB.Phone.Notifications.Add("fas fa-phone", "Điện thoại", "Bạn đang trong cuộc gọi!");
                    }
                } else {
                    QB.Phone.Notifications.Add("fas fa-phone", "Điện thoại", "Người dùng bận!");
                }
            } else {
                QB.Phone.Notifications.Add("fas fa-phone", "Điện thoại", "Người dùng không gọi được!");
            }
        } else {
            QB.Phone.Notifications.Add("fas fa-phone", "Điện thoại", "Bạn không thể tự gọi cho bản thân!");
        }
    });

});