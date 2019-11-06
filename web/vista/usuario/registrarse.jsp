<%-- 
    Document   : resgistrarse
    Created on : 17-oct-2019, 9:49:01
    Author     : daw207
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrarse</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/usuario/css_registrarse.css" media="screen" />
        <script src="../../jquery-3.4.1.min.js"></script>
        <script src="../../js/usuario/registrarse.js"></script>
    </head>
    <body  onload="aniadir()">
        <h1>Registrarse</h1>
        <main>
            <form id="registrarse" name="asd" action="../../controlador/subeFoto.jsp" enctype="multipart/form-data" method="POST">
                <p>Correo:*</p>
                    <input type="email" class="test" id="correo" name="correo" placeholder="Correo"><br>
                <p>Contraseña:*</p>
                    <input type="password" class="test" id="clave" name="clave" placeholder="Contaseña"><br>
                <p>Confirmar contraseña:*</p>
                    <input type="password" class="test" id="reclave" name="reclave" placeholder="Confirmar contaseña" >
                <p>Nombre:*</p>
                    <input type="text" class="test" id="nombre" name="nombre" placeholder="Nombre" value="" pattern="[A-Za-z]{1,50}"><br>
                <p>Apellidos:*</p>
                    <input type="text" class="test" id="apellido" name="apellido" placeholder="Apellido" pattern="[A-Za-z]{1,50}"><br>
                <p>Edad:*</p>
                    <input type="number"class="test" id="edad" name="edad" placeholder="Edad" value="0" pattern="[0-9]"><br>
                <p>Foto:</p>
                <input type="file" id="file" name="fichero"/></br> 
                <div id="catchap">
                    
                </div>
                <input type="text" id="capt" value=""></br>
                <div id="botones">
                    <input type="submit" id="sendRegistrar" name="sendRegistrar" value="Enviar">
                    <input type="button" id="limpiar" value="Limpiar">
                </div>
            </form>   
            <form id="volver" action="../../controlador/controladorGeneral.jsp" method="POST">
                <input type="submit" id="volverIndex" name="volverIndex" value="Volver">
            </form>
        </main>
    </body>
</html>
