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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_menus.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_menuAdminAula.css" media="screen" />
    </head>
    <body>
        <form id="menuAdminAula" action="../../controlador/controladorGeneral.jsp" method="POST">
        <%
            int n = (Integer)session.getAttribute("rol");
            if(n==3){
        %>
            <nav id="menuLoginAdminGene">
                <ul>
                    <li><a href="menuAdminGene.jsp">Administrador General</a></li>
                    <li><a href="prof.jsp">Profesor</a></li>
                    <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
                    <li>
                        <input type="submit" id="cerrarSesion" name="cerrarSesion" value="CerrarSesion">
                    </li>
                </ul>
            </nav>
        <%  
            }else if(n==2){
        %>
            <nav id="menuLoginAdminAula">
                <ul>
                    <li><a href="menuAdminGene.jsp">Administrador Aula</a></li>
                    <li><a href="prof.jsp">Profesor</a></li>
                    <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
                    <li>
                        <input type="submit" id="cerrarSesion" name="cerrarSesion" value="CerrarSesion">
                    </li>
                </ul>
            </nav>
        <% 
            }else{
        %>
            <nav id="prof">
                <ul>
                    <li><a href="prof.jsp">Profesor</a></li>
                    <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
                    <li>
                        <input type="submit" id="cerrarSesion" name="cerrarSesion" value="CerrarSesion">
                    </li>
                </ul>
            </nav>
        <% 
            }
        %>
        <br>
            <input type="submit" id="gestionarAula" name="gestionarAula" value="Gestionar Aula"><br>
            <input type="submit" id="gestionarFranja" name="gestionarFranja" value="Gestionar Franja Horaria"><br>
        </form>
    </body>
</html>
