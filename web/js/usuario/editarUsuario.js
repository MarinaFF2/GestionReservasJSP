$(document).ready(function () {
    alert("Estoy aqui, he entrado");
    $("#editarUsuario").click(function () {
        var correo = $("#correo").val();
        var clave = $("#clave").val();
        var reclave = $("#reclave").val();
        var nombre = $("#nombre").val();
        var apellido = $("#apellido").val();
        var edad = $("#edad").val();
        if (correo !== null && clave !== null && reclave !== null && nombre !== null && apellido !== null && edad !== 0){
            if (clave !== reclave){
                $("#editarUsuario").attr("disabled", true);
                alert("Algun campo esta en blanco");
            }
        }
    });
    $("#gestionarFoto").click(function () {
        var foto = $("#foto").val();
    });
});
