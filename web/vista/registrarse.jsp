<%-- 
    Document   : resgistrarse
    Created on : 17-oct-2019, 9:49:01
    Author     : daw207
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="jquery-3.4.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#send").click(function () {
                    var correo = $("#correo").val();
                    var nombre = $("#clave").val();
                    var nombre = $("#nombre").val();
                    var apellido = $("#apellido").val();
                    var edad = $("#edad").val();
                });
                function limpiar(){
                    $("#correo").val("");
                    $("#clave").val("");
                    $("#nombre").val("");
                    $("#apellido").val("");
                    $("#edad").val("");
                }
            });
        </script>-->
    </head>
    <body>
       <form id="registrarse" action="../controlador/controlador.jsp" method="POST">
            Correo:*<br>
            <input type="email" id="correo" name="correo" placeholder="Correo" value=""><br>
            Contraseña:*<br>
            <input type="password" id="clave" name="clave" placeholder="Contaseña" value=""><br>
            Nombre:*<br>
            <input type="text" id="nombre" name="nombre" placeholder="Nombre" value="" pattern="[A-Za-z]{1,50}"><br>
            Apellidos:*<br>
            <input type="text" id="apellido" name="apellido" placeholder="Apellido" value="" pattern="[A-Za-z]{1,50}"><br>
            Edad:*<br>
            <input type="number" id="edad" name="edad" placeholder="Edad" value=""><br>
            <input type="submit" id="sendRegistrar" name="sendRegistrar" value="Enviar"><br>
            <input type="submit" id="volverAIndex" name="volverAIndex" value="Volver al login"><br>
        </form>
    </body>
</html>