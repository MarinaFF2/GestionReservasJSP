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
        <meta http-equiv="refresh" content="60;url=../../index.jsp">
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_menus.css" media="screen" />
        <script src="../../jquery-3.4.1.min.js"></script>
        <script src="../../js/menu.js"></script>
    </head>
    <body>
        <div id="wrapper">
<<<<<<< HEAD
            <form  action="../../controlador/controladorGeneral.jsp" method="POST">
                <%
                    int n = (Integer) session.getAttribute("rol");
                    if (n == 3) {
                %>
                <nav>
=======
            <form  name="tablaGestionarFranja" action="../../controlador/controladorGeneral.jsp" method="POST">
            <%
                int n = (Integer)session.getAttribute("rol");
                if(n==3){
            %>
                <header id="#header">
                    <a href="#" id="menu_on">
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                    <nav id="menuLoginAdminGene" class="horizontal">
                        <ul>
                            <li><a href="#">Administrador General</a><span class="flecha"></span>
                                <ul>
                                    <li><a href="../gestion/gestionarAula.jsp">Gestionar Aula</a></li>
                                    <li><a href="../gestion/gestionarFranja.jsp">Gestionar Franja</a></li>
                                    <li><a href="../gestion/gestionarUsuario.jsp">Gestion Usuario</a></li>
                                    <li><a href="../gestion/gestionarRol.jsp">Gestion Rol</a></li>
                                </ul>
                            </li>
                            <li><input type="submit" id="bitacora" name="bitacora"  value="VerBitacora"></li>
                            <li><a href="#">Profesor</a><span class="flecha"></span>
                                <ul>
                                    <li><a href="../gestion/prof.jsp">Reservar Aula</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" id="editarUsuario"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
                                <ul>
                                    <li><a href="editarFoto.jsp">Editar Foto</a></li>
                                    <li><a href="editarUsuario.jsp">Editar Usuario</a></li>
                                </ul>
                            </li>
                            <li>
                                <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                            </li>
                        </ul>
                    </nav>
                </header>
                <nav id="menuLoginAdminGene" class="vertical">
>>>>>>> origin/master
                    <ul>
                        <li>
                            <a href="#" id="editarUsuario"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
                            <ul>
                                <li><a href="editarFoto.jsp">Editar Foto</a></li>
                                <li><a href="editarUsuario.jsp">Editar Usuario</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Administrador General</a><span class="flecha"></span>
                            <ul>
                                <li><a href="../gestion/gestionarAula.jsp">Gestionar Aula</a></li>
                                <li><a href="../gestion/gestionarFranja.jsp">Gestionar Franja</a></li>
                                <li><a href="../gestion/gestionarUsuario.jsp">Gestion Usuario</a></li>
                                <li><a href="../gestion/gestionarRol.jsp">Gestion Rol</a></li>
                            </ul>
                        </li>
                        <li><input type="submit" id="bitacora" name="bitacora"  value="VerBitacora"></li>
                        <li><a href="#">Profesor</a><span class="flecha"></span>
                            <ul>
                                <li><a href="../gestion/prof.jsp">Reservar Aula</a></li>
                            </ul>
                        </li>

                        <li>
                            <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                        </li>
                    </ul>
                </nav>
<<<<<<< HEAD
                <%
                } else if (n == 2) {
                %>
                <nav>
=======
        <%  
            }else if(n==2){
        %>
                <header id="#header">
                    <a href="#" id="menu_on">
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                    <nav id="menuLoginAdminAula" class="horizontal">
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
                                <a href="#" id="editarUsuario"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
                                <ul>
                                    <li><a href="editarFoto.jsp">Editar Foto</a></li>
                                    <li><a href="editarUsuario.jsp">Editar Usuario</a></li>
                                </ul>
                            </li>
                            <li>
                                <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                            </li>
                        </ul>
                    </nav>
                </header>
                <nav id="menuLoginAdminAula" class="vertical" class="visible_menu">
>>>>>>> origin/master
                    <ul>
                        <li>
                            <a href="#"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
                            <ul>
                                <li><a href="editarFoto.jsp">Editar Foto</a></li>
                                <li><a href="editarUsuario.jsp">Editar Usuario</a></li>
                            </ul>
                        </li>
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
                            <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                        </li>
                    </ul>
                </nav>
                <%
                } else {
                %>  
                <nav>
                    <ul>
                        <li>
                            <a href="#" id="editarUsuario"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
                            <ul>
                                <li><a href="editarFoto.jsp">Editar Foto</a></li>
                                <li><a href="editarUsuario.jsp">Editar Usuario</a></li>
                            </ul>
                        </li>
<<<<<<< HEAD
=======
                        <li>
                            <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                        </li>
                    </ul>
                </nav>
        <% 
            }else{
        %>  
                <header id="#header">
                    <a href="#" id="menu_on">
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                    <nav id="prof" class="horizontal" class="visible_menu">
                        <ul>
                            <li><a href="#">Profesor</a><span class="flecha"></span>
                                <ul>
                                    <li><a href="../gestion/prof.jsp">Reservar Aula</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" id="editarUsuario"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
                                <ul>
                                    <li><a href="editarFoto.jsp">Editar Foto</a></li>
                                    <li><a href="editarUsuario.jsp">Editar Usuario</a></li>
                                </ul>
                            </li>
                            <li>
                                <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                            </li>
                        </ul>
                    </nav>
                </header>
                <nav id="prof" class="vertical" class="visible_menu">
                    <ul>
>>>>>>> origin/master
                        <li><a href="#">Profesor</a><span class="flecha"></span>
                            <ul>
                                <li><a href="../gestion/prof.jsp">Reservar Aula</a></li>
                            </ul>
                        </li>
                        <li>
                            <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                        </li>
                    </ul>
                </nav>
<<<<<<< HEAD
                <%
                    }
                %>
            </form>
=======
        <% 
            }
        %>
        </form>
>>>>>>> origin/master
            <section id="content">
                <h1> ¡Bienvenido!</h1>
            </section>
            <footer>
                <div>Icons made by <a href="https://www.flaticon.es/autores/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.es/"             title="Flaticon">www.flaticon.com</a></div>
                <div>Icons made by <a href="https://www.flaticon.es/autores/pixel-perfect" title="Pixel perfect">Pixel perfect</a> from <a href="https://www.flaticon.es/"             title="Flaticon">www.flaticon.com</a></div>
            </footer>
        </div>
    </body>
</html>
