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
            <nav id="menuLoginAdminGene">
                <ul>
                    <li><a href="../menu/menuAdminGene.jsp">Administrador General</a></li>
                    <li><a href="../menu/prof.jsp">Profesor</a></li>
                    <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
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
                    <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
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
                    <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
                    <li>
                        <input type="submit" id="cerrarSesion" name="cerrarSesion" value="CerrarSesion">
                    </li>
                </ul>
            </nav>
        <% 
            }
        %>
        </form>
        <p>Fecha: <input type="text" id="fecha" name="fecha" value="<%out.print((String)session.getAttribute("fecD"));%>" readonly="true">
            <p>Aula: <input type="text" id="aula" name="fecha" value="<%out.print((Integer)session.getAttribute("Aula"));%>" readonly="true">
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
                            <input type="text" id="iniHora" name="iniHora" value="<%out.print(v.get(i).getInicioHora());%>" readonly="true">
                        </td>   
                        <td>
                            <input type="text" id="finHora" name="finHora" value="<%out.print(v.get(i).getFinHora());%>" readonly="true">
                        </td> 
                        <td>
                            <input type="submit" id="reservadoAula" name="reservadoAula" value="<%out.print(v.get(i).getReservado());%>">
                           <input type="hidden" id="clave" name="clave" value="<%out.print(v.get(i).getClave());%>">
                            <input type="hidden" id="usuReservar" name="usuReservar" value="<%out.print(v.get(i).getCodProfesor());%>">
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
