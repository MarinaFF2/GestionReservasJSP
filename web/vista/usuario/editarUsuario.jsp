<%-- 
    Document   : editarUsuario
    Created on : 23-oct-2019, 13:01:59
    Author     : daw207
--%>

<%@page import="clase.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_menus.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../../css/css_editarUsu.css" media="screen" />
    </head>
    <body>
        <form action="../../controlador/controladorGeneral.jsp">
        <%
            //Usuario u = (Usuario) session.getAttribute("usu");
            int n = (Integer)session.getAttribute("rol");
            if(n==3){
        %>
            <nav id="menuLoginAdminGene">
                <ul>
                    <li><a href="../menu/menuAdminGene.jsp">Administrador General</a></li>
                    <li><a href="../menu/prof.jsp">Profesor</a></li>
                    <li><a href="editarUsuario.jsp">Editar Usuario</a></li>
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
                    <li><a href="../menu/menuAdminAula.jsp">Administrador Aula</a></li>
                    <li><a href="../menu/prof.jsp">Profesor</a></li>
                    <li><a href="editarUsuario.jsp">Editar Usuario</a></li>
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
                    <li><a href="../menu/prof.jsp">Profesor</a></li>
                    <li><a href="editarUsuario.jsp">Editar Usuario</a></li>
                    <li>
                        <input type="submit" id="cerrarSesion" name="cerrarSesion" value="CerrarSesion">
                    </li>
                </ul>
            </nav>
        <% 
            }
        %>
        
            <input type="submit" id="gestionarFoto" name="gestionarFoto" value="Editar Foto"><br>
            Contraseña:*<br>
            <input type="password" id="clave" name="clave" placeholder="Contaseña" value=""><br>
            Confirmar contraseña:*<br>
            <input type="password" id="clave" name="clave" placeholder="Confirmar contaseña" value=""><br>
            <input type="submit" id="gestionarContrasenia" name="gestionarContrasenia" value="Cambiar Contrasenia"><br> 
            
        </form>
    </body>
</html>
