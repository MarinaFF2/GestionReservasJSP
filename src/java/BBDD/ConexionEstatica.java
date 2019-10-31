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

    public static void nueva() {
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
    public static Usuario existeUsu(String usuario) {
        Usuario existe = null;
        try {
            String sentencia = "SELECT * FROM usuario WHERE correo =? ";
            //Preparamos la sentencia para evitar la inyección.
            PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(sentencia);
            sentenciaPreparada.setString(1, usuario);
            ConexionEstatica.Conj_Registros = sentenciaPreparada.executeQuery();
            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                existe = new Usuario(Conj_Registros.getString(1), Conj_Registros.getString(2), Conj_Registros.getString(3), Conj_Registros.getString(4), Conj_Registros.getInt(5), Conj_Registros.getBytes(6), Conj_Registros.getBlob(6));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return existe;//Si devolvemos null el usuario no existe.
    }
    public static Usuario existeUsuario(String usuario,String clave) {
        Usuario existe = null;
        try {
            String sentencia = "SELECT * FROM usuario WHERE correo = ? and clave= ?";
            //Preparamos la sentencia para evitar la inyección.
            PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(sentencia);
            sentenciaPreparada.setString(1, usuario);
            sentenciaPreparada.setString(2, clave);
            ConexionEstatica.Conj_Registros = sentenciaPreparada.executeQuery();
            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                existe = new Usuario(Conj_Registros.getString(1), Conj_Registros.getString(2), Conj_Registros.getString(3), Conj_Registros.getString(4), Conj_Registros.getInt(5), Conj_Registros.getBytes(6), Conj_Registros.getBlob(6));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return existe;//Si devolvemos null el usuario no existe.
    }
    public static LinkedList obtenerUsuarios() {
        LinkedList v = new LinkedList<>();
        Usuario u = null;
        String sentencia = "SELECT usuario.correo, usuario.clave,usuario.nombre,usuario.apellido, usuario.edad, usuario.foto, rol.codRol FROM rol,asignarrol,usuario WHERE rol.codRol = asignarrol.codRol and asignarrol.codProfesor = usuario.correo";
        PreparedStatement ps = null;
        
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sentencia);
            ConexionEstatica.Conj_Registros = ps.executeQuery(sentencia);
            
            while (Conj_Registros.next()) {
                u = new Usuario(Conj_Registros.getString(1), Conj_Registros.getString(2), Conj_Registros.getString(3), Conj_Registros.getString(4), Conj_Registros.getInt(5), Conj_Registros.getBytes(6),Conj_Registros.getBlob(6),Conj_Registros.getInt(7));
                v.add(u);
            }
        } catch (SQLException ex) {
        }
        return v;
    }
    public static LinkedList obtenerUsu() {
        LinkedList v = new LinkedList<>();
        Usuario u = null;
        String sentencia = "SELECT usuario.correo, usuario.clave,usuario.nombre,usuario.apellido, usuario.edad, rol.codRol FROM rol,asignarrol,usuario WHERE rol.codRol = asignarrol.codRol and asignarrol.codProfesor = usuario.correo";
        PreparedStatement ps = null;
        
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sentencia);
            ConexionEstatica.Conj_Registros = ps.executeQuery(sentencia);
            
            while (Conj_Registros.next()) {
                u = new Usuario(Conj_Registros.getString(1), Conj_Registros.getString(2), Conj_Registros.getString(3), Conj_Registros.getString(4), Conj_Registros.getInt(5), Conj_Registros.getInt(6));
                v.add(u);
            }
        } catch (SQLException ex) {
        }
        return v;
    }
    public static void Insertar_Usuario(Usuario n) {
        String sql1 = "INSERT INTO usuario (correo,clave,nombre,apellido,edad,foto) VALUES (?,?,?,?,?,?);";
        String sql = "INSERT INTO asignarrol VALUES (0,1,?)";

        PreparedStatement ps = null;
        PreparedStatement p = null;

        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql1);
            p = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, n.getCorreo());
            ps.setString(2, n.getClave());
            ps.setString(3, n.getNombre());
            ps.setString(4, n.getApellido());
            ps.setInt(5, n.getEdad());
            ps.setBytes(6, n.getFoto());
            p.setString(1, n.getCorreo());
            ps.executeUpdate();
            p.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                p.close();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    public static void Modificar_Dato_Foto(String u, byte [] f) {
        String sql1 = "UPDATE usuario SET foto = ? WHERE correo = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql1);
            ps.setBytes(1, f);
            ps.setString(2, u);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    public static void Modificar_Nombre_Apellido_Edad(String u, String nom, String ape,int edad) {
        String sql1 = "UPDATE usuario SET nombre = ?, apellido = ?, edad = ? WHERE correo = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql1);
            ps.setString(1, nom);
            ps.setString(2, ape);
            ps.setInt(3, edad);
            ps.setString(4, u);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    public static void Modificar_Dato_Usuario(Usuario u, Usuario n) throws SQLException {
        String sql1 = "UPDATE usuario SET  foto = ?, clave = ?, nombre = ?, apellido = ?, edad = ?,correo = ? WHERE correo = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql1);
            ps.setBytes(1, n.getFoto());
            ps.setString(2, n.getClave());
            ps.setString(3, n.getNombre());
            ps.setString(4, n.getApellido());
            ps.setInt(5, n.getEdad());
            ps.setString(6, n.getCorreo());
            ps.setString(7, u.getCorreo());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    public static void Modificar_Dato_Clave(String c, String cl) throws SQLException {
        String sql1 = "UPDATE usuario SET clave = ? WHERE correo = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql1);
            ps.setString(1, c);
            ps.setString(2,cl);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    public static void Borrar_Dato_Usuario(String n) throws SQLException {
        String sql1 = "DELETE FROM usuario WHERE correo = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql1);
            ps.setString(1, n);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    
    
    //AsignarRol
    public static LinkedList Obtener_Rol() throws SQLException {
        LinkedList v = new LinkedList<>();
        Usuario u = null;
        String sentencia = "SELECT usuario.correo, rol.codRol FROM rol,asignarrol,usuario WHERE rol.codRol = asignarrol.codRol and asignarrol.codProfesor = usuario.correo";
        PreparedStatement ps = null;
        
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sentencia);
            ConexionEstatica.Conj_Registros = ps.executeQuery(sentencia);
            
            while (Conj_Registros.next()) {
                u = new Usuario(Conj_Registros.getString(1), Conj_Registros.getInt(2));
                v.add(u);
            }
        } catch (SQLException ex) {
        }
        return v;
    }
    public static void Modificar_Dato_IdAsignarRol(String u , int rol) throws SQLException {
        String sql1 = "UPDATE usuario,asignarrol SET asignarrol.codRol = ? WHERE codProfesor = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql1);
            ps.setInt(1, rol);
            ps.setString(2, u);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    public static void Insertar_Dato_AsignarRol(Usuario n) throws SQLException {
        String sql1 = "INSERT INTO asignarrol VALUES (0,?,?)";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql1);
            ps.setInt(1, n.getRol());
            ps.setString(2, n.getCorreo());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    public static int Conseguir_Rol(String correo) throws SQLException {
        int rol = 1;
        try {
            String sentencia = "SELECT rol.codRol FROM rol,asignarrol,usuario WHERE rol.codRol = asignarrol.codRol and asignarrol.codProfesor = usuario.correo and asignarrol.codProfesor = ?";
            PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(sentencia);
            sentenciaPreparada.setString(1, correo);
            ConexionEstatica.Conj_Registros = sentenciaPreparada.executeQuery();
            while (Conj_Registros.next()) {
                rol = Conj_Registros.getInt(1);
            }
        } catch (SQLException ex) {
        }

        return rol;
    }
    public static void Borrar_Dato_Rol(String u) throws SQLException {
        String sql = "DELETE FROM asignarrol WHERE codProfesor = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, u);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    
    //   FRANJA HORARIA
    public static LinkedList obtenerFranjaAulaDeterminada(String fecha, int aula) {
        LinkedList v = new LinkedList<>();
        FranjaHoraria f = null;
            
        try {
            String sentencia = "SELECT DISTINCT * FROM franja WHERE codAula= ? AND fechaDia=?;";
            PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(sentencia);
            sentenciaPreparada.setInt(1, aula);
            sentenciaPreparada.setString(2, fecha);
            ConexionEstatica.Conj_Registros = sentenciaPreparada.executeQuery();
            while (Conj_Registros.next()) {
                f = new FranjaHoraria(Conj_Registros.getInt(1), Conj_Registros.getInt(2), Conj_Registros.getString(3), Conj_Registros.getString(5), Conj_Registros.getString(6), Conj_Registros.getString(7), Conj_Registros.getInt(4), Conj_Registros.getString(8));
                v.add(f);
            }
        } catch (SQLException ex) {
        }
        return v;
    }
    public static LinkedList obtenerFranjaDeterminada() {
        LinkedList v = new LinkedList<>();
        FranjaHoraria f = null;
        String sentencia = "SELECT DISTINCT codFranja,inicioHora,finHora FROM franja;";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sentencia);
            ConexionEstatica.Conj_Registros = ps.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                f = new FranjaHoraria(Conj_Registros.getInt(1), Conj_Registros.getString(2), Conj_Registros.getString(3));
                v.add(f);
            }
        } catch (SQLException ex) {
        }
        return v;
    }
    public static void Modificar_Dato_Aula(int clave, String correo) throws SQLException {
        String sql = "UPDATE franja SET correo = ? WHERE clave = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, clave);
            ps.setString(2, correo);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    public static void Modificar_Dato_Franja_IniHora_FinHora(int clave, int codFranja, String inicioHora, String finHora) throws SQLException {
        String sql = "UPDATE franja SET codFranja = ?, inicioHora = ?, finHora = ? WHERE clave = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, codFranja);
            ps.setString(2, inicioHora);
            ps.setString(3, finHora);
            ps.setInt(4, clave);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    public static void Modificar_Dato_Reservado_CodProfesor(String codPro, String rese, int clave, int aula, String fecha) throws SQLException {
        String sql = "UPDATE franja SET codProfesor = ?,  reservado = ?, codAula = ?, fechaDia = ? WHERE clave = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, codPro);
            ps.setString(2, rese);
            ps.setInt(3, aula);
            ps.setString(4, fecha);
            ps.setInt(5, clave);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                System.out.println("Error general: " + ex.getMessage());
            } catch (Exception e) {
                System.out.println("Error general: " + e.getMessage());
            }
        }
    }
    public static void Insertar_Dato_Franja(String tabla, int aula, int franja, String fecha, String inicioHora, String finHora, String pro, int clave, String rese) throws SQLException {
        String sql = "INSERT INTO franja VALUES (?,?,?,?,?,?,?,?)";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, aula);
            ps.setInt(2, franja);
            ps.setString(3, fecha);
            ps.setString(4, inicioHora);
            ps.setString(5, finHora);
            ps.setString(6, pro);
            ps.setInt(7, clave);
            ps.setString(8, rese);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    public static void Borrar_Dato_Franja(int franja) throws SQLException {
        String sql = "DELETE FROM franja WHERE nFranja = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, franja);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    
    
    //   AULAS
    public static LinkedList obtenerAulas() {
        LinkedList v = new LinkedList<>();
        Aula a = null;
        String sentencia = "SELECT * FROM aula";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sentencia);
            ConexionEstatica.Conj_Registros = ps.executeQuery(sentencia);
            
            while (Conj_Registros.next()) {
                a = new Aula(Conj_Registros.getInt(1), Conj_Registros.getString(2));
                v.add(a);
            }
        } catch (SQLException ex) {
        }
        return v;
    }
    public static void Modificar_Dato_CodAula_DescripcionAula(int aula, int au, String des) throws SQLException {
        String sql = "UPDATE aula SET descripcion = ?, codAula = ? WHERE codAula = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, des);
            ps.setInt(2, au);
            ps.setInt(3, aula);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    public static void Insertar_Dato_Aula(int aula, String des) throws SQLException {
        String sql= "INSERT INTO aula VALUES (?,?)";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, aula);
            ps.setString(2, des);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    public static void Borrar_Dato_Franja_Aula(int a) throws SQLException {
        String sql = "DELETE FROM franja WHERE codAula = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, a);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    public static void Borrar_Dato_Aula(int aula) throws SQLException {
        String sql = "DELETE FROM aula WHERE codAula = ? ";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, aula);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    
}
