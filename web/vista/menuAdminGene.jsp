<%-- 
    Document   : menuAdminGene
    Created on : 17-oct-2019, 9:06:21
    Author     : daw207
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form id="menuAdminGene" action="../controlador/controlador.jsp" method="POST">
            <input type="submit" id="gestionarAula" name="gestionarAula" value="Gestionar Aula"><br>
            <input type="submit" id="gestionarFranja" name="gestionarFranja" value="Gestionar Franja Horaria"><br>
            <input type="submit" id="gestionarUsuario" name="gestionarUsuario" value="Gestionar Usuarios"><br>
            <input type="submit" id="volverALoginGene" name="volverALoginGene" value="Volver"><br>
        </form>
    </body>
</html>
