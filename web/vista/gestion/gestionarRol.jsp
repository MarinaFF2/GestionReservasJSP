<%-- 
    Document   : gestionarRol
    Created on : 23-oct-2019, 13:03:36
    Author     : daw207
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="clase.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_menus.css" media="screen" />
        <link rel="stylesheet" type="text/css" href=../../css/css_gestionarRol.css" media="screen" />
    </head>
    <body>
        <%
            LinkedList <Usuario> v = (LinkedList <Usuario>) session.getAttribute("lR");
        %>
        <form  name="tablaGestionarFranja" action="../../controlador/controladorGestion.jsp" method="POST">
            <nav id="menuLoginAdminGene">
                <ul>
                    <li><a href="../menu/menuAdminGene.jsp">Administrador General</a></li>
                    <li><a href="../menu/prof.jsp">Profesor</a></li>
                    <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
                    <li>
                        <input type="submit" id="cerrarSesion" name="cerrarSesion" value="CerrarSesion">
                    </li>
                </ul>
            </nav>
            <table name="gestionarRol" >
                <caption>LISTA USUARIOS</caption>
                <thead>
                    <tr>
                        <th>Correo</th>
                        <th>Rol</th>
                    </tr>
                </thead>
                <tbody>
        <%
            for (int i = 0; i < v.size(); i++) {
        %>
                    <tr>
                        <td>
                            <input type="text" name="correo" value="<%out.print(v.get(i).getCorreo());%>" readonly="true">
                        </td> 
                        <td>
                            <input type="text" name="nombre" value="<%out.print(v.get(i).getNombre());%>">
                        </td>   
                        
                        <td>
                            <input type="submit" name="botUsuario" value="Editar">
                        </td>
                    </tr>
        <%
            }
        %>
                </tbody>
            </table>
        </form>
    </body>
</html>
