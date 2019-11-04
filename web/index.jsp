<%-- 
    Document   : index1
    Created on : 23-oct-2019, 12:57:18
    Author     : daw207
--%>

<%@page import="BBDD.BitacorasFichero"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>I.E.S.</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/usuario/css_index.css" media="screen" />
        <script src="jquery-3.4.1.min.js"></script>
        <script src="js/usuario/index.js"></script>
    </head>
    <body>
        <%
            HttpSession s = request.getSession();
            s.setMaxInactiveInterval(59);
            if (s.getMaxInactiveInterval() == 0) {
                s.removeAttribute("usu");
                s.invalidate();
            }
        %>
        <header>
            <h1 id="cabe">Iniciar Sesión</h1>
        </header>
        <main>
            <form id="inicioSesion" action="controlador/controladorGeneral.jsp" method="POST">
                <div id="usu">
                    <p>Usuario</p><input type="text" id="usuario" name="usuario" placeholder="usuario@x.x"><br>
                </div>
                <div id="con">
                    <p>Contraseña</p><input type="password" id="pwd" name="pwd" placeholder="Contraseña"><br>
                </div>
                <div id="re">
                    <a id="regis" href="vista/usuario/registrarse.jsp">Registrarse</a>
                    <a id="olvidar" href="vista/usuario/olvidoPwd.jsp">He olvidado la contraseña</a><br>
                </div>
                <div id="acep">
                    <input type="submit" id="aceptar" name="aceptarIndex" value="Aceptar">
                </div>
            </form>
        </main>
    </body>
</html>