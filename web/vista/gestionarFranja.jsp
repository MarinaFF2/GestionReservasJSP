<%-- 
    Document   : gestionarFranja
    Created on : 18-oct-2019, 12:43:11
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
            LinkedList <FranjaHoraria> v = (LinkedList <FranjaHoraria>) session.getAttribute("lFt");
        %>
        <form  name="tablaGestionarFranja" action="../controlador/conector.jsp" method="POST">
            <table name="gestionarFranja" >
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
            for (int i = 0; i < v.size(); i++) {
        %>
                <!--hacer invisible--><input type="text" name="clave" value="<%out.print(v.get(i).getClave());%>" >
                    <tr>
                        <td>
                           <input type="text" name="nFranja" value="<%out.print(v.get(i).getFranja());%>">
                        </td>   
                        <td>
                           <input type="text" name="iniHora" value="<%out.print(v.get(i).getInicioHora());%>">
                        </td>
                        <td>
                            <input type="text" name="finHora" value="<%out.print(v.get(i).getFinHora());%>">
                        </td>
                        <td>
                            <input type="submit" name="botFranja" value="Editar">
                        </td>
                    </tr>
        <%
            }
        %>
                </tbody>
            </table>
            <input type="submit" name="cerrarSesion" value="CerrarSesion">
            <input type="submit" name="volverAProf" value="volver">
        </form>
    </body>
</html>
