
function updata ( data ) {

    var PlayerName = data[0]["PlayerName"];
    var Medic = data[0]["Medic"];
    var Police = data[0]["Police"];

    var blood = data[0]["Blood"];
    var maxBlood = data[0]["MaxBlood"];

    var armor = data[0]["Armor"];
    var maxArmor = data[0]["MaxArmor"];

    var food = data[0]["Food"];
    var maxFood = data[0]["MaxFood"];

    var thirst = data[0]["Thirst"];
    var maxThirst = data[0]["MaxThirst"];

    var stammina = data[0]["Stammina"];
    var maxStammina = data[0]["MaxStammina"];

    if ( blood > maxBlood ) {
        blood = maxBlood;
    }

    if ( armor > maxArmor ) {
        armor = maxArmor;
    }

    blood = Math.floor( blood );
    armor = Math.floor( armor );

    /*
        class = .
        id = #
        ต่อท้ายด้วย ; ทุกครั้ง
    */

    $("#id").text( PlayerName );
    $("#ambulance").text( Medic );
    $("#police").text( Police );

    $("#healtlevel").text( 100/maxBlood*blood );
    $("#armorlevel").text( 100/maxArmor*armor );

    $(".Hp").css( "width", 100/maxBlood*blood + "%");
    $(".Am").css( "width", 100/maxArmor*armor + "%");

    var p = 100/maxBlood*blood;
    var r = ( p / 100 ) * 80;
    var color = 'hsla( ' + r + ', 80%, 40%, 1 )';
    var color2 = 'hsla( ' + r + ', 70%, 40%, 0.8 )';
    $(".Hp").css( "background", "linear-gradient(0deg, " + color + ", " + color2 + ")");

    $("#food").css( "height", 100/maxFood*food + "%");
    $("#thirst").css( "height", 100/maxThirst*thirst + "%");
    $("#stammina").css( "height", 100/maxStammina*stammina + "%");

    if ( 100/maxBlood*blood <= 25 ) {
        $(".hp i").addClass( "flashing1");
    } else {
        $(".hp i").removeClass( "flashing1");
    }

    if ( 100/maxArmor*armor <= 25 ) {
        $(".am i").addClass( "flashing1");
    } else {
        $(".am i").removeClass( "flashing1");
    }

    if ( 100/maxFood*food <= 25 ) {
        $("#foodBox i").addClass( "flashing1");
    } else {
        $("#foodBox i").removeClass( "flashing1");
    }

    if ( 100/maxThirst*thirst <= 25 ) {
        $("#thirstBox i").addClass( "flashing1");
    } else {
        $("#thirstBox i").removeClass( "flashing1");
    }

    if ( 100/maxStammina*stammina <= 25 ) {
        $("#stamminaBox i").addClass( "flashing1");
    } else {
        $("#stamminaBox i").removeClass( "flashing1");
    }

    /* เสร็จแล้ว ขอจบแค่นี้ขอบคุณครับ */

}