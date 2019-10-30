<%-- 
    Document   : controlador
    Created on : 15-oct-2019, 18:24:39
    Author     : Marina Flores Fernandez
--%>

<%@page import="java.util.Locale"%>
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
    
    //index, inciar sesion en la web
    if (request.getParameter("aceptarIndex") != null) {
        String usu = request.getParameter("usuario");
        String clave = request.getParameter("pwd");
        String codClave = Codificar.codifica(clave);
        ConexionEstatica.nueva();
        Usuario u = ConexionEstatica.existeUsuario(usu, codClave);
        if (u != null) {
            session.setAttribute("usu", usu);
            SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
            Date d = new Date();
            String f = s.format(d);
            int rol = ConexionEstatica.Conseguir_Rol(u.getCorreo());
            BitacorasFichero.escribirBitacorasCuerpo("Inicia sesion en el sistema",f,u.getCorreo(),rol);
            int n = (ConexionEstatica.Conseguir_Rol(u.getCorreo()));
            session.setAttribute("rol", n);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/usuario/principal.jsp");
        } else {
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../index.jsp");
        }
    }
    //ver editar usuario
    if (request.getParameter("editarUsuario") != null) {
        response.sendRedirect("../vista/usuario/editarUsuario.jsp");
    }
    //editar usuario
    
    if (request.getParameter("cambiarContra") != null) {
        if(request.getParameter("clave").equals(request.getParameter("reclave"))){
            ConexionEstatica.nueva();
            String usu = (String) session.getAttribute("usu");
            Usuario u = ConexionEstatica.existeUsu(usu);
            String clave = request.getParameter("clave");
            String codClave = Codificar.codifica(clave);
            ConexionEstatica.Modificar_Dato_Clave(u.getCorreo(), codClave);
            u = ConexionEstatica.existeUsu(usu);
            ConexionEstatica.cerrarBD();
            session.setAttribute("usu", u);
            SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
            Date d = new Date();
            String f = s.format(d);
            int rol = ConexionEstatica.Conseguir_Rol(u.getCorreo());
            BitacorasFichero.escribirBitacorasCuerpo("Ha cambiado de contraseña",f,u.getCorreo(),rol);
            response.sendRedirect("../vista/usuario/editarUsuario.jsp");
        }
    }
    if (request.getParameter("editarUsu") != null) {
        ConexionEstatica.nueva();
        String usu = (String) session.getAttribute("usu");
        Usuario u = ConexionEstatica.existeUsu(usu);
        String correo = request.getParameter("correo");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        int edad = Integer.parseInt(request.getParameter("edad"));
        Usuario n = new Usuario(correo, nombre, apellido, edad);
        ConexionEstatica.Modificar_Dato_Usuario(u, n);
        u = ConexionEstatica.existeUsu(correo);
        ConexionEstatica.cerrarBD();
        session.setAttribute("usu", u);
        SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
        Date d = new Date();
        String f = s.format(d);
        int rol = ConexionEstatica.Conseguir_Rol(u.getCorreo());
        BitacorasFichero.escribirBitacorasCuerpo("Ha editado el usuario",f,u.getCorreo(),rol);
        response.sendRedirect("../vista/usuario/editarUsuario.jsp");
        
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

        SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
        Date d = new Date();
        String f = s.format(d);
        int rol = ConexionEstatica.Conseguir_Rol(emil);
        BitacorasFichero.escribirBitacorasCuerpo("Ha pedido recuperar la contraseña por olvido",f,emil,rol);
        ConexionEstatica.cerrarBD();
        response.sendRedirect("../index.html");
    }
    //Bitacoras
    if (request.getParameter("bitacora") != null) {
        ConexionEstatica.nueva();
        String usu = (String) session.getAttribute("usu");
        Usuario u = ConexionEstatica.existeUsu(usu);

        SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
        Date d = new Date();
        String f = s.format(d);
        int rol = ConexionEstatica.Conseguir_Rol(u.getCorreo());
        BitacorasFichero.escribirBitacorasCuerpo("Ha pedido ver bitacora",f,u.getCorreo(),rol);
        ConexionEstatica.cerrarBD();
        response.sendRedirect("../vista/gestion/Bitacora.jsp");
    }
    //cerrar sesion
    if (request.getParameter("cerrarSesion") != null) {
        String n = (String) session.getAttribute("usu");
        
        session.invalidate();
        
        SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
        Date d = new Date();
        String f = s.format(d);
        int rol = ConexionEstatica.Conseguir_Rol(n);
        BitacorasFichero.escribirBitacorasCuerpo("Ha cerrado sesion en el sistema",f,n,rol);
        ConexionEstatica.cerrarBD();
        response.sendRedirect("../index.jsp");
    }
    //botones de volver
    if (request.getParameter("volverAIndex") != null) {
        ConexionEstatica.nueva();
        String usu = (String) session.getAttribute("usu");
        Usuario u = ConexionEstatica.existeUsu(usu);

        SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
        Date d = new Date();
        String f = s.format(d);
        int rol = ConexionEstatica.Conseguir_Rol(u.getCorreo());
        BitacorasFichero.escribirBitacorasCuerpo("Se le ha redirigido al index",f,u.getCorreo(),rol);
        ConexionEstatica.cerrarBD();
    }

%>
