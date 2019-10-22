/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clase;

/**
 *
 * @author Marina flores fernandez
 */
public class FranjaHoraria {
    private int franja;
    private String inicioHora;
    private String finHora;
    private int aula;
    private String fechaDia;
    private String reservado;
    private String codProfesor;

    /**
     * Constructor para gestionar Franjas
     * @param franja
     * @param inicioHora
     * @param finHora 
     */
    public FranjaHoraria(int franja, String inicioHora, String finHora) {
        this.franja = franja;
        this.inicioHora = inicioHora;
        this.finHora = finHora;
    }

    
    /**
     * Constructor para reservarFranjas
     * @param franja
     * @param reservado 
     */
    public FranjaHoraria(int aula,int franja, String fechaDia,String codProfesor,String inicioHora, String finHora,String reservado) {    
        this.franja = franja;
        this.inicioHora = inicioHora;
        this.finHora = finHora;
        this.aula = aula;
        this.fechaDia = fechaDia;
        this.codProfesor = codProfesor;
        this.reservado = reservado;
    }

    /**
     * Constructor por defecto
     * @param franja
     * @param inicioHora
     * @param finHora
     * @param aula
     * @param fechaDia
     * @param reservado
     * @param codProfesor 
     */
    public FranjaHoraria(int franja, String inicioHora, String finHora, int aula, String fechaDia, String reservado, String codProfesor) {
        this.franja = franja;
        this.inicioHora = inicioHora;
        this.finHora = finHora;
        this.aula = aula;
        this.fechaDia = fechaDia;
        this.reservado = reservado;
        this.codProfesor = codProfesor;
    }

    
    
    
    public int getFranja() {
        return franja;
    }

    public void setFranja(int franja) {
        this.franja = franja;
    }

    public String getInicioHora() {
        return inicioHora;
    }

    public void setInicioHora(String inicioHora) {
        this.inicioHora = inicioHora;
    }

    public String getFinHora() {
        return finHora;
    }

    public void setFinHora(String finHora) {
        this.finHora = finHora;
    }

    public int getAula() {
        return aula;
    }

    public void setAula(int aula) {
        this.aula = aula;
    }

    public String getFechaDia() {
        return fechaDia;
    }

    public void setFechaDia(String fechaDia) {
        this.fechaDia = fechaDia;
    }

    public String getReservado() {
        return reservado;
    }

    public void setReservado(String reservado) {
        this.reservado = reservado;
    }

    public String getCodProfesor() {
        return codProfesor;
    }

    public void setCodProfesor(String codProfesor) {
        this.codProfesor = codProfesor;
    }
    
    
}
