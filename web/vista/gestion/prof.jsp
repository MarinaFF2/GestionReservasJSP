<%-- 
    Document   : prof
    Created on : 15-oct-2019, 22:51:10
    Author     : Marina Flores Fernandez
--%>

<%@page import="clase.Aula"%>
<%@page import="BBDD.ConexionEstatica"%>
<%@page import="java.util.LinkedList"%>
<%@page import="clase.FranjaHoraria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta http-equiv="refresh" content="60;url=../../index.jsp">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_menus.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_prof.css" media="screen" />
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
        
        <form id="menuProf" action="../../controlador/controladorGestion.jsp" method="POST">
            <p>Elige la fecha</p><input type="date" id="fechaDia" name="fechaDia" value=""><br>
            <p>Elige el aula</p><select id="eligeAula" name="eligeAula">
                <option value="" selected> </option>
                <%
                ConexionEstatica.nueva();
                LinkedList <Aula> v = ConexionEstatica.obtenerAulas();
                ConexionEstatica.cerrarBD();
                for (Aula paux : v) {
            %>
                    <option value="<%=paux.getCodAula()%>"><%=paux.getCodAula()%></option>
            <%
                }
            %>
            </select><br>
            <input type="submit" id="verReservaAula" name="verReservaAula" value="verCuadrante"><br>
        </form>
    </body>
</html>
