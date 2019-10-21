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
            ConexionEstatica.Insertar_Dato_Usuario("usuario", correo, codClave, nombre, apellido,"", edad);
            ConexionEstatica.Insertar_Dato_AsignarRol("asignarRol", correo, 1);
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
        LinkedList lFt = ConexionEstatica.obtenerFranjaDeterminada();
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
        LinkedList lF = ConexionEstatica.obtenerFranjaAulaDeterminada(f, n);
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
            String u = request.getParameter("correo");
            String nom = request.getParameter("nombre");
            String ape = request.getParameter("apellido");
            int edad = Integer.parseInt(request.getParameter("edad"));
            ConexionEstatica.Modificar_Dato_Nombre_Apellido_Edad("usuario", u, nom, ape, edad);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestionarUsuario.jsp");
        }
    }
    //boton de gestion franja
    if(request.getParameter("botFranja")!=null){
        ConexionEstatica.nueva();
        if(request.getParameter("botFranja").equals("Editar")){
            int u = Integer.parseInt(request.getParameter("clave"));
            int nF = Integer.parseInt(request.getParameter("nFranja"));
            String ini = request.getParameter("iniHora");
            String fin = request.getParameter("finHora");
            ConexionEstatica.Modificar_Dato_Franja_IniHora_FinHora("franja", u, nF, ini, fin);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestionarFranja.jsp");
        }
    }
    //boton de gestion aula
    if(request.getParameter("botAula")!=null){
        ConexionEstatica.nueva();
        if(request.getParameter("botAula").equals("Editar")){
            int u = Integer.parseInt(request.getParameter("aula"));
            int aula = Integer.parseInt(request.getParameter("codAula"));
            String des = request.getParameter("descripcionAula");
            ConexionEstatica.Modificar_Dato_CodAula_DescripcionAula("aula",u,aula,des);
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
