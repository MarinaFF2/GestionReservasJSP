package BBDD;

import java.sql.*;
import javax.swing.JOptionPane;

public class Conexion {

    //********************* Atributos *************************
    private java.sql.Connection Conex;
    //Atributo a través del cual hacemos la conexión física.
    private java.sql.Statement Sentencia_SQL;
    //Atributo que nos permite ejecutar una sentencia SQL
    private java.sql.ResultSet Conj_Registros;
    //(Cursor) En él están almacenados los datos.
    private String bbdd;
    private String usuario;
    private String clave;

    //********************** Constructores **************************
    //----------------------------------------------------------
    public Conexion() throws ClassNotFoundException,
            InstantiationException, IllegalAccessException, SQLException {
        //Cargar el driver/controlador
        String controlador = "com.mysql.jdbc.Driver";
        //String controlador = "oracle.jdbc.driver.OracleDriver";
        //String controlador = "sun.jdbc.odbc.JdbcOdbcDriver";
        Class.forName(controlador).newInstance();
    }

    public Conexion(String b, String u, String c) throws ClassNotFoundException,
            InstantiationException, IllegalAccessException, SQLException {
        //Cargar el driver/controlador
        String controlador = "com.mysql.jdbc.Driver";
        //String controlador = "oracle.jdbc.driver.OracleDriver";
        //String controlador = "sun.jdbc.odbc.JdbcOdbcDriver"; 
        //String controlador = "org.mariadb.jdbc.Driver"; // MariaDB la version libre de MySQL (requiere incluir la librería jar correspondiente).
        //Class.forName(controlador).newInstance();
        Class.forName(controlador);
        bbdd = b;
        usuario = u;
        clave = c;
        Conectar(bbdd);
    }

    //********************** Métodos **************************
    //----------------------------------------------------------
    private void Conectar(String nombre_bbdd) throws SQLException {
        String URL_BD = "jdbc:mysql://localhost/" + nombre_bbdd;
        //String URL_BD = "jdbc:mariadb://"+this.servidor+":"+this.puerto+"/"+this.bbdd+"";
        //String URL_BD = "jdbc:oracle:oci:@REPASO";
        //String URL_BD = "jdbc:oracle:oci:@REPASO";
        //String URL_BD = "jdbc:odbc:REPASO";

        //Realizamos la conexión a una BD con un usuario y una clave.
        try {
            Conex = java.sql.DriverManager.getConnection(URL_BD, usuario, clave);
            Sentencia_SQL = Conex.createStatement();
            System.out.println("Conexion realizada con éxito");
        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        }

    }
    
    //----------------------------------------------------------
    public void Modificar_Dato(String tabla, String correo, String Nuevo_correo) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET Correo = '" + Nuevo_correo + "' WHERE correo = '" + correo + "'";
    }

    //----------------------------------------------------------
    public void Insertar_Dato(String tabla, String correo, int edad, int rol) throws SQLException {
        String Sentencia = "INSERT INTO " + tabla + " VALUES ('" + correo + "'," + "'" + edad + "','" + rol + "')";
    }

    //----------------------------------------------------------
    public void Borrar_Dato(String tabla, String correo) throws SQLException {
        String Sentencia = "DELETE FROM " + tabla + " WHERE correo = '" + correo + "'";
    }


    
    public void cerrarBD() {
        try {
            // resultado.close();
            this.Conex.close();
            System.out.println("Desconectado de la Base de Datos"); // Opcional para seguridad
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error de Desconexion", JOptionPane.ERROR_MESSAGE);
        }
    }

}
