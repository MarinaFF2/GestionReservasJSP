$(document).ready(function () {
    var veces = 1;
    $("#aceptar").click(function () {
        //comprobarLogin();
        if ($("#usuario").val() === "" && $("#pwd").val() === "") {
            location.replace("../../index.jsp");
        }
    });
    function comprobarLogin() {

        var a = leercookie();
        //comprueba la existencia de la cookie mediante la búsqueda de un dato conocido
        if (a === "inactiva") {

            alert("Se sobrepaso el límite, espere unos seguntos");
            $("#usuario").attr("disabled", "disabled");
            $("#pwd").attr("disabled", "disabled");
        } else {
            $("#usuario").attr("enabled", "enabled");
            $("#pwd").attr("enabled", "enabled");
            if (veces < 3) {
                if ("paco" === $("#usuario").val() && "123" === $("#pwd").val()){
                    window.location = '../../index.jsp';//página de pado con clave
                } else {
                    veces += 1;
                    $("#usuario").val(" ");
                    $("#pwd").val("");
                }
            } else {
                document.cookie = "nombre=inactiva;max-age=20"; 
                veces = 1;
                alert("ha sobrepasado las opciones");
                $("#usuario").val(" ");
                $("#").pwd(" ");
                $("#usuario").attr("disabled", "disabled");
                $("#pwd").attr("disabled", "disabled");
            }
        }
    }
    function leercookie() {
        var ca = document.cookie.split('=');//Recupera el contenido de la cookie separando la información que interesa
        var c = ca[1];
        return c;
    }



    $("#usuario").blur(function () {
        if ($("#usuario").val() === "") {
            $("#usuario").css({'border-color': 'red'});
        }
    });
    $("#pwd").blur(function () {
        if ($("#pwd").val() === "") {
            location.replace("../../index.jsp");
            $("#pwd").css({'border-color': 'red'});
        }
    });
});


