<%-- 
    Document   : index1
    Created on : 23-oct-2019, 12:57:18
    Author     : daw207
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--<script src="jquery-3.4.1.min.js"></script>
        <script>
            $(document).ready(function () {
                if($("#correo").val()===null || $("#clave").val()===null){
                        $("#aceptarIndex").attr("disabled", true);
                        alert("Algún campo está vacio");
                }
            });
        </script>-->
    </head>
    <body>
        <%
            out.println(session.getId() + " " + session.getMaxInactiveInterval() + "<br>"); 
        %>
        <form id="inicioSesion" action="controlador/controlador.jsp" method="POST">
            <label>Usuario</label><input type="text" id="usuario" name="usuario" value=""><br>
            <label>Contraseña</label><input type="password" id="pwd" name="pwd" value=""><br>
            <a href="vista/registrarse.jsp">Registrarse</a>
            <a href="vista/olvidoPwd.jsp">He olvidado la contraseña</a></br>
            <input type="submit" id="aceptarIndex" name="aceptarIndex" value="Aceptar">
        </form>
    </body>
</html>
