<%-- 
    Document   : adminGene
    Created on : 15-oct-2019, 22:50:10
    Author     : Marina Flores Fernandez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form id="menuLoginAdminGene" action="../controlador/controlador.jsp" method="POST">
            <select name="comoAccederLoginGene">
                <option value="adminGene" selected>Administrador general</option>
                <option value="prof" selected>Profesor</option>
            </select>
            <input type="submit" id="entrarLoginAdminGene" name="entrarLoginAdminGene" value="Entrar">
            <input type="submit" id="cerrarSesion" name="cerrarSesion" value="CerrarSesion">
        </form>
    </body>
</html>
