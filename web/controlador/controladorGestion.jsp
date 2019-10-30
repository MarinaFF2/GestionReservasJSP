<%-- 
    Document   : controladorGestion
    Created on : 24-oct-2019, 9:58:37
    Author     : daw207
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="clase.Usuario"%>
<%@page import="BBDD.BitacorasFichero"%>
<%@page import="java.util.LinkedList"%>
<%@page import="BBDD.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //para ver reservar Aula en prof.jsp
    if((request.getParameter("verReservaAula")!=null)){
        String f = request.getParameter("fechaDia");
        session.setAttribute("fecD", f);
        int n = Integer.parseInt(request.getParameter("eligeAula"));
        session.setAttribute("Aula",n);
        ConexionEstatica.nueva();
        String usu = (String) session.getAttribute("usu");
        Usuario u = ConexionEstatica.existeUsu(usu);

        SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
        Date d = new Date();
        String w = s.format(d);
        int rol = ConexionEstatica.Conseguir_Rol(u.getCorreo());
        BitacorasFichero b =new BitacorasFichero("Esta viendo la reserva de las aulas",w,u.getCorreo(),rol);
        b.escribirBitacorasCuerpo();
        LinkedList lF = ConexionEstatica.obtenerFranjaAulaDeterminada(f, n);
        session.setAttribute("lF", lF);
        ConexionEstatica.cerrarBD();
        response.sendRedirect("../vista/gestion/reservarAula.jsp");
    }
    //reservar Aula
    if(request.getParameter("reservadoAula")!=null){
        String f = (String) session.getAttribute("fecD");
        int n = (Integer) session.getAttribute("Aula");
        String ini = request.getParameter("iniHora");
        String fin = request.getParameter("finHora");
        String usu = (String) session.getAttribute("usu");//usuario de la sesion
        String re = request.getParameter("reservadoAula");
        int nu = Integer.parseInt(request.getParameter("clave"));
        String usuR = request.getParameter("usuReservar");//usuario de tabla 
        if(re.equals("LIBRE")){
            ConexionEstatica.nueva();
            re="OCUPADO";
            ConexionEstatica.Modificar_Dato_Reservado_CodProfesor(usu ,re, nu, n, f);
            LinkedList lF = ConexionEstatica.obtenerFranjaAulaDeterminada(f, n);
            session.setAttribute("lF", lF);
            SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
            Date d = new Date();
            String w = s.format(d);
            int rol = ConexionEstatica.Conseguir_Rol(usu);
            BitacorasFichero b =new BitacorasFichero("Ha reservado "+nu,w,usu,rol);
            b.escribirBitacorasCuerpo();
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestion/reservarAula.jsp");
        }else if(re.equals("OCUPADO") && usuR.equals(usu)){
            ConexionEstatica.nueva();
            re = "LIBRE";
            ConexionEstatica.Modificar_Dato_Reservado_CodProfesor(null, re, nu, n, f);
            LinkedList lF = ConexionEstatica.obtenerFranjaAulaDeterminada(f, n);
            session.setAttribute("lF", lF);
            SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
            Date d = new Date();
            String w = s.format(d);
            int rol = ConexionEstatica.Conseguir_Rol(usu);
            BitacorasFichero b =new BitacorasFichero("Ha dejado libre "+nu,w,usu,rol);
            b.escribirBitacorasCuerpo();
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestion/reservarAula.jsp");
        }
    }
    //boton de gestion usuario
    if(request.getParameter("botUsuario")!=null){
        ConexionEstatica.nueva();
        if(request.getParameter("botUsuario").equals("X")){
            String usu = request.getParameter("correo");
            Usuario u = ConexionEstatica.existeUsu(usu);
            ConexionEstatica.Borrar_Dato_Usuario(usu);
            String us = (String) session.getAttribute("usu");
            Usuario n = ConexionEstatica.existeUsu(usu);
            SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
            Date d = new Date();
            String f = s.format(d);
            int rol = ConexionEstatica.Conseguir_Rol(n.getCorreo());
            BitacorasFichero b =new BitacorasFichero("Ha eliminado a "+usu,f,n.getCorreo(),rol);
            b.escribirBitacorasCuerpo();
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestion/gestionarUsuario.jsp");
        }
        if(request.getParameter("botUsuario").equals("Editar")){
            String u = request.getParameter("correo");
            String nom = request.getParameter("nombre");
            String ape = request.getParameter("apellido");
            int edad = Integer.parseInt(request.getParameter("edad"));
            ConexionEstatica.Modificar_Nombre_Apellido_Edad(u, nom, ape, edad);
            String us = (String) session.getAttribute("usu");
            Usuario n = ConexionEstatica.existeUsu(us);
            SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
            Date d = new Date();
            String f = s.format(d);
            int rol = ConexionEstatica.Conseguir_Rol(n.getCorreo());
            BitacorasFichero b =new BitacorasFichero("Ha modificado a "+u,f,n.getCorreo(),rol);
            b.escribirBitacorasCuerpo();
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestion/gestionarUsuario.jsp");
        }
    }
    //boton de gestion franja
    if(request.getParameter("botFranja")!=null){
        ConexionEstatica.nueva();
        if(request.getParameter("botFranja").equals("Editar")){
            int w = Integer.parseInt(request.getParameter("clave"));
            int nF = Integer.parseInt(request.getParameter("nFranja"));
            String ini = request.getParameter("iniHora");
            String fin = request.getParameter("finHora");
            ConexionEstatica.Modificar_Dato_Franja_IniHora_FinHora(w, nF, ini, fin);
            String usu = (String) session.getAttribute("usu");
            Usuario u = ConexionEstatica.existeUsu(usu);

            SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
            Date d = new Date();
            String f = s.format(d);
            int rol = ConexionEstatica.Conseguir_Rol(u.getCorreo());
            BitacorasFichero b =new BitacorasFichero("Ha modificado la franja "+w,f,u.getCorreo(),rol);
            b.escribirBitacorasCuerpo();
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestion/gestionarFranja.jsp");
        }
    }
    //boton de gestion rol
    if(request.getParameter("botRol")!=null){
        ConexionEstatica.nueva();
        if(request.getParameter("botRol").equals("Editar")){
            String w = request.getParameter("correo");
            int r = Integer.parseInt(request.getParameter("rol"));
            ConexionEstatica.Modificar_Dato_IdAsignarRol(w, r);
            
            String usu = (String) session.getAttribute("usu");
            Usuario u = ConexionEstatica.existeUsu(usu);

            SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
            Date d = new Date();
            String f = s.format(d);
            int rol = ConexionEstatica.Conseguir_Rol(u.getCorreo());
            BitacorasFichero b =new BitacorasFichero("Ha modificado el rol de "+w,f,u.getCorreo(),rol);
            b.escribirBitacorasCuerpo();

            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestion/gestionarRol.jsp");
        }
        if(request.getParameter("botRol").equals("X")){
            String w = request.getParameter("correo");
            ConexionEstatica.Borrar_Dato_Rol(w);
            
            String usu = (String) session.getAttribute("usu");
            Usuario u = ConexionEstatica.existeUsu(usu);

            SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
            Date d = new Date();
            String f = s.format(d);
            int rol = ConexionEstatica.Conseguir_Rol(u.getCorreo());
            BitacorasFichero b =new BitacorasFichero("Ha eliminado el rol de "+w,f,u.getCorreo(),rol);
            b.escribirBitacorasCuerpo();

            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestion/gestionarRol.jsp");
        }
    }
    //boton de gestion aula
    if(request.getParameter("botAula")!=null){
        ConexionEstatica.nueva();
        if(request.getParameter("botAula").equals("Editar")){
            int w = Integer.parseInt(request.getParameter("aula"));
            int aula = Integer.parseInt(request.getParameter("codAula"));
            String des = request.getParameter("descripcionAula");
            ConexionEstatica.Modificar_Dato_CodAula_DescripcionAula(w,aula,des);
            String usu = (String) session.getAttribute("usu");
            Usuario u = ConexionEstatica.existeUsu(usu);

            SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
            Date d = new Date();
            String f = s.format(d);
            int rol = ConexionEstatica.Conseguir_Rol(u.getCorreo());
            BitacorasFichero b =new BitacorasFichero("Ha editado el aula "+w,f,u.getCorreo(),rol);
            b.escribirBitacorasCuerpo();
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestion/gestionarAula.jsp");
        }
        if(request.getParameter("botAula").equals("X")){
            int w = Integer.parseInt(request.getParameter("aula"));
            ConexionEstatica.Borrar_Dato_Aula(w);
            String usu = (String) session.getAttribute("usu");
            Usuario u = ConexionEstatica.existeUsu(usu);

            SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
            Date d = new Date();
            String f = s.format(d);
            int rol = ConexionEstatica.Conseguir_Rol(u.getCorreo());
            BitacorasFichero b =new BitacorasFichero("Ha eliminado el aula "+w,f,u.getCorreo(),rol);
            b.escribirBitacorasCuerpo();
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestion/gestionarAula.jsp");
        }
    }
%>