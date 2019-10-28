<%-- 
    Document   : gestionarFranja
    Created on : 18-oct-2019, 12:43:11
    Author     : daw207
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
        <link rel="stylesheet" type="text/css" href="../../css/css_gestionarFranja.css" media="screen" />
        
    </head>
    <body>
        <form  name="tablaGestionarFranja" action="../controlador/controladorGeneral.jsp" method="POST">
        <%
            ConexionEstatica.nueva();
            LinkedList <FranjaHoraria> v = ConexionEstatica.obtenerFranjaDeterminada();
            ConexionEstatica.cerrarBD();
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
                <form  name="tablaGestionarFranja" action="../../controlador/controladorGestion.jsp" method="POST">
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
                            <input type="hidden" id="clave" name="clave" value="<%out.print(v.get(i).getClave());%>" >
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
