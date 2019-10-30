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
    private static String accion;
    private static String feHo;
    private static String correo;
    private static String rol;
    private static String cuerpo = "<tr><td>"+BitacorasFichero.accion+"</td><td>"+BitacorasFichero.feHo+"</td><td>"+BitacorasFichero.correo+"</td> <td>"+BitacorasFichero.rol+"</td></tr>";
      
    
    public static void escribirBitacorasCuerpo() {
        FileWriter fw = null;
        try {
            fw = new FileWriter(Constantes.ficheroBitacoras, true);
            fw.write(cuerpo+"\r\n");
            fw.close();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public BitacorasFichero(String accion, String feHo,String correo, int ro) {
        BitacorasFichero.correo=correo;
        BitacorasFichero.accion=accion;
        BitacorasFichero.rol=BitacorasFichero.getRol(ro);
        BitacorasFichero.feHo=feHo;
    }
    public static String getAccion() {
        return accion;
    }

    public static void setAccion(String accion) {
        BitacorasFichero.accion = accion;
    }

    public static String getFeHo() {
        return feHo;
    }

    public static void setFeHo(String feHo) {
        BitacorasFichero.feHo = feHo;
    }

    public static String getCorreo() {
        return correo;
    }

    public static void setCorreo(String correo) {
        BitacorasFichero.correo = correo;
    }

    public static String getRol(int ro) {
        if(ro==3){
            rol="Administrador General";
        }
        if(ro==2){
            rol="Administrador Aulas";
        }
        if(ro==1){
            rol="Profesor";
        }
        return rol;
    }
}
