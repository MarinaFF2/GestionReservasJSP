$(document).ready(function () {
    if ($("#reservadoAula").val() !== "OCUPADO") {
        $("#reservadoAula").css({'background-color:': 'red'});
    } 
    if ($("#reservadoAula").val() !== "LIBRE") {
        $("#reservadoAula").css({'background-color:': 'green'});
    }
});
