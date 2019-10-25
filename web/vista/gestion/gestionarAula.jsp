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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_menus.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../../css/css_gestionarAula.css" media="screen" />
        
    </head>
    <body>
        
        <%
            LinkedList <Aula> v = (LinkedList <Aula>) session.getAttribute("lA");
            int n = (Integer)session.getAttribute("rol");
            if(n==3){
        %>
        <form  name="tablaGestionarAula" action="../controlador/controladorGestion.jsp" method="POST">
        <header>
            <nav id="menuLoginAdminGene">
                <ul>
                    <li><a href="../menu/menuAdminAula.jsp">Administrador General</a></li>
                    <li><a href="../menu/prof.jsp">Profesor</a></li>
                    <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
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
                        <li><a href="../menu/menuAdminGene.jsp">Administrador Aula</a></li>
                        <li><a href="../menu/prof.jsp">Profesor</a></li>
                        <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
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
                        <li><a href="../menu/prof.jsp">Profesor</a></li>
                        <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
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
                <form  name="tablaGestionarAula" action="../../controlador/controladorGestion.jsp" method="POST">
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
                            <input type="hidden" id="clave" name="aula" value="<%out.print(v.get(i).getCodAula());%>">
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
