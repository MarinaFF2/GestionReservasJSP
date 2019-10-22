<%-- 
    Document   : adminAul
    Created on : 15-oct-2019, 22:49:41
    Author     : Marina Flores Fernandez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form id="menuLoginAdminAula" action="../controlador/controlador.jsp" method="POST">
            <select name="comoAccederLoginAula">
                <option value="adminAula" selected>Administrador de aulas</option>
                <option value="prof" selected>Profesor</option>
            </select>
            <input type="submit" id="entrarLoginAdminAula" name="entrarLoginAdminAula" value="Entrar">
            <input type="submit" id="cerrarSesion" name="cerrarSesion" value="CerrarSesion">
        </form>
    </body>
</html>
