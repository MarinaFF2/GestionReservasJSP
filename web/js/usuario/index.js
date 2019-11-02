$(document).ready(function () {
    $("#aceptar").click(function(){   
        if($("#usuario").val()==="" && $("#pwd").val()===""){
            location.replace("../../index.jsp");
        }
    });
    $("#usuario").blur(function(){   
        if($("#usuario").val()===""){
            $("#usuario").css({'border-color':'red'});
        }
    });
    $("#pwd").blur(function(){
        if($("#pwd").val()===""){
            location.replace("../../index.jsp");
            $("#pwd").css({'border-color':'red'});
        }
    });
});


