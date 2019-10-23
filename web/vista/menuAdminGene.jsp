<%-- 
    Document   : menuAdminGene
    Created on : 17-oct-2019, 9:06:21
    Author     : daw207
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form id="menuAdminGene" action="../controlador/controlador.jsp" method="POST">
        <%
            int n = (Integer)session.getAttribute("rol");
            if(n==3){
        %>
            <nav id="menuLoginAdminGene">
                <ul>
                    <li><a href="menuAdminGene.jsp">Administrador General</a></li>
                    <li><a href=prof.jsp">Profesor</a></li>
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
                    <li><a href="menuAdminAula.jsp">Administrador Aula</a></li>
                    <li><a href=prof.jsp">Profesor</a></li>
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
                    <li><a href=prof.jsp">Profesor</a></li>
                    <li>
                        <input type="submit" id="cerrarSesion" name="cerrarSesion" value="CerrarSesion">
                    </li>
                </ul>
            </nav>
        <% 
            }
        %>
            <input type="submit" id="gestionarAula" name="gestionarAula" value="Gestionar Aula"><br>
            <input type="submit" id="gestionarFranja" name="gestionarFranja" value="Gestionar Franja Horaria"><br>
            <input type="submit" id="gestionarUsuario" name="gestionarUsuario" value="Gestionar Usuarios"><br>
            <input type="submit" id="volverALoginGene" name="volverALoginGene" value="Volver"><br>
        </form>
    </body>
</html>
