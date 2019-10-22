package BBDD;

import clase.Aula;
import clase.FranjaHoraria;
import clase.Usuario;
import java.sql.*;
import java.util.LinkedList;
import javax.swing.JOptionPane;

public class ConexionEstatica {

   //********************* Atributos *************************
    private static java.sql.Connection Conex;
    //Atributo a través del cual hacemos la conexión física.
    private static java.sql.Statement Sentencia_SQL;
    //Atributo que nos permite ejecutar una sentencia SQL
    private static java.sql.ResultSet Conj_Registros;

     public static void nueva(){
        try {
            //Cargar el driver/controlador
            String controlador = "com.mysql.jdbc.Driver";
            //String controlador = "oracle.jdbc.driver.OracleDriver";
            //String controlador = "sun.jdbc.odbc.JdbcOdbcDriver"; 
            //String controlador = "org.mariadb.jdbc.Driver"; // MariaDB la version libre de MySQL (requiere incluir la librería jar correspondiente).
            //Class.forName(controlador).newInstance();
            Class.forName(controlador);

            String URL_BD = "jdbc:mysql://localhost/" + Constantes.BBDD;
            //String URL_BD = "jdbc:mariadb://"+this.servidor+":"+this.puerto+"/"+this.bbdd+"";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:odbc:REPASO";

            //Realizamos la conexión a una BD con un usuario y una clave.
            Conex = java.sql.DriverManager.getConnection(URL_BD, Constantes.usuario, Constantes.password);
            Sentencia_SQL = Conex.createStatement();
            System.out.println("Conexion realizada con éxito");
        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        }

    }

    public static void cerrarBD() {
        try {
            // resultado.close();
            Conex.close();
            System.out.println("Desconectado de la Base de Datos"); // Opcional para seguridad
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error de Desconexion", JOptionPane.ERROR_MESSAGE);
        }
    }

    
    
    //      USUARIOS (PROFESORES)
    public static Usuario existeUsuario(String usuario, String clave) {
        Usuario existe = null;
        try {
            String sentencia = "SELECT * FROM usuario WHERE correo = '" + usuario + "' AND clave = '" + clave + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                existe = new Usuario(Conj_Registros.getString("correo"),Conj_Registros.getString("clave"),Conj_Registros.getString("nombre"), Conj_Registros.getString("apellido"), Conj_Registros.getInt("edad"), Conj_Registros.getString("foto"));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return existe;//Si devolvemos null el usuario no existe.
    }
    public static Usuario existeUsu(String usuario) {
        Usuario existe = null;
        try {
            String sentencia = "SELECT * FROM usuario WHERE correo = '" + usuario + "' ";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                existe = new Usuario(Conj_Registros.getString("correo"),Conj_Registros.getString("clave"),Conj_Registros.getString("nombre"), Conj_Registros.getString("apellido"), Conj_Registros.getInt("edad"), Conj_Registros.getString("foto"));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return existe;//Si devolvemos null el usuario no existe.
    }

    public static LinkedList obtenerUsuarios() {
        LinkedList v = new LinkedList<>();
        Usuario u = null;
        try {
            String sentencia = "SELECT * FROM usuario";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                u = new Usuario(Conj_Registros.getString("correo"),Conj_Registros.getString("clave"),Conj_Registros.getString("nombre"), Conj_Registros.getString("apellido"), Conj_Registros.getInt("edad"), Conj_Registros.getString("foto"));
                v.add(u);
            }
        } catch (SQLException ex) {
        }
        return v;
    }
    //----------------------------------------------------------
    public static void Modificar_Dato_Foto(String tabla, String correo, String Nuevo_foto) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET foto = '" + Nuevo_foto + "' WHERE correo = '" + correo + "'";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
    public static void Modificar_Dato_Nombre_Apellido_Edad(String tabla, String correo, String Nuevo_nombre, String Nuevo_apellido,int Nuevo_edad) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET nombre = '" + Nuevo_nombre + "', apellido = '" + Nuevo_apellido + "', edad = '" + Nuevo_edad + "' WHERE correo = '" + correo + "'";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
    public static void Modificar_Dato_IdAsignarRol(String tabla, String correo, int Nuevo_idAsignarRol) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET idAsignarRol = '" + Nuevo_idAsignarRol + "' WHERE correo = '" + correo + "'";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
    public static void Modificar_Dato_Clave(String tabla, String correo, String Nuevo_clave) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET clave = '" + Nuevo_clave + "' WHERE correo = '" + correo + "'";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
    //----------------------------------------------------------
    public static void Insertar_Dato_Usuario(String tabla, String correo, String clave, String nombre, String apellido, String foto, int edad) throws SQLException {
        String Sentencia = "INSERT INTO " + tabla + " VALUES ('"+ correo +"','"+clave+"','"+nombre+"','"+apellido+"','"+ edad+"','"+foto+"')";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
    //----------------------------------------------------------
    public static int Conseguir_Rol(String tabla, String correo) throws SQLException {
        int rol=0;
        try {
            String Sentencia = "SELECT rol.codRol FROM rol, asignarRol,usuario WHERE rol.codRol = asignarRol.codRol and asignarRol.codProfesor = "+tabla+".correo and "+tabla+".correo = '" + correo + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(Sentencia);
            while (Conj_Registros.next()) {
                rol= Conj_Registros.getInt("rol.codRol");
            }
        } catch (SQLException ex) {
        }
        
        return rol;
    }
    //----------------------------------------------------------
    public static void Borrar_Dato_Usuario(String tabla, String correo) throws SQLException {
        String Sentencia = "DELETE FROM " + tabla + " WHERE correo = '" + correo + "'";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }

    
    //AsignarRol
    public static void Insertar_Dato_AsignarRol(String tabla, String correo,int idAsignarRol) throws SQLException {
       String Sentencia = "INSERT INTO " + tabla + " VALUES (0,'"+idAsignarRol+"','"+ correo +"')";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
    
    //   FRANJA HORARIA
    /*public static LinkedList obtenerFranjasHorariasTodas() {
        LinkedList v = new LinkedList<>();
        FranjaHoraria f = null;
        try {
            String sentencia = "SELECT * FROM franja";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                f = new FranjaHoraria(Conj_Registros.getInt("codAula"),Conj_Registros.getInt("codFranja"),Conj_Registros.getDate("fechaDia"),Conj_Registros.getString("inicioHora"),Conj_Registros.getString("finHora"),Conj_Registros.getString("codProfesor"),Conj_Registros.getInt("clave"),Conj_Registros.getString("reservado"));
                v.add(f);
            }
        } catch (SQLException ex) {
        }
        return v;
    }*/
    public static LinkedList obtenerFranjaReservaAula(String fecha, int aula) {
        LinkedList v = new LinkedList<>();
        FranjaHoraria f = null;
        try {
            String sentencia = "SELECT codFranja,inicioHora,finHora,reservado FROM franja WHERE codAula= '"+aula+"' AND fechaDia='"+fecha+"';";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                f = new FranjaHoraria(Conj_Registros.getInt("codFranja"),Conj_Registros.getString("inicioHora"),Conj_Registros.getString("finHora"));
                v.add(f);
            }
        } catch (SQLException ex) {
        }
        return v;
    }
    public static LinkedList obtenerFranjaAulaDeterminada(Date fecha, int aula) {
        LinkedList v = new LinkedList<>();
        FranjaHoraria f = null;
        try {
            String sentencia = "SELECT DISTINCT codFranja,inicioHora,finHora,reserva FROM franja WHERE codAula= '"+aula+"' AND fechaDia='"+fecha+"';";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                f = new FranjaHoraria(Conj_Registros.getInt("codFranja"),Conj_Registros.getString("inicioHora"),Conj_Registros.getString("finHora"),Conj_Registros.getString("reservado"));
                v.add(f);
            }
        } catch (SQLException ex) {
        }
        return v;
    }
    public static LinkedList obtenerFranjaDeterminada() {
        LinkedList v = new LinkedList<>();
        FranjaHoraria f = null;
        try {
            String sentencia = "SELECT DISTINCT codFranja,inicioHora,finHora FROM franja;";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                f = new FranjaHoraria(Conj_Registros.getInt("codFranja"),Conj_Registros.getString("inicioHora"),Conj_Registros.getString("finHora"));
                v.add(f);
            }
        } catch (SQLException ex) {
        }
        return v;
    }
    //----------------------------------------------------------
    public static void Modificar_Dato_Aula(String tabla, int clave, String Nuevo_correo) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET correo = '" + Nuevo_correo + "' WHERE clave = '" + clave + "'";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
    public static void Modificar_Dato_Franja_IniHora_FinHora(String tabla, int clave, int Nuevo_codFranja , String Nuevo_inicioHora, String Nuevo_finHora) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET codFranja = '" + Nuevo_codFranja+"', inicioHora = '" + Nuevo_inicioHora + "', finHora = '" + Nuevo_finHora +"' WHERE clave = '" + clave + "' ";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
    public static void Modificar_Dato_Reservado_CodProfesor(String tabla,int aula, int fecha, String Nuevo_codProfesor, String Nuevo_reservado) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET codProfesor = '" + Nuevo_codProfesor + "',  reservado = '" + Nuevo_reservado + "' WHERE codAula = '" + aula + " AND fechaDia='"+fecha+"'";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
    
    //----------------------------------------------------------
    public static void Insertar_Dato_Franja(String tabla, int aula, int franja, Date fechaDia, String inicioHora, String finHora, String codProfesor, int clave, String reservado) throws SQLException {
        String Sentencia = "INSERT INTO " + tabla + " VALUES ('" + aula + "','" +franja+"','"+fechaDia + "','" + inicioHora + "','" +finHora+ "','" +codProfesor+ "','" +clave+ "','" +reservado+ "')";
       ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
    //----------------------------------------------------------
    public static void Borrar_Dato_Franja(String tabla, int franja) throws SQLException {
        String Sentencia = "DELETE FROM " + tabla + " WHERE nFranja = '" + franja + "'";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
    
    //   AULAS
    public static LinkedList obtenerAulas() {
        LinkedList v = new LinkedList<>();
        Aula a = null;
        try {
            String sentencia = "SELECT * FROM aula";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                a = new Aula(Conj_Registros.getInt("codAula"),Conj_Registros.getString("descripcion"));
                v.add(a);
            }
        } catch (SQLException ex) {
        }
        return v;
    }
    //----------------------------------------------------------
    public static void Modificar_Dato_CodAula_DescripcionAula(String tabla, int aula, int Nuevo_aula, String Nuevo_descripcion) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET descripcion = '" + Nuevo_descripcion + "', codAula = '" + Nuevo_aula + "' WHERE codAula = '" + aula + "'";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
    
    //----------------------------------------------------------
    public static void Insertar_Dato_Aula(String tabla, int aula, String descripcion) throws SQLException {
        String Sentencia = "INSERT INTO " + tabla + " VALUES ('" + aula + "','" +descripcion+"')";
       ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
    //----------------------------------------------------------
    public static void Borrar_Dato_Aula(String tabla, int aula) throws SQLException {
        String Sentencia = "DELETE FROM " + tabla + " WHERE codAula = '" + aula + "'";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
}
