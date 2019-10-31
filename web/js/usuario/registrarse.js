$(document).ready(function () {
    var cap = null;
    var i = Math.floor(Math.random() * 6) + 1;
    switch(i){
        case 1:
            $("#catchap" ).append( "<img alt='error al mostrar la imagen' src='../../img/captcha/1.jpeg'>" );
            cap="qGphJD";
        break;
        case 2:
            $("#catchap" ).append( "<img alt='error al mostrar la imagen' src='../../img/captcha/2.jpeg'>");
            cap="15A84";
        break;
        case 3:
            $("#catchap" ).append( "<img alt='error al mostrar la imagen' src='../../img/captcha/3.jpeg'>");
            cap="6HJH6CTN";
        break;
        case 4:
            $("#catchap" ).append( "<img alt='error al mostrar la imagen' src='../../img/captcha/4.jpeg'>");
            cap="EXXTENHK";
        break;
        case 5:
            $("#catchap" ).append( "<img alt='error al mostrar la imagen' src='../../img/captcha/5.jpeg'>");
            cap="XYHNXCDR";
        break;
        case 6:
            $("#catchap" ).append( "<img alt='error al mostrar la imagen' src='../../img/captcha/6.jpeg'>");
            cap="Y4Y7D";
        break;
    }
    $("#send").blur(function(){
        if($("#correo").val() === "" &&$("#clave").val() === "" && $("#correo").val() === "" && $("#nombre").val() === "" && $("#apellido").val() === "" && $("#edad").val() === 0 && $("#clave").val() === "" && $("#reclave").val() === ""){
            if ($("#clave").val() === $("#reclave").val()){
                if($("#capt").val()!==cap){
                    location.replace("../../index.jsp");
                }
            }
        }
    });
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
            $("#clave").css({'color':'black'});
        }else{
            $("#clave").css({'color':'orange'});
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
    });
    $("#file").blur(function(){
        if ($("#file").val() !== ""){
            
            $("#file").css({'border-color':'black'});
        }else{
            $("#file").css({'border-color':'red'});
        }
    });
    $("#edad").blur(function(){
        if ($("#edad").val() !== ""){
            $("#edad").css({'border-color':'black'});
        }else{
            $("#edad").css({'border-color':'red'});
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


