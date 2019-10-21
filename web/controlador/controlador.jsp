<%-- 
    Document   : controlador
    Created on : 15-oct-2019, 18:24:39
    Author     : Marina Flores Fernandez
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.LinkedList"%>
<%@page import="BBDD.ConexionEstatica"%>
<%@page import="BBDD.BitacorasFichero"%>
<%@page import="clase.Codificar"%>
<%@page import="clase.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    //registrar usuarios
    if(request.getParameter("sendRegistrar")!=null){
        String correo = request.getParameter("correo");
        ConexionEstatica.nueva();
        Usuario u = ConexionEstatica.existeUsu(correo);
        
        if(u==null){
            String clave = request.getParameter("clave");
                String codClave = Codificar.codifica(clave);
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            int edad = Integer.parseInt(request.getParameter("edad"));
            ConexionEstatica.Insertar_Dato_Rol("usuario", correo, codClave, nombre, apellido,"", edad);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/registrarse.jsp");
        }else{
            //out.print("Error al introducir usuario");
            //pantalla emergente en registrarse
        }
        ConexionEstatica.cerrarBD();
    }
    //index, inciar sesion en la web
    if(request.getParameter("aceptarIndex")!=null){
        String usu = request.getParameter("usuario");
        String clave = request.getParameter("pwd");
        String codClave = Codificar.codifica(clave);
        ConexionEstatica.nueva();
        Usuario u = ConexionEstatica.existeUsuario(usu, codClave);
        if(u!=null){
            session.setAttribute("usu", usu);
            BitacorasFichero.escribirBitacoras("El usuario " + u.getCorreo() + " ha inicado session en el sistema");
            int n = (ConexionEstatica.Conseguir_Rol("usuario", u.getCorreo()));
            ConexionEstatica.cerrarBD();
            
            if(n==1){  //PROFESOR
                response.sendRedirect("../vista/prof.jsp");
            }
            if(n==2){  //ADMINISTRADOR DE AULA
                response.sendRedirect("../vista/loginAdminAul.jsp");
            }
            if(n==3){  //ADMINISTRADOR GENERAL
                response.sendRedirect("../vista/loginAdminGene.jsp");
            }else{
                out.print("<form id='error1' action='controlador.jsp'>");
                out.print("<p>No puedes acceder por todavia no te han admitido, debes esperar a que lo hagan</p> <br> <input type='submit' id='volverAIndex' name='volverAIndex' value='Volver al login'>");
                out.print("</form>");
            }
        }else{
            out.print("<form id='error1' action='controlador.jsp'>");
            out.print("<p>Error al escribir usuario y/o contraseña</p> <br> <input type='submit' id='volverAIndex' name='volverAIndex' value='Volver al login'>");
            out.print("</form>");
        }  
        ConexionEstatica.cerrarBD();
    }
    
    //Logins
    if(request.getParameter("entrarLoginAdminAula")!=null){
        if (request.getParameter("comoAccederLoginAula") != null) {
            if (request.getParameter("comoAccederLoginAula").equals("adminAula")) {
                response.sendRedirect("../vista/menuAdminAul.jsp");
            }
            if (request.getParameter("comoAccederLoginAula").equals("prof")) {
                response.sendRedirect("../vista/prof.jsp");
            }
        }
    }
    if(request.getParameter("entrarLoginAdminGene")!=null){
        if (request.getParameter("comoAccederLoginGene") != null) {
            if (request.getParameter("comoAccederLoginGene").equals("adminGene")) {
                response.sendRedirect("../vista/menuAdminGene.jsp");
            }
            if (request.getParameter("comoAccederLoginGene").equals("prof")) {
                response.sendRedirect("../vista/prof.jsp");
            }
        }
    }
    
    //Menus de gestionar
    if(request.getParameter("gestionarAula")!=null){
        ConexionEstatica.nueva();
        LinkedList lA = ConexionEstatica.obtenerAulas();
        session.setAttribute("lA", lA);
        ConexionEstatica.cerrarBD();
        response.sendRedirect("../vista/gestionarAula.jsp");
    }
    if(request.getParameter("gestionarFranja")!=null){
        ConexionEstatica.nueva();
        LinkedList lFt = ConexionEstatica.obtenerFranjasHorariasTodas();
        session.setAttribute("lFt", lFt);
        ConexionEstatica.cerrarBD();
        response.sendRedirect("../vista/gestionarFranja.jsp");
    }
    if(request.getParameter("gestionarUsuario")!=null){
        ConexionEstatica.nueva();
        LinkedList lU = ConexionEstatica.obtenerUsuarios();
        session.setAttribute("lU", lU);
        ConexionEstatica.cerrarBD();
        response.sendRedirect("../vista/gestionarUsuario.jsp");
    }
    //reservar Aula
    if((request.getParameter("verReservaAula")!=null)){
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
        Date parsed = format.parse(request.getParameter("fechaDia"));
        java.sql.Date f = new java.sql.Date(parsed.getTime());
        int n = Integer.parseInt(request.getParameter("eligeAula"));
        ConexionEstatica.nueva();
        LinkedList lF = ConexionEstatica.obtenerFranjaHorariaDeterminada(f, n);
        session.setAttribute("lF", lF);
        ConexionEstatica.cerrarBD();
        response.sendRedirect("../vista/reservarAula.jsp");
    }
    //boton de gestion usuario
    if(request.getParameter("botUsuario")!=null){
        ConexionEstatica.nueva();
        if(request.getParameter("botUsuario").equals("X")){
            int u = Integer.parseInt(request.getParameter("aula"));
            ConexionEstatica.Borrar_Dato_Aula("franja", u);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestionarUsuario.jsp");
        }
        if(request.getParameter("botUsuario").equals("Editar")){
            if(request.getParameter("nombre")!=null){
                String u = request.getParameter("correo");
                String n = request.getParameter("nombre");
                ConexionEstatica.Modificar_Dato_Nombre("usuario", u, n);
            }
            if(request.getParameter("apellido")!=null){
                String u = request.getParameter("correo");
                String n = request.getParameter("apellido");
                ConexionEstatica.Modificar_Dato_Apellido("usuario", u, n);
            }
            if(request.getParameter("edad")!=null){
                String u = request.getParameter("correo");
                int n = Integer.parseInt(request.getParameter("edad"));
                ConexionEstatica.Modificar_Dato_Edad("usuario", u, n);
            }
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestionarUsuario.jsp");
        }
    }
    //boton de gestion franja
    if(request.getParameter("botFranja")!=null){
        ConexionEstatica.nueva();
        if(request.getParameter("botFranja").equals("Editar")){
            if(request.getParameter("nFranja")!=null){
                int u = Integer.parseInt(request.getParameter("clave"));
                int n = Integer.parseInt(request.getParameter("nFranja"));
                ConexionEstatica.Modificar_Dato_Franja("franja", u, n);
            }
            if(request.getParameter("iniHora")!=null){
                int u = Integer.parseInt(request.getParameter("clave"));
                String n = request.getParameter("iniHora");
                ConexionEstatica.Modificar_Dato_InicioHora("franja", u, n);
            }
            if(request.getParameter("finHora")!=null){
                int u = Integer.parseInt(request.getParameter("clave"));
                String n = request.getParameter("finHora");
                ConexionEstatica.Modificar_Dato_FinHora("franja", u, n);
            }
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestionarFranja.jsp");
        }
    }
    //boton de gestion aula
    if(request.getParameter("botAula")!=null){
        ConexionEstatica.nueva();
        if(request.getParameter("botAula").equals("Editar")){
            if(request.getParameter("codAula")!=null){
                int u = Integer.parseInt(request.getParameter("aula"));
                int n = Integer.parseInt(request.getParameter("codAula"));
                ConexionEstatica.Modificar_Dato_Franja("aula", u, n);
            }
            if(request.getParameter("descripcionAula")!=null){
                int u = Integer.parseInt(request.getParameter("aula"));
                String n = request.getParameter("descripcionAula");
                ConexionEstatica.Modificar_Dato_InicioHora("aula", u, n);
            }
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestionarAula.jsp");
        }
        if(request.getParameter("botAula").equals("X")){
            int u = Integer.parseInt(request.getParameter("aula"));
            ConexionEstatica.Borrar_Dato_Aula("aula", u);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestionarAula.jsp");
        }
    }
    //cerrar sesion
    if(request.getParameter("cerrarSesion")!=null){
        String n = (String) session.getAttribute("usu");
        BitacorasFichero.escribirBitacoras("El usuario " + n + " ha acerrado sesion y se le redirige al index.");
        session.invalidate();
        ConexionEstatica.cerrarBD();
        response.sendRedirect("../index.html");
    }
    //botones de volver
    if(request.getParameter("volverAIndex")!=null){
        response.sendRedirect("../index.html");
    }
    if(request.getParameter("volverALoginGene")!=null){
        response.sendRedirect("../vista/loginAdminGene.jsp");
    }
    if(request.getParameter("volverALoginAula")!=null){
        response.sendRedirect("../vista/loginAdminAula.jsp");
    }
    if(request.getParameter("volverAProf")!=null){
        response.sendRedirect("../vista/prof.jsp");
    }
%>
