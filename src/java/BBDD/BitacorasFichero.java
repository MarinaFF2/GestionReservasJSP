/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BBDD;

import java.io.FileWriter;
import java.io.IOException;

/**
 * Este fichero se creará en el servidor: glassfishXX/glassfish/domains/domain1/config
 * @author fernando
 */
public class BitacorasFichero {
    public static void escribirBitacorasCuerpo(String accion, String feHo,String correo, int ro) {
        String rol = getRol(ro);
        String cuerpo = "<tr><td>"+accion+"</td><td>"+feHo+"</td><td>"+correo+"</td> <td>"+rol+"</td></tr>";
    
        FileWriter fw = null;
        try {
            fw = new FileWriter(Constantes.ficheroBitacoras, true);
            fw.write(cuerpo+"\r\n");
            fw.close();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public static String getRol(int ro) {
        String rol="";
        switch(ro){
            case 3:
                rol="Administrador General";
            break;
            case 2:
                rol="Administrador Aulas";
            break;
            case 1:
                rol="Profesor";
            break;
        }
        return rol;
    }
}
