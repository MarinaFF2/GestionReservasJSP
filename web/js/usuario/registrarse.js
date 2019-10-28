$(document).ready(function () {
    $("#sendRegistrar").attr("disabled", false);
    $("#reclave").blur(function(){
        if ($("#clave").val() !== $("#reclave").val()){
            $("#clave").css({'border-color':'red'});
            $("#reclave").css({'border-color':'red'});
        }else{
            $("#clave").css({'border-color':'black'});
            $("#reclave").css({'border-color':'black'});
        }
    });
    $("#clave").blur(function(){
        if ($("#clave").val() !== $("#reclave").val()){
            $("#clave").css({'border-color':'red'});
            $("#reclave").css({'border-color':'red'});
        }else{
            $("#clave").css({'border-color':'black'});
            $("#reclave").css({'border-color':'black'});
        }
    });
    $("#sendRegistrar").click(function () {
        if ($("#correo").val() !== "" && $("#clave").val() !== "" && $("#reclave").val() !== "" && $("#nombre").val() !== "" && $("#apellido").val() !== "" && $("#edad").val() !== 0){
            $("#sendRegistrar").attr("disabled", false);
        } else{
            alert("Algún campo está vacío");
            $("#pwd").css({'border-color':'red'});
            $("#sendRegistrar").attr("disabled", true);
        }
    });
    
    $("#limpiar").click(function () {
        limpiar1();
    });
    function limpiar1(){
    $("#correo").val("");
    $("#clave").val("");
    $("#reclave").val("");
    $("#nombre").val("");
    $("#apellido").val("");
    $("#edad").val("");
}
});


