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
        <script src="js/usuario/editarUsuario.js"></script>
    </head>
    <body>
        <form action="../../controlador/controladorGeneral.jsp" method="POST">
            <%
                int n = (Integer) session.getAttribute("rol");
                if (n == 3) {
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
                    <li><a href="#">Administrador General</a><span class="flecha"></span>
                        <ul>
                            <li><a href="../gestion/gestionarAula.jsp">Gestionar Aula</a></li>
                            <li><a href="../gestion/gestionarFranja.jsp">Gestionar Franja</a></li>
                            <li><a href="../gestion/gestionarUsuario.jsp">Gestion Usuario</a></li>
                            <li><a href="../gestion/gestionarRol.jsp">Gestion Rol</a></li>
                        </ul>
                    </li>
                    <li><input type="submit" id="bitacora" name="bitacora"  value="VerBitacora"></li>
                    <li><a href="#">Profesor</a><span class="flecha"></span>
                        <ul>
                            <li><a href="../gestion/prof.jsp">Reservar Aula</a></li>
                        </ul>
                    </li>

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
                        <a href="#"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
                        <ul>
                            <li><a href="editarFoto.jsp">Editar Foto</a></li>
                            <li><a href="editarUsuario.jsp">Editar Usuario</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Administrador Aula</a><span class="flecha"></span>
                        <ul>
                            <li><a href="../gestion/gestionarAula.jsp">Gestionar Aula</a></li>
                            <li><a href="../gestion/gestionarFranja.jsp">Gestionar Franja</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Profesor</a><span class="flecha"></span>
                        <ul>
                            <li><a href="../gestion/prof.jsp">Reservar Aula</a></li>
                        </ul>
                    </li>
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
                    <li><a href="#">Profesor</a><span class="flecha"></span>
                        <ul>
                            <li><a href="../gestion/prof.jsp">Reservar Aula</a></li>
                        </ul>
                    </li>
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
        <form id="editarUsu2" name="editarUsu2" action="../../controlador/controladorGeneral.jsp"method="POST">
            Nueva contraseña:*<br>
            <input type="password" id="clave" name="clave" placeholder="Contaseña"><br>
            Confirmar nueva contraseña:*<br>
            <input type="password" id="reclave" name="reclave" placeholder="Confirmar contaseña" ><br>
            <input type="submit" id="cambiarContra" name="cambiarContra" value="Cambiar"><br> 
        </form>
        <form id="editarUsu3" name="editarUsu3" action="../../controlador/controladorGeneral.jsp"method="POST">
            Correo:*<br>
            <input type="email" id="correo" name="correo" placeholder="Correo" value="<%=u.getCorreo()%>"><br>
            Nombre:*<br>
            <input type="text" id="nombre" name="nombre" placeholder="Nombre" value="<%=u.getNombre()%>" pattern="[A-Za-z]{1,50}"><br>
            Apellidos:*<br>
            <input type="text" id="apellido" name="apellido" placeholder="Apellido" value="<%=u.getApellido()%>" pattern="[A-Za-z]{1,50}"><br>
            Edad:*<br>
            <input type="number" id="edad" name="edad" placeholder="Edad" value="<%=u.getEdad()%>"><br>
            <input type="submit" id="editarUsu" name="editarUsu" value="Guardar"><br> 
        </form>
    </body>
</html>
