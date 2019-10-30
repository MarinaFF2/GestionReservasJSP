<%-- 
    Document   : reservarAula
    Created on : 18-oct-2019, 13:35:48
    Author     : daw207
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="clase.FranjaHoraria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_menus.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../../css/gestion/css_reservarAula.css" media="screen" />
    </head>
    <body>
        <form  name="tablaReservarAulas" action="../../controlador/controladorGeneral.jsp" method="POST">
        <%
            int n = (Integer)session.getAttribute("rol");
            if(n==3){
        %>
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
                            <a href="#" id="editarUsuario"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
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
        <%  
            }else if(n==2){
        %>
            <header>
                <a href="#" id="menu_on">
                    <span></span>
                    <span></span>
                    <span></span>
                </a>
                <nav id="menuLoginAdminAula">
                    <ul>
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
                            <a href="#" id="editarUsuario"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
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
        <% 
            }else{
        %>  
            <header>
                <a href="#" id="menu_on">
                    <span></span>
                    <span></span>
                    <span></span>
                </a>
                <nav id="prof">
                    <ul>
                        <li><a href="#">Profesor</a><span class="flecha"></span>
                            <ul>
                                <li><a href="prof.jsp">Reservar Aula</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" id="editarUsuario"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
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
        <% 
            }
        %>
        </form>
        <p>Fecha: <input type="text" id="fecha" name="fecha" value="<%=(String)session.getAttribute("fecD")%>" readonly="true">
            <p>Aula: <input type="text" id="aula" name="fecha" value="<%=(Integer)session.getAttribute("Aula")%>" readonly="true">
            <table name="reservaAula" >
                <thead>
                    <tr>
                        <th>HORA COMIENZO</th>
                        <th>HORA FINAL</th>
                        <th>RESERVADO</th>
                    </tr>
                </thead>
                <tbody>
        <%
            LinkedList <FranjaHoraria> v = (LinkedList <FranjaHoraria>) session.getAttribute("lF");
            for (int i = 0; i < v.size(); i++) {
        %>
                    <form  name="tablaReservarAulas1" action="../../controlador/controladorGestion.jsp" method="POST">
                    <tr>
                        <td>
                            <input type="text" id="iniHora" name="iniHora" value="<%=v.get(i).getInicioHora()%>" readonly="true">
                        </td>   
                        <td>
                            <input type="text" id="finHora" name="finHora" value="<%=v.get(i).getFinHora()%>" readonly="true">
                        </td> 
                        <td>
                            <input type="submit" id="reservadoAula" name="reservadoAula" value="<%=v.get(i).getReservado()%>">
                            <input type="hidden" id="clave" name="clave" value="<%=v.get(i).getClave()%>">
                            <input type="hidden" id="usuReservar" name="usuReservar" value="<%=v.get(i).getCodProfesor()%>">
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
