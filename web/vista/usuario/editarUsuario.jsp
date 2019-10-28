<%-- 
    Document   : editarUsuario
    Created on : 23-oct-2019, 13:01:59
    Author     : daw207
--%>

<%@page import="BBDD.ConexionEstatica"%>
<%@page import="clase.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_menus.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../../css/usuario/css_editarUsu.css" media="screen" />
        <script src="../../jquery-3.4.1.min.js"></script>
        <script src="js/usuario/editarUsuario.js"></script>
    </head>
    <body>
        <form name="tablaEditerUsuario" action="../../controlador/controladorGeneral.jsp" method="POST">
        <%
            int n = (Integer)session.getAttribute("rol");
            if(n==3){
        %>
            <header>
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
            </header>    
        <%  
            }else if(n==2){
        %>
            <header>
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
            </header>
        <% 
            }else{
        %>
            <header>
                <nav id="prof">
                    <ul>
                        <li><a href="../menu/prof.jsp">Profesor</a></li>
                        <li><a href="editarUsuario.jsp">Editar Usuario</a></li>
                        <li>
                            <input type="submit" id="cerrarSesion" name="cerrarSesion" value="CerrarSesion">
                        </li>
                    </ul>
                </nav>
            </header>
            <% 
                }
            %>
        </form>
        <% 
            String uu = (String) session.getAttribute("usu");
            ConexionEstatica.nueva();
            Usuario u = ConexionEstatica.existeUsu(uu);
            ConexionEstatica.cerrarBD();
        %>
        <form id="registrarse" action="../../controlador/controladorGeneral.jsp" method="POST">
            <div id="imgPerfil">
                <img id="fotoPerfil" src="<%u.getFoto();%>"/>
            </div>
            <input type="submit" id="gestionarFoto" name="gestionarFoto" value="Editar Foto"><br>
            Correo:*<br>
            <input type="email" id="correo" name="correo" placeholder="Correo" value="<%u.getCorreo();%>"><br>
            Contraseña:*<br>
            <input type="password" id="clave" name="clave" placeholder="Contaseña" value="<%u.getClave();%>"><br>
            Nombre:*<br>
            <input type="text" id="nombre" name="nombre" placeholder="Nombre" value="<%u.getNombre();%>" pattern="[A-Za-z]{1,50}"><br>
            Apellidos:*<br>
            <input type="text" id="apellido" name="apellido" placeholder="Apellido" value="<%u.getApellido();%>" pattern="[A-Za-z]{1,50}"><br>
            Edad:*<br>
            <input type="number" id="edad" name="edad" placeholder="Edad" value="<%u.getEdad();%>"><br>
        
            <input type="submit" id="editarUsu" name="editarUsu" value="Guardar"><br> 
        </form>
        </form>
    </body>
</html>
