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
        <form  name="tablaGestionarFranja" action="../../controlador/controladorGeneral.jsp" method="POST">
        <%
            int n = (Integer)session.getAttribute("rol");
            if(n==3){
        %>
            <header>
                <a href="#" id="menu_on">
                    <span></span>
                    <span></span>
                    <span></span>
                </a>
                <nav id="menuLoginAdminGene">
                    <ul>
                        <li><a href="#">Administrador General</a><span class="flecha"></span>
                            <ul>
                                <li><a href="../gestion/gestionarAula.jsp">Gestionar Aula</a></li>
                                <li><a href="../gestion/gestionarFranja.jsp">Gestionar Franja</a></li>
                                <li><a href="../gestion/gestionarUsuario.jsp">Gestion Usuario</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Ver Bitacora</a></li>
                        <li><a href="#">Profesor</a>
                            <ul>
                                <li><a href="../gestion/prof.jsp">Reservar Aula</a><span class="flecha"></span></li>
                            </ul>
                        </li>
                        <li>
                            <button type="submit" id="editarUsuario" name="editarUsuario"  value="EditarUsuario"></button>
                        </li>
                        <li>
                            <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                        </li>
                    </ul>
                </nav>
            </header>
        <%  
            }else if(n==2){
        %>
            <header>
                <a href="#" id="menu_on">
                    <span></span>
                    <span></span>
                    <span></span>
                </a>
                <nav id="menuLoginAdminAula">
                    <ul>
                        <li><a href="#">Administrador Aula</a><span class="flecha"></span>
                            <ul>
                                <li><a href="../gestion/gestionarAula.jsp">Gestionar Aula</a></li>
                                <li><a href="../gestion/gestionarFranja.jsp">Gestionar Franja</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Profesor</a><span class="flecha"></span>
                            <ul>
                                <li><a href="../gestion/prof.jsp">Reservar Aula</a></li>
                            </ul>
                        </li>
                        <li>
                            <button type="submit" id="editarUsuario" name="editarUsuario"  value="EditarUsuario"></button>
                        </li>
                        <li>
                            <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                        </li>
                    </ul>
                </nav>
            </header>
        <% 
            }else{
        %>  
            <header>
                <a href="#" id="menu_on">
                    <span></span>
                    <span></span>
                    <span></span>
                </a>
                <nav id="prof">
                    <ul>
                        <li><a href="#">Profesor</a><span class="flecha"></span>
                            <ul>
                                <li><a href="../gestion/prof.jsp">Reservar Aula</a></li>
                            </ul>
                        </li>
                        <li>
                            <button type="submit" id="editarUsuario" name="editarUsuario"  value="EditarUsuario"></button>
                        </li>
                        <li>
                            <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
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
    <footer>
        <div>Icons made by <a href="https://www.flaticon.es/autores/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.es/"             title="Flaticon">www.flaticon.com</a></div>
        <div>Icons made by <a href="https://www.flaticon.es/autores/pixel-perfect" title="Pixel perfect">Pixel perfect</a> from <a href="https://www.flaticon.es/"             title="Flaticon">www.flaticon.com</a></div>
    </footer>
</html>
