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
    private int aula;
    private int franja;
    private Date fechaDia;
    private String inicioHora;
    private String finHora;
    private String codProfesor;
    private String reservado;
    private int clave;

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
     * @param inicioHora
     * @param finHora 
     */
    public FranjaHoraria(int franja, String inicioHora, String finHora,String reservado) {
        this.franja = franja;
        this.inicioHora = inicioHora;
        this.finHora = finHora;
        this.reservado = reservado;
    }
    
        /**
         * Constructor por defecto
         * @param aula
         * @param franja
         * @param fechaDia
         * @param inicioHora
         * @param finHora
         * @param codProfesor
         * @param clave 
         **/
    /*
        public FranjaHoraria(int aula, int franja, Date fechaDia, String inicioHora, String finHora, String codProfesor, int clave,String reservado) {
            this.aula = aula;
            this.franja = franja;
            this.fechaDia = fechaDia;
            this.inicioHora = inicioHora;
            this.finHora = finHora;
            this.codProfesor = codProfesor;
            this.reservado = reservado;
            this.clave = clave;
        }
        */
    
    @Override
    public String toString() {
        return "FranjaHoraria{" + "aula=" + aula + ", franja=" + franja + ", fechaDia=" + fechaDia + ", inicioHora=" + inicioHora + ", finHora=" + finHora + ", codProfesor=" + codProfesor + ", reservado=" + reservado + ", clave=" + clave + '}';
    }

    
    public String getReservado() {
        return reservado;
    }

    public void setReservado(String reservado) {
        this.reservado = reservado;
    }

    public int getClave() {
        return clave;
    }

    public void setClave(int clave) {
        this.clave = clave;
    }
    
    
    public int getAula() {
        return aula;
    }

    public void setAula(int aula) {
        this.aula = aula;
    }

    public int getFranja() {
        return franja;
    }

    public void setFranja(int franja) {
        this.franja = franja;
    }

    public Date getFechaDia() {
        return fechaDia;
    }

    public void setFechaDia(Date fechaDia) {
        this.fechaDia = fechaDia;
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

    public String getCodProfesor() {
        return codProfesor;
    }

    public void setCodProfesor(String codProfesor) {
        this.codProfesor = codProfesor;
    }
    
    
}
