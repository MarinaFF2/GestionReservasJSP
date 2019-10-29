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
            cont++;
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
        }else{
            $("#clave").css({'color':'orange'});
        }
    });
    $("#correo").blur(function(){
        if ($("#correo").val() !== ""){
            cont=cont++;
        }else{
            $("#correo").css({'border-color':'red'});
        }
    });
    $("#nombre").blur(function(){
        if ($("#nombre").val() !== ""){
            cont=cont++;
        }else{
            $("#nombre").css({'border-color':'red'});
        }
    });
    $("#apellido").blur(function(){
        if ($("#apellido").val() !== ""){
            cont=cont++;
        }else{
            $("#apellido").css({'border-color':'red'});
        }
    });
    $("#correo").blur(function(){
        if ($("#correo").val() !== ""){
            cont=cont++;
        }else{
            $("#correo").css({'border-color':'red'});
        }
    });
    $("#clave").blur(function(){
        if ($("#clave").val() !== ""){
            cont++;
        }else{
            $("#clave").css({'color':'orange'});
        }
    });
    $("#reclave").blur(function(){
        if ($("#reclave").val() !== ""){
            cont++;
        }else{
            $("#reclave").css({'color':'orange'});
        }
    });
    $("#nombre").blur(function(){
        if ($("#nombre").val() !== ""){
            cont=cont++;
        }else{
            $("#nombre").css({'border-color':'red'});
        }
    });
    $("#edad").blur(function(){
        if ($("#edad").val() !== ""){
            cont=cont++;
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


