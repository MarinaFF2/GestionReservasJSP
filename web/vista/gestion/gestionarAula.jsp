<%-- 
    Document   : gestionarAula
    Created on : 18-oct-2019, 12:42:31
    Author     : daw207
--%>

<%@page import="BBDD.ConexionEstatica"%>
<%@page import="java.util.LinkedList"%>
<%@page import="clase.Aula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_menus.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../../css/gestion/css_gestionarAula.css" media="screen" />
        
    </head>
    <body>
        <form  name="tablaGestionarAula" action="../controlador/controladorGeneral.jsp" method="POST">
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
                                <li><a href="gestionarAula.jsp">Gestionar Aula</a></li>
                                <li><a href="gestionarFranja.jsp">Gestionar Franja</a></li>
                                <li><a href="gestionarUsuario.jsp">Gestion Usuario</a></li>
                                <li><a href="gestionarRol.jsp">Gestion Rol</a></li>
                            </ul>
                        </li>
                        <li><input type="submit" id="bitacora" name="bitacora"  value="VerBitacora"></li>
                        <li><a href="#">Profesor</a>
                            <ul>
                                <li><a href="prof.jsp">Reservar Aula</a><span class="flecha"></span></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" id="editarUsuario"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
                            <ul>
                                <li><a href="../usuario/editarFoto.jsp">Editar Foto</a></li>
                                <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
                            </ul>
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
                                <li><a href="gestionarAula.jsp">Gestionar Aula</a></li>
                                <li><a href="gestionarFranja.jsp">Gestionar Franja</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Profesor</a><span class="flecha"></span>
                            <ul>
                                <li><a href="prof.jsp">Reservar Aula</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" id="editarUsuario"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
                            <ul>
                                <li><a href="../usuario/editarFoto.jsp">Editar Foto</a></li>
                                <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
                            </ul>
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
        <table>
            <caption>LISTA AULAS</caption>
            <thead>
                <tr>
                    <th>NOMBRE</th>
                    <th>DESCRIPCION</th>
                </tr>
            </thead>
            <tbody>
            <%
                ConexionEstatica.nueva();
                LinkedList <Aula> v = ConexionEstatica.obtenerAulas();
                ConexionEstatica.cerrarBD();
                for (int i = 0; i < v.size(); i++) {
            %>
                <form action="../../controlador/controladorGestion.jsp" method="POST">
                    <tr>
                        <td>
                            <input type="text" name="codAula" value="<%=v.get(i).getCodAula()%>">
                        </td>   
                        <td>
                            <input type="text" name="descripcionAula" value="<%=v.get(i).getDescripcion()%>">
                        </td>    
                        <td>
                            <input type="submit" name="botAula" value="X">
                        </td>
                        <td>
                            <input type="submit" name="botAula" value="Editar">
                            <input type="hidden" id="clave" name="aula" value="<%=v.get(i).getCodAula()%>">
                        </td>
                    </tr>
                </form>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
    </body>
</html>
