$(document).ready(function () {
    $("#gestionarFoto").click(function () {
        if ($("#file").val() === ""){
            location.replace("../../vista/usuario/editarFoto.jsp");
        }
    });
});