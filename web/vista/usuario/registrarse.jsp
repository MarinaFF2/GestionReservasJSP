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
        <title>Registrarse</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/usuario/css_registrarse.css" media="screen" />
        <script src="../../jquery-3.4.1.min.js"></script>
        <script src="../../js/usuario/registrarse.js"></script>
    </head>
    <body>
        <header><h1>Registrarse</h1></header>
        <form id="registrarse" action="../../controlador/subefichero.jsp" enctype="multipart/form-data" method="POST">
            Correo:*<br>
            <input type="email" id="correo" name="correo" placeholder="Correo"><br>
            Contraseña:*<br>
            <input type="password" id="clave" name="clave" placeholder="Contaseña"><br>
            Confirmar contraseña:*<br>
            <input type="password" id="reclave" name="reclave" placeholder="Confirmar contaseña" ><br>
            Nombre:*<br>
            <input type="text" id="nombre" name="nombre" placeholder="Nombre" value="" pattern="[A-Za-z]{1,50}"><br>
            Apellidos:*<br>
            <input type="text" id="apellido" name="apellido" placeholder="Apellido" pattern="[A-Za-z]{1,50}"><br>
            Edad:*<br>
            <input type="number" id="edad" name="edad" placeholder="Edad" pattern="[0-9]"><br>
            Foto: <input type="file" name="fichero"/></br> 
            <input type="submit" id="sendRegistrar" name="sendRegistrar" value="Enviar"><br>
            <input type="button" id="limpiar" value="Limpiar"><br>
        </form>   
        <form id="volver" action="../../controlador/controladorGeneral.jsp" method="POST">
            <input type="submit" id="volverAIndex" name="volverAIndex" value="Volver al login"><br>
        </form>
    </body>
</html>
