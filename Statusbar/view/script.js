let dateToday = document.getElementById("date");
let today = new Date();
let day = `${today.getDate() < 10 ? "0" : ""}${today.getDate()}`;

let boolean  = false;
let boolean01  = false;

let month = `${(today.getMonth() + 1) < 10 ? "0" : ""}${today.getMonth() + 1}`;
let year = today.getFullYear();

dateToday.textContent = `${day}/${month}`;

function checkTime(i) {
    if (i < 10) {
        i = "0" + i;
    }
    return i;
}

function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('time').textContent = `${h}:${m}`;
    t = setTimeout(function () {
        startTime()
    }, 500);
}

startTime();

$(document).ready(function () {
    window.addEventListener('message', function (event) {
        var data = event.data;

        if (data.id) {
            $("#id").html('ID : ' + data.id);
        }

        if (data.avatar) {
            $("#profile").attr("src", data.avatar);
        }

        if (data.health) {
            $('#health-text').text((data.health));
            $("#health").css("width", data.health + "%");
        }
        
        if (data.armor == 0) {
            $("#armor").hide();
        } else if (data.armor > 1) {
            $("#armor").show();
            $("#armor").css("width", data.armor + "%");
        }

        if (data.stamina) {
            $("#stamina").css("width", data.stamina + "%");
        }

        if (data.talk) {
            $('#voice-text').css('color', '#0096FF');
        } else {
            $('#voice-text').css('color', '#f5f5f5');
        }

        if (data.type === 'voice') {

            if (data.voiceCircle === 1) {
                $('#fa-circle1').addClass('color');
                $('#fa-circle2').removeClass('color');
                $('#fa-circle3').removeClass('color');
                $('#voice-text').html(data.voiceText);
                $('#voice-img').attr("src", "img/voice/Normal.png");
                $('#voice1').addClass('active');
                $('#voice2').removeClass('active');
                $('#voice3').removeClass('active');
            }
            if (data.voiceCircle === 2) {
                $('#fa-circle1').addClass('color');
                $('#fa-circle2').addClass('color');
                $('#fa-circle3').removeClass('color');
                $('#voice-text').html(data.voiceText);
                $('#voice-img').attr("src", "img/voice/Normal.png");
                $('#voice1').addClass('active');
                $('#voice2').addClass('active');
                $('#voice3').removeClass('active');
            }
            if (data.voiceCircle === 3) {
                $('#fa-circle1').addClass('color');
                $('#fa-circle2').addClass('color');
                $('#fa-circle3').addClass('color');
                $('#voice-text').html(data.voiceText);
                $('#voice-img').attr("src", "img/voice/Normal.png");
                $('#voice1').addClass('active');
                $('#voice2').addClass('active');
                $('#voice3').addClass('active');
            }

        }

        if (data.hunger) {
            $("#hunger-text").html(Math.round(data.hunger));
            $("#hunger").css("height", data.hunger + "%");
        }

        if (data.stress) {
            $("#stress-text").html(Math.round(data.stress));
            $("#stress").css("height", data.stress + "%");
        }

        const audioPlayer = new Audio("sound/Hunger.ogg")

        if(data.hunger < 15) {
        if(boolean === false) {
            $('.Food-img').show()
            boolean = true;
            audioPlayer.play()
        }
        }
        if (data.hunger > 15) {
        if(boolean === true) {
            $('.Food-img').hide()
            boolean = false;
        }
        }

        if(data.stress > 80) {
        if(boolean01 === false) {
            $('.Stress-img').show()
            boolean01 = true;
            audioPlayer.play()
        }
        }
        if (data.stress < 80) {
        if(boolean01 === true) {
            $('.Stress-img').hide()
            boolean01 = false;
        }
        }

        if (data.dive) {
            if (data.dive > 99) {
                $("#dive-box").hide();
            } else if (data.dive < 99) {
                $("#dive-box").show();
                $("#dive-text").html(Math.round(data.dive));
                $("#dive").css("height", data.dive + "%");
            }
        }

        if (data.type == "update") {
            $("#police").html(data.police);
            $("#ambulance").html(data.ambulance);
        }

    })
});


