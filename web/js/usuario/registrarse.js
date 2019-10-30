$(document).ready(function () {
    var cont = 0;
    
    $("#reclave").blur(function(){
        if ($("#clave").val() !== $("#reclave").val()){
            $("#clave").css({'border-color':'red'});
            $("#reclave").css({'border-color':'red'});
        }else{
            $("#clave").css({'border-color':'black'});
            $("#reclave").css({'border-color':'black'});
        }
        if ($("#reclave").val() !== ""){
            cont++;$("#reclave").css({'color':'black'});
        }else{
            $("#reclave").css({'color':'orange'});
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
        if ($("#clave").val() !== ""){
            cont++;
            $("#clave").css({'color':'black'});
        }else{
            $("#clave").css({'color':'orange'});
        }
    });
    $("#correo").blur(function(){
        if ($("#correo").val() !== ""){
            cont=cont++;
            $("#correo").css({'border-color':'black'});
        }else{
            $("#correo").css({'border-color':'red'});
        }
    });
    $("#nombre").blur(function(){
        if ($("#nombre").val() !== ""){
            cont=cont++;
            $("#nombre").css({'border-color':'black'});
        }else{
            $("#nombre").css({'border-color':'red'});
        }
    });
    $("#apellido").blur(function(){
        if ($("#apellido").val() !== ""){
            cont=cont++;
            $("#apellido").css({'border-color':'black'});
        }else{
            $("#apellido").css({'border-color':'red'});
        }
    });
    $("#edad").blur(function(){
        if ($("#edad").val() !== ""){
            cont=cont++;
            $("#edad").css({'border-color':'black'});
        }else{
            $("#edad").css({'border-color':'red'});
        }
    });
    
    if(cont>=5){
        $("#sendRegistrar").attr("disabled", false);
    }
    
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


