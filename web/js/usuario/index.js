$(document).ready(function () {
    if($("#correo").val()===null || $("#clave").val()===null){
        $("#aceptarIndex").attr("disabled", true);
        alert("Algún campo está vacio");
    }
});


