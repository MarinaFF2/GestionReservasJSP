$(document).ready(function () {
    $("#aceptar").click(function(){   
        if($("#usuario").val()===""){
            alert("Algún campo está vacio");
            $("#usuario").css({'background-color':'red'});
        }
        if($("#pwd").val()===""){
            alert("Algún campo está vacio");
            $("#pwd").css({'background-color':'red'});
        }
    });
});


