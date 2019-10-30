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
                                <li><a href="gestionarAula.jsp">Gestionar Aula</a></li>
                                <li><a href="gestionarFranja.jsp">Gestionar Franja</a></li>
                                <li><a href="gestionarUsuario.jsp">Gestion Usuario</a></li>
                                <li><a href="gestionarRol.jsp">Gestion Rol</a></li>
                            </ul>
                        </li>
                        <li><input type="submit" id="bitacora" name="bitacora"  value="VerBitacora"></li>
                        <li><a href="#">Profesor</a>
                            <ul>
                                <li><a href="prof.jsp">Reservar Aula</a><span class="flecha"></span></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" id="editarUsuario"  alt="EditarUsuario"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
                            <ul>
                                <li><a href="../usuario/editarFoto.jsp">Editar Foto</a></li>
                                <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
                            </ul>
                        </li>
                        <li>
                            <input type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion">
                        </li>
                    </ul>
                </nav>
            </header>
        </form>
        <table name="gestionarUsuario" >
            <caption>LISTA ROLES</caption>
            <thead>
                <tr>
                    <th>CORREO</th>
                    <th>ROL</th>
                </tr>
            </thead>
            <tbody>
            <%
                ConexionEstatica.nueva();
                LinkedList <Usuario> v = ConexionEstatica.obtenerUsu();
                ConexionEstatica.cerrarBD();
                for (int i = 0; i < v.size(); i++) {
            %>
                <form  name="tablaGestionarUsuario" action="../../controlador/controladorGestion.jsp" method="POST">
                    <tr>
                        <td>
                            <input type="text" name="correo" value="<%=v.get(i).getCorreo()%>" readonly="true">
                        </td>
                        <td>
                            <input type="number" name="rol" value="<%=v.get(i).getRol()%>" pattern="[1-3]{1}">
                        </td>
                        <td>
                            <input type="submit" name="botRol" value="X">
                        </td>
                        <td>
                            <input type="submit" name="botRol" value="Editar">
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
