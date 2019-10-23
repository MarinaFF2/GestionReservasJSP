<%-- 
    Document   : gestionarAula
    Created on : 18-oct-2019, 12:42:31
    Author     : daw207
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="clase.Aula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            #clave{
                visibility: hidden;
                width: 0px;
                margin: 0px;
                padding: 0px;
            }
        </style>
    </head>
    <body>
        <%
            LinkedList <Aula> v = (LinkedList <Aula>) session.getAttribute("lA");
        %>
        <form  name="tablaGestionarAula" action="../controlador/controlador.jsp" method="POST">
            <table name="gestionarAula" >
                <caption>LISTA AULAS</caption>
                <thead>
                    <tr>
                        <th>NOMBRE</th>
                        <th>DESCRIPCION</th>
                    </tr>
                </thead>
                <tbody>
        <%
            for (int i = 0; i < v.size(); i++) {
        %>
            <!--hacer invisible--><input type="text" id="clave" name="aula" value="<%out.print(v.get(i).getCodAula());%>">
                    <tr>
                        <td>
                            <input type="text" name="codAula" value="<%out.print(v.get(i).getCodAula());%>">
                        </td>   
                        <td>
                            <input type="text" name="descripcionAula" value="<%out.print(v.get(i).getDescripcion());%>">
                        </td>    
                        <td>
                            <input type="submit" name="botAula" value="X">
                        </td>
                        <td>
                            <input type="submit" name="botAula" value="Editar">
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
