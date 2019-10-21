/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clase;

/**
 * 
 * @author Marina Flores Fernandez
 */
public class Usuario {
    private String correo;
    private String clave;
    private String nombre;
    private String apellido;
    private String foto;
    private int edad;
    private int idAsignarRol; //por decfeto profesor

    public Usuario(String correo, String clave, String nombre, String apellido, int edad,String foto,int idAsignarRol) {
        this.correo = correo;
        this.clave = clave;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.foto=foto;
        this.idAsignarRol=idAsignarRol;
    }

   
    @Override
    public String toString() {
        return "Usuario{" + "correo=" + correo + ", clave=" + clave + ", nombre=" + nombre + ", apellido=" + apellido + ", foto=" + foto + ", edad=" + edad + '}';
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getIdAsignarRol() {
        return idAsignarRol;
    }

    public void setIdAsignarRol(int idAsignarRol) {
        this.idAsignarRol = idAsignarRol;
    }

    
   
    
}
