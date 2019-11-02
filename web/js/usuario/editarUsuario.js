$(document).ready(function () {
    $("#editarUsuario").click(function () {
        if($("#correo").val() === "" && $("#clave").val() === "" && $("#correo").val() === "" && $("#nombre").val() === "" && $("#apellido").val() === "" && $("#edad").val() === 0 ){
            location.replace("../../vista/usuario/editarUsuario.jsp");
        }
    });
    
    $("#correo").blur(function(){
        if ($("#correo").val() !== ""){
            $("#correo").css({'border-color':'black'});
        }else{
            $("#correo").css({'border-color':'red'});
        }
    });
    $("#nombre").blur(function(){
        if ($("#nombre").val() !== ""){
            $("#nombre").css({'border-color':'black'});
        }else{
            $("#nombre").css({'border-color':'red'});
        }
    });
    $("#apellido").blur(function(){
        if ($("#apellido").val() !== ""){
            $("#apellido").css({'border-color':'black'});
        }else{
            $("#apellido").css({'border-color':'red'});
        }
    });x
    $("#edad").blur(function(){
        if ($("#edad").val() !== ""){
            $("#edad").css({'border-color':'black'});
        }else{
            $("#edad").css({'border-color':'red'});
        }
    });
    $("#cambiarContra").click(function(){
        if($("#clave").val() === "" && $("#reclave").val() === ""){
            if (("#clave").val() !== ("#reclave").val()){
                location.replace("../../vista/usuario/editarUsuario.jsp");
                $("#clave").css({'border-color':'red'});
                $("#reclave").css({'border-color':'red'});
            }else{
                $("#clave").css({'border-color':'black'});
                $("#reclave").css({'border-color':'black'});
            }
        }
    });
    $("#reclave").blur(function(){
        if ($("#reclave").val() !== ""){
            $("#reclave").css({'border-color':'black'});
        }else{
            $("#reclave").css({'border-color':'orange'});
        }
    });
    $("#clave").blur(function(){
        if ($("#clave").val() !== ""){
            $("#clave").css({'border-color':'black'});
        }else{
            $("#clave").css({'border-color':'orange'});
        }
    });
});
