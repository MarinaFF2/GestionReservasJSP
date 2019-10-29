<%-- 
    Document   : subefichero
    Created on : 20-oct-2019, 18:06:24
    Author     : fernando
--%>


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
                } else {//Si es un campo de formulario (no fichero) extraemos su valor de la siguiente manera.
                    /*
                            Como el formulario debe ser enctype="multipart/form-data" para que admita el envío del fichero. 
                            La primera pega que encontramos con JSP es que si el envío el multipart, no funcionan las llamadas a 
                            request.getParameter(), siempre devuelven null. Por ello, si el formulario tiene más campos que 
                            necesitemos leer, debemos delegar toda la tarea en la librería apache-commons-fileupload.
                     */
                    // Para obtener clave y valor de los campos formulario.

                    String key = uploaded.getFieldName();
                    String valor = uploaded.getString();

                    //--> Vemos que la siguiente línea devolverá null por el tipo de enctype del formulario (necesario para sublir ficheros).
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
            }else{
                ConexionEstatica.Modificar_Dato_Usuario(u, n);
            }
            response.sendRedirect( "../vista/usuario/registrarse.jsp");
            ConexionEstatica.cerrarBD();
        %>
    </body>
</html>
