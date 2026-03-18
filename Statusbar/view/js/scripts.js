$(function() {
    $('.status').circleProgress({
        max: 100,
        animationDuration: 400,
        textFormat: () => ''
    });
})

const playSound = (name) => {
    if (name) {
        var audio = new Audio('./sounds/' + name + '.ogg');
        audio.volume = 0.4
        audio.play();
    }
}

let hungrySounds = 0

$(document).ready(function(){
    window.addEventListener('message', function(event) {
        var data = event.data;
        var dt = new Date();
        /* $(".time-current").text(dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds()) */
        $(".player-id").text(data.id)
        $(".idmounted").text(data.id)
        $("#health .inner-bar").css("width", data.health + "%")
        $("#health .percent").html((data.health <= 0 ? 0 : data.health) + "%")
        $("#armor .inner-bar").css("width", data.armor + "%")
        $("#armor .percent").html(data.armor + "%")
        if (data.food != NaN) {
            $('.status.food').circleProgress({value: data.food});
            if (data.food < 5) {
                $(".status.food .hungry").fadeIn()
                if (hungrySounds == 0) {
                    hungrySounds = setTimeout(() => {
                        playSound('hungry')
                        hungrySounds = 0
                        clearTimeout(hungrySounds)
                    }, Math.floor(Math.random() * 15) * 1000)
                }
                
            } else {
                $(".status.food .hungry").fadeOut()
                if (hungrySounds > 0) {
                    hungrySounds = 0
                    clearTimeout(hungrySounds)
                }
            }
        }
        if (data.water != NaN) {
            $('.status.water').circleProgress({value: data.water});
        }
        
		if (data.dive >= 100) {
            $('.status.oxygen').fadeOut()
		} else{
            $('.status.oxygen').fadeIn()
            if (data.dive != NaN) {
                $('.status.oxygen').circleProgress({value: data.dive});
            }
        }

        if (data.stamina == 100) {
            $(".stamina-container").fadeOut()
        } else {
            $(".stamina-container").fadeIn()
            $("#stamina").css("width", data.stamina + "%")
        }
    });
});

document.addEventListener("DOMContentLoaded", function() {
    const time_element = document.querySelector("#timermounted");
    setInterval(() => {
        const time = new Date()
        time_element.textContent = time.toLocaleTimeString([],{hour12:false, hour: '2-digit', minute:'2-digit'});
    }, 1000)
})