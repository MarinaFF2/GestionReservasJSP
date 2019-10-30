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

    Usuario n = new Usuario();
    // 'request' es la HttpServletRequest que recibimos del formulario.
    // Los items obtenidos serán cada uno de los campos del formulario,
    // tanto campos normales como ficheros subidos.
    List items = upload.parseRequest(request);
     File fichero = null;

    // Se recorren todos los items, que son de tipo FileItem
    for (Object item : items) {
        FileItem uploaded = (FileItem) item;
        // Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
        // subido donde nos interese.
        if (!uploaded.isFormField()) {
            // Es un campo fichero: guardamos el fichero en alguna carpeta (en este caso perfiles).
            //Si lo ponemos como sigue: el archivo se guardará en 'glassfish5/glassfish/domains/domain1/config/perfiles'.
            //File fichero = new File("perfiles", uploaded.getName()); 
            //Este directorio anterior, por seguridad, luego no será accesible.

            //Cambiamos la ruta de destino a:
            //String rutaDestino = "/home/fernando/NetBeansProjects/DAW2_19_20/SubirArchivos/web/perfiles";
            //String rutaDestino = "aulasInstituto/web/img/perfiles";
            String nf = uploaded.getName();
            //File fichero = new File(Constantes.rutaServidorWindows, uploaded.getName()); //El archivo se guardará en 'glassfish5/glassfish/domains/domain1/config/perfiles'.
            fichero = new File("perfiles", uploaded.getName()); //El archivo se guardará en 'glassfish5/glassfish/domains/domain1/config/perfiles'.
            uploaded.write(fichero);
            out.println("Archivo '" + uploaded.getName() + "' subido correctamente.");
            //pasamos a binario la imagen para almacenarla en mySql
            byte[] icono = new byte[(int) fichero.length()];
            InputStream input = new FileInputStream(fichero);
            input.read(icono);
            n.setFoto(icono);
        }
    }

    ConexionEstatica.nueva();
    String correo = n.getCorreo();
    Usuario u = ConexionEstatica.existeUsu(correo);
    if (u != null) {
        ConexionEstatica.Modificar_Dato_Foto(u.getCorreo(),n.getFoto());
        SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
        Date d = new Date();
        String f = s.format(d);
        int rol = ConexionEstatica.Conseguir_Rol(u.getCorreo());
        BitacorasFichero.escribirBitacorasCuerpo("Ha cambiado la foto de perfil",f,u.getCorreo(),rol);
    }
    response.sendRedirect( "../vista/usuario/editarFoto.jsp");
    ConexionEstatica.cerrarBD();
%>
