/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clase;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;

/**
 * 
 * @author Marina Flores Fernandez
 */
public class Usuario {
    private String correo;
    private String clave;
    private String nombre;
    private String apellido;
    private byte [] foto;
    private Blob fotoBlob;
    private int edad;
    private int rol;

    public Usuario() {
    }

    
    
    /**
     * Constructor para gestion de rol
     * @param correo
     * @param rol 
     */
    public Usuario(String correo,int rol) {
        this.correo = correo;
        this.rol = rol;
    }

    
    /**
     * Constructor para comprobar y gestionar usuarios
     * @param correo
     * @param clave
     * @param nombre
     * @param apellido
     * @param edad
     * @param foto
     * @param fotoBLob 
     */
    public Usuario(String correo, String clave, String nombre, String apellido, int edad,byte[] foto,Blob fotoBLob) {
        this.correo = correo;
        this.clave = clave;
        this.nombre = nombre;
        this.apellido = apellido;
        this.foto = foto;
        this.fotoBlob=fotoBlob;
        this.edad = edad;
    }
    public Usuario(String correo, String clave, String nombre, String apellido, int edad,byte[] foto,Blob fotoBLob,int rol) {
        this.correo = correo;
        this.clave = clave;
        this.nombre = nombre;
        this.apellido = apellido;
        this.foto = foto;
        this.fotoBlob=fotoBlob;
        this.edad = edad;
        this.rol=rol;
    }

   
    @Override
    public String toString() {
        return "Usuario{" + "correo=" + correo + ", clave=" + clave + ", nombre=" + nombre + ", apellido=" + apellido + ", foto=" + foto + ", edad=" + edad + '}';
    }

    
    
    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
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

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    public Blob getFotoBlob() {
        return fotoBlob;
    }

    public void setFotoBlob(Blob fotoBlob) {
        this.fotoBlob = fotoBlob;
    }

    public String getFotoimgString() {
        String image =null;
        try {
            byte[] imageBytes = this.fotoBlob.getBytes(1, (int) this.fotoBlob.length());
            String encodedImage = Base64.getEncoder().encodeToString(imageBytes);
            image = "data:image/jpg;base64," + encodedImage;
            
        } catch (SQLException ex) {
        }
        return image;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
}
