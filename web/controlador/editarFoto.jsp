<%-- 
    Document   : editarFoto
    Created on : 30-oct-2019, 11:01:29
    Author     : daw207
--%>
<%@page import="BBDD.BitacorasFichero"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="clase.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="BBDD.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);

    ConexionEstatica.nueva();
    String correo = (String) session.getAttribute("usu");
    Usuario n = ConexionEstatica.existeUsu(correo);
    List items = upload.parseRequest(request);
    File fichero = null;
    FileItem uploaded = null;

    // Se recorren todos los items, que son de tipo FileItem
    for (Object item : items) {
        uploaded = (FileItem) item;
        
        if (!uploaded.isFormField()) {
            String nf = uploaded.getName();
            fichero = new File("perfiles/", uploaded.getName());
            uploaded.write(fichero);
            out.println("Archivo '" + uploaded.getName() + "' subido correctamente.");
            byte[] icono = new byte[(int) fichero.length()];
            InputStream input = new FileInputStream(fichero);
            input.read(icono);
            n.setFoto(icono);
        }
    }
        ConexionEstatica.Modificar_Dato_Foto(n.getCorreo(),n.getFoto());
        SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
        Date d = new Date();
        String f = s.format(d);
        int rol = ConexionEstatica.Conseguir_Rol(n.getCorreo());
        BitacorasFichero.escribirBitacorasCuerpo("Ha cambiado la foto de perfil",f,n.getCorreo(),rol);
    ConexionEstatica.cerrarBD();
    response.sendRedirect( "../vista/usuario/editarFoto.jsp");
    
%>
