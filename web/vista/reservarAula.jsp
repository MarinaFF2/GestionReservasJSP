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
    </head>
    <body>
        <%
            LinkedList <FranjaHoraria> v = (LinkedList <FranjaHoraria>) session.getAttribute("lF");
        %>
        <form  name="tablaReservarAulas" action="../controlador/controlador.jsp" method="POST">
            <p>Fecha: <%out.print((String)session.getAttribute("fecD"));%></p>
            <p>Aula: <%out.print((Integer)session.getAttribute("Aula"));%></p>
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
            for (int i = 0; i < v.size(); i++) {
        %>
                <form  name="tablaReservarAulas1" action="../controlador/controlador.jsp" method="POST">
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
            <input type="submit" name="cerrarSesion" value="CerrarSesion">
            <input type="submit" name="volverAProf" value="Volver">
        </form>
    </body>
</html>
