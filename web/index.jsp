<%-- 
    Document   : index1
    Created on : 23-oct-2019, 12:57:18
    Author     : daw207
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>I.E.S.</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../css/usuario/css_index.css" media="screen" />
        <script src="jquery-3.4.1.min.js"></script>
    </head>
    <body>
        <%
            //out.println(session.getId() + " " + session.getMaxInactiveInterval() + "<br>"); 
        %>
        <header>
            <h1>Iniciar Sesión</h1>
        </header>
        <main>
            <form id="inicioSesion" action="controlador/controladorGeneral.jsp" method="POST">
                <label>Usuario</label><input type="text" id="usuario" name="usuario" value=""><br>
                <label>Contraseña</label><input type="password" id="pwd" name="pwd" value=""><br>
                <a href="vista/usuario/registrarse.jsp">Registrarse</a>
                <a href="vista/usuario/olvidoPwd.jsp">He olvidado la contraseña</a></br>
                <input type="submit" id="aceptarIndex" name="aceptarIndex" value="Aceptar">
            </form>
            <!--<form id="insertarFranjas" action="controlador/controladorInsertarFranjas.jsp" method="POST">
                <input type="submit" id="insertarFranja" name="insertarFranja" value="Insertar">
            </form>-->
        </main>
    </body>
</html>
