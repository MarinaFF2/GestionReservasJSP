<%-- 
    Document   : prof
    Created on : 15-oct-2019, 22:51:10
    Author     : Marina Flores Fernandez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_menus.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_prof.css" media="screen" />
        
    </head>
    <body>
        <form id="menuProf" action="../../controlador/controladorGeneral.jsp" method="POST">
        <%
            int n = (Integer)session.getAttribute("rol");
            if(n==3){
        %>
            <nav id="menuLoginAdminGene">
                <ul>
                    <li><a href="menuAdminGene.jsp">Administrador General</a></li>
                    <li><a href="prof.jsp">Profesor</a></li>
                    <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
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
                    <li><a href="prof.jsp">Profesor</a></li>
                    <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
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
                    <li><a href="prof.jsp">Profesor</a></li>
                    <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
                    <li>
                        <input type="submit" id="cerrarSesion" name="cerrarSesion" value="CerrarSesion">
                    </li>
                </ul>
            </nav>
        <% 
            }
        %>
            <label>Elige la fecha</label><input type="date" id="fechaDia" name="fechaDia" value=""><br>
            <label>Elige el aula</label><select id="eligeAula" name="eligeAula">
                <option value="" selected> </option>
                <option value="101">101</option>
                <option value="102">102</option>
                <option value="103">103</option>
                <option value="201">201</option>
                <option value="202">202</option>
                <option value="203">203</option>
                <option value="301">301</option>
                <option value="302">302</option>
                <option value="303">303</option>
            </select><br>
            <!--<div id="destino">
                
            </div>-->
            <input type="submit" id="verReservaAula" name="verReservaAula" value="verCuadrante"><br>
        </form>
    </body>
</html>
