$(document).ready(function () {
    alert("Estoy aqui, he entrado");
    limpiar1();
    $("#sendRegistrar").click(function () {
        var correo = $("#correo").val();
        var clave = $("#clave").val();
        var reclave = $("#reclave").val();
        var nombre = $("#clave").val();
        var nombre = $("#nombre").val();
        var apellido = $("#apellido").val();
        var edad = $("#edad").val();
        if (correo !== null && clave !== null && reclave !== null && nombre !== null && apellido !== null && edad !== 0){
            if (clave !== reclave){
                $("#sendRegistrar").attr("disabled", true);
                alert("Las claves no coinciden");
            }
        } else{
            $("#sendRegistrar").attr("disabled", true);
            alert("Algún campo está vacío");
        }
    });
    $("#limpiar").click(function () {
        limpiar1();
    });
    
});
function limpiar1(){
    $("#correo").val("");
    $("#clave").val("");
    $("#reclave").val("");
    $("#nombre").val("");
    $("#apellido").val("");
    $("#edad").val("");
}

