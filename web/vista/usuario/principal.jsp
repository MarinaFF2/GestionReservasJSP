<%-- 
    Document   : principal
    Created on : 25-oct-2019, 13:31:52
    Author     : daw207
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_menus.css" media="screen" />
    </head>
    <body>
        <%
            int n = (Integer)session.getAttribute("rol");
            if(n==3){
        %>
        <form  name="tablaGestionarFranja" action="../../controlador/controladorGeneral.jsp" method="POST">
            <header>
                <nav id="menuLoginAdminGene">
                    <ul>
                        <li>Administrador General
                            <ul>
                                <li><a href="../gestion/gestionarAula.jsp">Gestionar Aula</a></li>
                                <li><a href="../gestion/gestionarFranja.jsp">Gestionar Franja</a></li>
                                <li><a href="../gestion/gestionarRol.jsp">Gestion Rol</a></li>
                                <li><a href="../gestion/gestionarUsuario.jsp">Gestion Usuario</a></li>
                            </ul>
                        </li>
                        <li>Profesor
                            <ul>
                                <li><a href="../gestion/prof.jsp">Reservar Aula</a></li>
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
                        <li><p>Administrador Aula</p>
                            <ul>
                                <li><a href="../gestion/gestionarAula.jsp">Gestionar Aula</a></li>
                                <li><a href="../gestion/gestionarFranja.jsp">Gestionar Franja</a></li>
                            </ul>
                        </li>
                        <li><p>Profesor</p>
                            <ul>
                                <li><a href="../gestion/prof.jsp">Reservar Aula</a></li>
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
                        <li><p>Profesor</p>
                            <ul>
                                <li><a href="../gestion/prof.jsp">Reservar Aula</a></li>
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
        
        
        
        <div>
            <h1> ¡Bienvenido!</h1>
        </div>
    </body>
</html>
