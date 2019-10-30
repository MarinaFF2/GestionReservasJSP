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
    <body  onload="aniadir()">
        <header><h1>Registrarse</h1></header>
        <form id="registrarse" name="asd" action="../../controlador/subeFoto.jsp" enctype="multipart/form-data" method="POST">
            <p>Correo:*</p><br>
            <input type="email" id="correo" name="correo" placeholder="Correo"><br>
            <p>Contraseña:*</p><br>
            <input type="password" id="clave" name="clave" placeholder="Contaseña"><br>
            <p>Confirmar contraseña:*</p><br>
            <input type="password" id="reclave" name="reclave" placeholder="Confirmar contaseña" ><br>
            <p>Nombre:*</p><br>
            <input type="text" id="nombre" name="nombre" placeholder="Nombre" value="" pattern="[A-Za-z]{1,50}"><br>
            <p>Apellidos:*</p><br>
            <input type="text" id="apellido" name="apellido" placeholder="Apellido" pattern="[A-Za-z]{1,50}"><br>
            <p>Edad:*</p><br>
            <input type="number" id="edad" name="edad" placeholder="Edad" value="0" pattern="[0-9]"><br>
            <p>Foto: </p><input type="file" id="file" name="fichero"/></br> 
            <div id="catchap">
            </div>
            <input type="text" id="capt" value=""></br>
            
            <input type="submit" id="sendRegistrar" name="sendRegistrar" value="Enviar"><br>
            <input type="button" id="limpiar" value="Limpiar"><br>
            
        </form>   
        <form id="volver" action="../../controlador/controladorGeneral.jsp" method="POST">
            <input type="submit" id="volverAIndex" name="volverAIndex" value="Volver al login"><br>
        </form>
    </body>
</html>
