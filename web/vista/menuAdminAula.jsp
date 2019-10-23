<%-- 
    Document   : menuAdminAula
    Created on : 17-oct-2019, 9:06:11
    Author     : daw207
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--<script src="jquery-3.4.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $
            
                $("#botonesMenusAula").append("\
                    <form id='menuAdminAula' action='../controlador/controlador.jsp' method='POST'><br>
                        <input type='submit' id='gestionarAula' name='gestionarAula' value='Gestionar Aula'><br>
                        <input type='submit' id='gestionarFranja' name='gestionarFranja' value='Gestionar Franja Horaria'><br>
                        <input type='submit' id='volverALoginAula' name='volverALoginAula' value='Volver'><br>
                    </form>
                ");
            });
        </script>-->
    </head>
    <body>
        <!--<div id="botonesMenusAula"></div>-->
        <form id="menuAdminAula" action="../controlador/controlador.jsp" method="POST"><br>
            <input type="submit" id="gestionarAula" name="gestionarAula" value="Gestionar Aula"><br>
            <input type="submit" id="gestionarFranja" name="gestionarFranja" value="Gestionar Franja Horaria"><br>
            <input type="submit" id="volverALoginAula" name="volverALoginAula" value="Volver"><br>
        </form>
    </body>
</html>
