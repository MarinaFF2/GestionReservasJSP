<%-- 
    Document   : gestionarAula
    Created on : 18-oct-2019, 12:42:31
    Author     : daw207
--%>

<%@page import="BBDD.ConexionEstatica"%>
<%@page import="java.util.LinkedList"%>
<%@page import="clase.Aula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <meta http-equiv="refresh" content="60;url=../../index.jsp">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_menus.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../../css/gestion/css_gestionarAula.css" media="screen" />
        
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
                            <li><a href="../usuario/editarFoto.jsp">Editar Foto</a></li>
                                <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
                        </ul>
                    </li>
                    <li><a href="gestionarAula.jsp">Gestionar Aula</a></li>
                    <li><a href="gestionarFranja.jsp">Gestionar Franja</a></li>
                    <li><a href="gestionarUsuario.jsp">Gestion Usuario</a></li>
                    <li><a href="gestionarRol.jsp">Gestion Rol</a></li>
                    <li><a href="../usuario/cambiarRol.jsp">Cambiar Rol</a></li>
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
                            <li><a href="../usuario/editarFoto.jsp">Editar Foto</a></li>
                            <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
                        </ul>
                    </li>
                    <li><a href="../usuario/cambiarRol.jsp">Cambiar Rol</a></li>
                    <li><a href="gestionarAula.jsp">Gestionar Aula</a></li>
                    <li><a href="gestionarFranja.jsp">Gestionar Franja</a></li>
                    <li>
                        <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                    </li>
                </ul>
            </nav>
            <%
                }
            %>
        </form>
        <div>
        <table>
            <caption>LISTA AULAS</caption>
            <thead>
                <tr>
                    <th>NOMBRE</th>
                    <th>DESCRIPCION</th>
                </tr>
            </thead>
            <tbody>
            <%
                ConexionEstatica.nueva();
                LinkedList <Aula> v = ConexionEstatica.obtenerAulas();
                ConexionEstatica.cerrarBD();
                for (int i = 0; i < v.size(); i++) {
            %>
                <form action="../../controlador/controladorGestion.jsp" method="POST">
                    <tr>
                        <td>
                            <input type="text" name="codAula" value="<%=v.get(i).getCodAula()%>">
                        </td>   
                        <td>
                            <input type="text" name="descripcionAula" value="<%=v.get(i).getDescripcion()%>">
                        </td>    
                        <td>
                            <button type="submit" id="eliminar" name="botAula" value="X">
                        </td>
                        <td>
                            <button type="submit" id="editar" name="botAula" value="Editar">
                            <input type="hidden" id="clave" name="aula" value="<%=v.get(i).getCodAula()%>">
                        </td>
                    </tr>
                </form>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
            <footer>
                <div>Icons made by <a href="https://www.flaticon.es/autores/kiranshastry" title="Kiranshastry">Kiranshastry</a> from <a href="https://www.flaticon.es/"             title="Flaticon">www.flaticon.com</a></div>
                <div>Icons made by <a href="https://www.flaticon.es/autores/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.es/"             title="Flaticon">www.flaticon.com</a></div>
            </footer>
    </body>
</html>
