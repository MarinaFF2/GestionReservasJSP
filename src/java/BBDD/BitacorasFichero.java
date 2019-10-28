/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BBDD;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

/**
 * Este fichero se creará en el servidor: glassfishXX/glassfish/domains/domain1/config
 * @author fernando
 */
public class BitacorasFichero {

    public static void escribirBitacoras(String accion, Date feHo, String correo, String rol) {
        FileWriter fw = null;
        String n = "<td>"+accion+"</td><td>"+feHo+"</td><td>"+correo+"</td> <td>"+rol+"</td>";
        String m = "<table><caption>Contenido del archivo Bitacora</caption><thead><tr><th>Acción</th><th>Fecha y hora se la acción</th><th>correo del usuario</th><th>Rol</th></tr></thead><tbody><tr>"+n+"s</tr></tbody></table>";

        try {
            fw = new FileWriter(Constantes.ficheroBitacoras, true);
            fw.write(m+"\r\n");
            fw.close();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
