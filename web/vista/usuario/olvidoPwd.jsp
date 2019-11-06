<%-- 
    Document   : controladorJuego
    Created on : 11-oct-2019, 10:38:25
    Author     : marina flores
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../../css/usuario/css_olvidarContrasenia.css" media="screen" />
    </head>
    <body>
        <h1>Recuperar contraseña</h1>
        <form name="olvidoPwd" action="../../controlador/conectorGeneral.jsp" method="post">
            <p>Introduce tu correo: </p><input type="text" name="email" placeholder="Introduzca su correo"><br>
            <input class="botones" type="submit" name="botOlvidoPwd" value="Recuperar contraseña"><br>
            <input type="submit" id="volverIndex" name="volverIndex" value="Volver"><br>
        </form>
    </body>
</html>
