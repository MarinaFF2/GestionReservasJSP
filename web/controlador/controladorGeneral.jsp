<%-- 
    Document   : controlador
    Created on : 15-oct-2019, 18:24:39
    Author     : Marina Flores Fernandez
--%>

<%@page import="clase.InsertarFranjas"%>
<%@page import="clase.Email"%>
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
            ConexionEstatica.Insertar_Dato_Usuario(correo, codClave, nombre, apellido,"NULL", edad);
            ConexionEstatica.Insertar_Dato_AsignarRol(correo, 1);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/usuario/registrarse.jsp");
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
            session.setAttribute("rol", n);
            if(n==1){  //PROFESOR
                response.sendRedirect("../vista/menu/prof.jsp");
            }
            if(n==2){  //ADMINISTRADOR DE AULA
                response.sendRedirect("../vista/menu/menuAdminAula.jsp");
            }
            if(n==3){  //ADMINISTRADOR GENERAL
                response.sendRedirect("../vista/menu/menuAdminGene.jsp");
            }
        }else{
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../index.jsp");
        }
    }
    
    //Menus de gestionar
    if(request.getParameter("gestionarAula")!=null){
        ConexionEstatica.nueva();
        LinkedList lA = ConexionEstatica.obtenerAulas();
        session.setAttribute("lA", lA);
        ConexionEstatica.cerrarBD();
        response.sendRedirect("../vista/gestion/gestionarAula.jsp");
    }
    if(request.getParameter("gestionarFranja")!=null){
        ConexionEstatica.nueva();
        LinkedList lFt = ConexionEstatica.obtenerFranjaDeterminada();
        session.setAttribute("lFt", lFt);
        ConexionEstatica.cerrarBD();
        response.sendRedirect("../vista/gestion/gestionarFranja.jsp");
    }
    if(request.getParameter("gestionarUsuario")!=null){
        ConexionEstatica.nueva();
        LinkedList lU = ConexionEstatica.obtenerUsuarios();
        session.setAttribute("lU", lU);
        ConexionEstatica.cerrarBD();
        response.sendRedirect("../vista/gestion/gestionarUsuario.jsp");
    }
    
    
    if(request.getParameter("gestionarContrasenia")!=null){
        
    }
    if(request.getParameter("gestionarFoto")!=null){
        
    }
    
    // he olvidado la contraseña
    if (request.getParameter("botOlvidoPwd") != null) {
        String emil = (String) session.getAttribute("email");
        String clve = (String) session.getAttribute("pwd");
        ConexionEstatica.nueva();
        Usuario n = ConexionEstatica.existeUsuario(emil, clve);

        Email email = new Email();

        String de = "auxiliardaw2@gmail.com";
        String clave = "Chubaca20";
        String para = request.getParameter("email");
        String mensaje = "Cuerpo del mensaje";
        String asunto = "Contraseña olvidada";

        email.enviarCorreo(de, clave, para, mensaje, asunto);
        out.println("Correo enviado");

        BitacorasFichero.escribirBitacoras("El usuario " + n.getCorreo() + " ha dado a enviar nueva contraseña.");
        ConexionEstatica.cerrarBD();

        response.sendRedirect("../index.html");
    }
    //cerrar sesion
    if(request.getParameter("cerrarSesion")!=null){
        String n = (String) session.getAttribute("usu");
        BitacorasFichero.escribirBitacoras("El usuario " + n + " ha acerrado sesion y se le redirige al index.");
        session.invalidate();
        ConexionEstatica.cerrarBD();
        response.sendRedirect("../index.jsp");
    }
    //botones de volver
    if(request.getParameter("volverAIndex")!=null){
        response.sendRedirect("../index.jsp");
    }
%>
