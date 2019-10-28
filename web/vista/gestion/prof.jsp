<%-- 
    Document   : prof
    Created on : 15-oct-2019, 22:51:10
    Author     : Marina Flores Fernandez
--%>

<%@page import="BBDD.ConexionEstatica"%>
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
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_prof.css" media="screen" />
    </head>
    <body>
        <form  name="tablaGestionarProf" action="../../controlador/controladorGeneral.jsp" method="POST">
        <%
            int n = (Integer)session.getAttribute("rol");
            if(n==3){
        %>
        <header>
                <nav id="menuLoginAdminGene">
                    <ul>
                        <li>Administrador General
                            <ul>
                                <li><a href="gestionarAula.jsp">Gestionar Aula</a></li>
                                <li><a href="gestionarFranja.jsp">Gestionar Franja</a></li>
                                <li><a href="gestionarRol.jsp">Gestion Rol</a></li>
                                <li><a href="gestionarUsuario.jsp">Gestion Usuario</a></li>
                            </ul>
                        </li>
                        <li>Profesor
                            <ul>
                                <li><a href="prof.jsp">Reservar Aula</li>
                            </ul>
                        </li>
                        <li>
                            <input type="submit" id="editarUsuario" name="editarUsuario" value="EditarUsuario">
                        </li>
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
                        <li>Administrador Aula
                            <ul>
                                <li><a href="gestionarAula.jsp">Gestionar Aula</a></li>
                                <li><a href="gestionarFranja.jsp">Gestionar Franja</a></li>
                            </ul>
                        </li>
                        <li>Profesor
                            <ul>
                                <li><a href="prof.jsp">Reservar Aula</li>
                            </ul>
                        </li>
                        <li>
                            <input type="submit" id="editarUsuario" name="editarUsuario" value="EditarUsuario">
                        </li>
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
                        <li>Profesor
                            <ul>
                                <li><a href="prof.jsp">Reservar Aula</li>
                            </ul>
                        </li>
                        <li>
                            <input type="submit" id="editarUsuario" name="editarUsuario" value="EditarUsuario">
                        </li>
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
        <form id="menuProf" action="../../controlador/controladorGestion.jsp" method="POST">
            <label>Elige la fecha</label><input type="date" id="fechaDia" name="fechaDia" value=""><br>
            <label>Elige el aula</label><select id="eligeAula" name="eligeAula">
                <option value="" selected> </option>
                <option value="101">101</option>
                <option value="102">102</option>
                <option value="103">103</option>
                <option value="201">201</option>
                <option value="202">202</option>
                <option value="203">203</option>
                <option value="301">301</option>
                <option value="302">302</option>
                <option value="303">303</option>
            </select><br>
            <input type="submit" id="verReservaAula" name="verReservaAula" value="verCuadrante"><br>
        </form>
            <!-- no aparece-->
                
        <table name="verReservasAulaUsuario">
            <thead>
                <tr>
                    <th>HORA COMIENZO</th>
                    <th>HORA FINAL</th>
                    <th>RESERVADO</th>
                </tr>
            </thead>
            <tbody>
        <%
                String usu = (String) session.getAttribute("usu");
                ConexionEstatica.nueva();
                LinkedList <FranjaHoraria> v = ConexionEstatica.obtenerAulasReservadas(usu);
                ConexionEstatica.cerrarBD();
                for (int i = 0; i < v.size(); i++) {
                session.setAttribute("usuOcupado", v.get(i).getCodProfesor());
        %>
                <form  name="tablaReservaAulas" action="../../controlador/controladorGestion.jsp" method="POST">
                    <tr>
                        <td>
                            <input type="text" id="iniHora" name="finHora" value="<%out.print(v.get(i).getInicioHora());%>" readonly="true">
                        </td>   
                        <td>
                            <input type="text" id="finHora" name="finHora" value="<%out.print(v.get(i).getFinHora());%>" readonly="true">
                        </td> 
                        <td>
                            <input type="submit" name="reservado" value="<%out.print(v.get(i).getReservado());%>">
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
