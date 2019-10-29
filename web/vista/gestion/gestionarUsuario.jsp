<%-- 
    Document   : gestionarUsuario
    Created on : 18-oct-2019, 12:43:56
    Author     : daw207
--%>

<%@page import="BBDD.ConexionEstatica"%>
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
        <link rel="stylesheet" type="text/css" href="../../css/css_gestionarUsu.css" media="screen" />
    </head>
    <body>
        <%
            ConexionEstatica.nueva();
            LinkedList <Usuario> v = ConexionEstatica.obtenerUsuarios();
            ConexionEstatica.cerrarBD();
        %>
        <form  name="tablaGestionarUsuario" action="../../controlador/controladorGeneral.jsp" method="POST">
            <header>
                <a href="#" id="menu_on">
                    <span></span>
                    <span></span>
                    <span></span>
                </a>
                <nav id="menuLoginAdminGene">
                    <ul>
                        <li><a href="#">Administrador General</a><span class="flecha"></span>
                            <ul>
                                <li><a href="../gestion/gestionarAula.jsp">Gestionar Aula</a></li>
                                <li><a href="../gestion/gestionarFranja.jsp">Gestionar Franja</a></li>
                                <li><a href="../gestion/gestionarUsuario.jsp">Gestion Usuario</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Profesor</a>
                            <ul>
                                <li><a href="../gestion/prof.jsp">Reservar Aula</a><span class="flecha"></span></li>
                            </ul>
                        </li>
                        <li>
                            <input type="submit" id="editarUsuario" name="editarUsuario"  value="EditarUsuario">
                        </li>
                        <li>
                            <input type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion">
                        </li>
                    </ul>
                </nav>
            </header>
        </form>
        <table name="gestionarUsuario" >
            <caption>LISTA USUARIOS</caption>
            <thead>
                <tr>
                    <th>CORREO</th>
                    <th>NOMBRE</th>
                    <th>APELLIDO</th>
                    <th>EDAD</th>
                    <th>ROL</th>
                </tr>
            </thead>
            <tbody>
            <%
                for (int i = 0; i < v.size(); i++) {
            %>
                <form  name="tablaGestionarUsuario" action="../../controlador/controladorGestion.jsp" method="POST">
                    <tr>
                        <td>
                            <input type="text" name="correo" value="<%out.print(v.get(i).getCorreo());%>" readonly="true">
                        </td> 
                        <td>
                            <input type="text" name="nombre" value="<%out.print(v.get(i).getNombre());%>">
                        </td>   
                        <td>
                            <input type="text" name="apellido" value="<%out.print(v.get(i).getApellido());%>">
                        </td>
                        <td>
                            <input type="number" name="edad" value="<%out.print(v.get(i).getEdad());%>">
                        </td>
                        <td>
                            <input type="text" name="rol" value="<%v.get(i).getRol();%>" pattern="[1-3]">
                        </td>
                        <td>
                            <input type="submit" name="botUsuario" value="X">
                        </td>
                        <td>
                            <input type="submit" name="botUsuario" value="Editar">
                        </td>
                    </tr>
                </form>
        <%
            }
        %>
            </tbody>
        </table>
    </body>
</html>
