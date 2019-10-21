<%-- 
    Document   : gestionarUsuario
    Created on : 18-oct-2019, 12:43:56
    Author     : daw207
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="clase.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            LinkedList <Usuario> v = (LinkedList <Usuario>) session.getAttribute("lU");
        %>
        <form  name="tablaGestionarUsuario" action="../controlador/conector.jsp" method="POST">
            <table name="gestionarUsuario" >
                <caption>LISTA USUARIOS</caption>
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
                    <tr>
                        <td>
                            <input type="text" name="codAula" value="<%out.print(v.get(i).getCorreo());%>"  readonly="true">
                        </td> 
                        <td>
                            <input type="text" name="nombre" value="<%out.print(v.get(i).getNombre());%>">
                        </td>   
                        <td>
                            <input type="text" name="apellido" value="<%out.print(v.get(i).getApellido());%>">
                        </td>
                        <td>
                            <input type="number" name="edad" value="<%out.print(v.get(i).getEdad());%>">
                        </td>
                        <td>
                            <input type="submit" name="botUsuario" value="X">
                        </td>
                        <td>
                            <input type="submit" name="botUsuario" value="Editar">
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
