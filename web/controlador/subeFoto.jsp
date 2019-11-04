<%-- 
    Document   : subefichero
    Created on : 20-oct-2019, 18:06:24
    Author     : fernando
--%>

<%@page import="BBDD.BitacorasFichero"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="clase.Codificar"%>
<%@page import="BBDD.ConexionEstatica"%>
<%@page import="clase.Usuario"%>
<%@page import="BBDD.Constantes"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            Usuario n = new Usuario();
            List items = upload.parseRequest(request);
            File fichero = null;
            FileItem uploaded = null;
            for (Object item : items) {
                uploaded = (FileItem) item;
                if (!uploaded.isFormField()) {
                    String nf = uploaded.getName();
                    
                    fichero = new File("perfiles", uploaded.getName()); 
                    uploaded.write(fichero);
                    out.println("<p>Archivo '" + uploaded.getName() + "' subido correctamente.</p>");
                    byte[] icono = new byte[(int) fichero.length()];
                    InputStream input = new FileInputStream(fichero);
                    input.read(icono);
                    n.setFoto(icono);
                } else {

                    String key = uploaded.getFieldName();
                    String valor = uploaded.getString();

                    if (key.equals("correo")) {
                        n.setCorreo(valor);
                    }
                    if (key.equals("clave")) {
                        n.setClave(Codificar.codifica(valor));
                    }
                    if (key.equals("nombre")) {
                        n.setNombre(valor);
                    }
                    if (key.equals("apellido")) {
                        n.setApellido(valor);
                    }
                    if (key.equals("edad")) {
                        n.setEdad(Integer.parseInt(valor));
                    }
                }
            }

            ConexionEstatica.nueva();
            String correo = n.getCorreo();
            Usuario u = ConexionEstatica.existeUsu(correo);
            if (u == null) {
                ConexionEstatica.Insertar_Usuario(n);
                SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
                Date d = new Date();
                String f = s.format(d);
                int rol = ConexionEstatica.Conseguir_Rol(correo);
                BitacorasFichero.escribirBitacorasCuerpo("Se ha registrado en el sistema",f,correo,rol);
            }
            ConexionEstatica.cerrarBD();
            response.sendRedirect( "../vista/usuario/registrarse.jsp");
        %>
    </body>
</html>