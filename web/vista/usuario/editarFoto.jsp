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
        <meta http-equiv="refresh" content="60;url=../../index.jsp">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_menus.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../../css/usuario/css_editarUsu.css" media="screen" />
        <script src="../../jquery-3.4.1.min.js"></script>
        <script src="js/usuario/editarFoto.js"></script>
    </head>
    <body>
        <form  name="tablaGestionarFranja" action="../../controlador/controladorGeneral.jsp" method="POST">
            <%
                int n =(Integer) session.getAttribute("nrol");
                if(n == 3) {
            %>
            <nav>
                <ul>
                    <li>
                        <a href="#" id="editarUsuario" class="active"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a>
                        <ul>
                            <li><a href="editarFoto.jsp">Editar Foto</a></li>
                            <li><a href="editarUsuario.jsp">Editar Usuario</a></li>
                        </ul>
                    </li>
                    <li><a href="../gestion/gestionarAula.jsp">Gestionar Aula</a></li>
                    <li><a href="../gestion/gestionarFranja.jsp">Gestionar Franja</a></li>
                    <li><a href="../gestion/gestionarUsuario.jsp">Gestion Usuario</a></li>
                    <li><a href="../gestion/gestionarRol.jsp">Gestion Rol</a></li>
                    <li><a href="principal.jsp">Cambiar Rol</a></li>
                    <li><input type="submit" id="bitacora" name="bitacora"  value="VerBitacora"></li>
                    <li>
                        <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                    </li>
                </ul>
            </nav>
            <%
            } else if (n == 2) {
            %>
            <nav>
                <ul>
                    <li>
                        <a href="#" id="editarUsuario"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
                        <ul>
                            <li><a href="editarFoto.jsp">Editar Foto</a></li>
                            <li><a href="editarUsuario.jsp">Editar Usuario</a></li>
                        </ul>
                    </li>
                    <li><a href="principal.jsp">Cambiar Rol</a></li>
                    <li><a href="../gestion/gestionarAula.jsp">Gestionar Aula</a></li>
                    <li><a href="../gestion/gestionarFranja.jsp">Gestionar Franja</a></li>
                    <li>
                        <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                    </li>
                </ul>
            </nav>
            <%
            } else {
            %>  
            <nav>
                <ul>
                    <li>
                        <a href="#" id="editarUsuario"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
                        <ul>
                            <li><a href="editarFoto.jsp">Editar Foto</a></li>
                            <li><a href="editarUsuario.jsp">Editar Usuario</a></li>
                        </ul>
                    </li>
                    <li><a href="principal.jsp">Cambiar Rol</a></li>
                    <li><a href="../gestion/prof.jsp">Reservar Aula</a></li>
                    <li>
                        <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                    </li>
                </ul>
            </nav>
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
        <form id="editarUsu1" name="editarUsu1" action="../../controlador/editarFoto.jsp" enctype="multipart/form-data" method="POST">
            <div id="imgPerfil">
                <img id="fotoPerfil" src="<%=u.getFotoimgString() %>" alt='Foto de perfil no encontrada'/></br>
                <input type="file" name="fichero"/></br>
                <input type="submit" id="gestionarFoto" name="gestionarFoto" value="Editar Foto"><br>
            </div>
        </form>
    </body>
</html>
