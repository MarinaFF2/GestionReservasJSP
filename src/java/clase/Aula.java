/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clase;

/**
 *
 * @author 5amar
 */
public class Aula {
    private int codAula;
    private String descripcion;

    public Aula(int codAula, String descripcion) {
        this.codAula = codAula;
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "Aula{" + "codAula=" + codAula + ", descripcion=" + descripcion + '}';
    }

    public int getCodAula() {
        return codAula;
    }

    public void setCodAula(int codAula) {
        this.codAula = codAula;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
}
