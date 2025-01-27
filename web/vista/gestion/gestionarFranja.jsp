<%-- 
    Document   : gestionarFranja
    Created on : 18-oct-2019, 12:43:11
    Author     : daw207
--%>

<%@page import="BBDD.ConexionEstatica"%>
<%@page import="java.util.LinkedList"%>
<%@page import="clase.FranjaHoraria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta http-equiv="refresh" content="60;url=../../index.jsp">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_menus.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../../css/gestion/css_gestionarFranja.css" media="screen" />
        
    </head>
    <body>
         <form action="../../controlador/controladorGeneral.jsp" method="POST">
            <%
                int n =(Integer) session.getAttribute("rol");
                if(n == 3) {
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
                        <li><a href="#">Administrador General</a><span class="flecha"></span>
                            <ul>
                                <li><a href="gestionarAula.jsp">Gestionar Aula</a></li>
                                <li><a href="gestionarFranja.jsp">Gestionar Franja</a></li>
                                <li><a href="gestionarUsuario.jsp">Gestion Usuario</a></li>
                                <li><a href="gestionarRol.jsp">Gestion Rol</a></li>
                            </ul>
                        </li>
                        <li><input type="submit" id="bitacora" name="bitacora"  value="VerBitacora"></li>
                        <li><a href="#">Profesor</a><span class="flecha"></span>
                            <ul>
                                <li><a href="prof.jsp">Reservar Aula</a></li>
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
                                <li><a href="../usuario/editarFoto.jsp">Editar Foto</a></li>
                                <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Administrador Aula</a><span class="flecha"></span>
                            <ul>
                                <li><a href="gestionarAula.jsp">Gestionar Aula</a></li>
                                <li><a href="gestionarFranja.jsp">Gestionar Franja</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Profesor</a><span class="flecha"></span>
                            <ul>
                                <li><a href="prof.jsp">Reservar Aula</a></li>
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
                                <li><a href="../usuario/editarFoto.jsp">Editar Foto</a></li>
                                <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Profesor</a><span class="flecha"></span>
                            <ul>
                                <li><a href="prof.jsp">Reservar Aula</a></li>
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
            <div class="n">
        <table id="gestionarFranja" >
            <caption>LISTA FRANJAS</caption>
            <thead>
                <tr>
                    <th>NUMERO</th>
                    <th>EMPIEZA</th>
                    <th>TERMINA</th>
                </tr>
            </thead>
            <tbody>
            <%
                ConexionEstatica.nueva();
                LinkedList <FranjaHoraria> v = ConexionEstatica.obtenerFranjaDeterminada();
                ConexionEstatica.cerrarBD();
                for (int i = 0; i < v.size(); i++) {
            %>
                <form  id="tablaGestionarFranja" action="../../controlador/controladorGestion.jsp" method="POST">
                    <tr>
                        <td>
                           <input type="text" name="nFranja" value="<%=v.get(i).getFranja()%>">
                        </td>   
                        <td>
                           <input type="text" class="h" name="iniHora" value="<%=v.get(i).getInicioHora()%>">
                        </td>
                        <td>
                            <input type="text" class="h" name="finHora" value="<%=v.get(i).getFinHora()%>">
                        </td>
                        <td>
                            <button type="submit" id="editar" name="botFranja" value="Editar">
                            <input type="hidden" id="clave" name="clave" value="<%=v.get(i).getClave()%>" >
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
                <div>Icons made by <a href="https://www.flaticon.es/autores/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.es/"             title="Flaticon">www.flaticon.com</a></div>
            </footer>
    </body>
</html>
