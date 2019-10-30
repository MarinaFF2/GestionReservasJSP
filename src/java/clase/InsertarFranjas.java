/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clase;

import BBDD.ConexionEstatica;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * inserta tablas de anioMin a anioMax
 *
 * @author 5amar
 */
public class InsertarFranjas {

    private int anioMin;
    private int anioMax;

    public InsertarFranjas(int anioMin, int anioMax) {
        this.anioMin = anioMin;
        this.anioMax = anioMax;
    }
    

    public void hacerFranjasFranjas1_aula101() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 101; aula < 104; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 1, anio + "-0" + mes + "-0" + dia, "08:30", "09:25", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 201; aula < 204; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 1, anio + "-0" + mes + "-0" + dia, "08:30", "09:25", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
    }

    public void hacerFranjasFranjas1_aula201() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 101; aula < 104; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 1, anio + "-0" + mes + "-0" + dia, "08:30", "09:25", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 201; aula < 204; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 1, anio + "-0" + mes + "-0" + dia, "08:30", "09:25", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
    }

    public void hacerFranjasFranjas1_aula301() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 301; aula < 304; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 1, anio + "-0" + mes + "-0" + dia, "08:30", "09:25", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 301; aula < 304; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 1, anio + "-0" + mes + "-0" + dia, "08:30", "09:25", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
    }

    public void hacerFranjasFranjas2_aula101() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 101; aula < 104; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 2, anio + "-0" + mes + "-0" + dia, "09:25", "10:20", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 201; aula < 204; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 2, anio + "-0" + mes + "-0" + dia, "09:25", "10:20", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
    }

    public void hacerFranjasFranjas2_aula201() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 101; aula < 104; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 2, anio + "-0" + mes + "-0" + dia, "09:25", "10:20", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 201; aula < 204; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 2, anio + "-0" + mes + "-0" + dia, "09:25", "10:20", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
    }

    public void hacerFranjasFranjas2_aula301() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 301; aula < 304; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 2, anio + "-0" + mes + "-0" + dia, "09:25", "10:20", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 301; aula < 304; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 2, anio + "-0" + mes + "-0" + dia, "09:25", "10:20", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
    }

    public void hacerFranjasFranjas3_aula101() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 101; aula < 104; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 3, anio + "-0" + mes + "-0" + dia, "10:20", "11:15", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 201; aula < 204; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 3, anio + "-0" + mes + "-0" + dia, "10:20", "11:15", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
    }

    public void hacerFranjasFranjas3_aula201() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 101; aula < 104; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 3, anio + "-0" + mes + "-0" + dia, "10:20", "11:15", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 201; aula < 204; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 3, anio + "-0" + mes + "-0" + dia, "10:20", "11:15", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
    }

    public void hacerFranjasFranjas3_aula301() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 301; aula < 304; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 3, anio + "-0" + mes + "-0" + dia, "10:20", "11:15", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 301; aula < 304; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 3, anio + "-0" + mes + "-0" + dia, "10:20", "11:15", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
    }

    public void hacerFranjasFranjas4_aula101() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 101; aula < 104; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 4, anio + "-0" + mes + "-0" + dia, "11:15", "12:40", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 201; aula < 204; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 4, anio + "-0" + mes + "-0" + dia, "11:15", "12:40", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
    }

    public void hacerFranjasFranjas4_aula201() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 101; aula < 104; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 4, anio + "-0" + mes + "-0" + dia, "11:15", "12:40", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 201; aula < 204; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 4, anio + "-0" + mes + "-0" + dia, "11:15", "12:40", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
    }

    public void hacerFranjasFranjas4_aula301() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 301; aula < 304; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 4, anio + "-0" + mes + "-0" + dia, "11:15", "12:40", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 301; aula < 304; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 4, anio + "-0" + mes + "-0" + dia, "11:15", "12:40", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
    }

    public void hacerFranjasFranjas5_aula101() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 101; aula < 104; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 5, anio + "-0" + mes + "-0" + dia, "12:40", "13:35", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 201; aula < 204; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 5, anio + "-0" + mes + "-0" + dia, "12:40", "13:35", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
    }

    public void hacerFranjasFranjas5_aula201() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 101; aula < 104; aula++) {
                        try {
                            ConexionEstatica.Insertar_Dato_Franja("franja", aula, 5, anio + "-0" + mes + "-0" + dia, "12:40", "13:35", "NULL", 0, "LIBRE");
                        } catch (SQLException ex) {
                            Logger.getLogger(InsertarFranjas.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 201; aula < 204; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 5, anio + "-0" + mes + "-0" + dia, "12:40", "13:35", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
    }

    public void hacerFranjasFranjas5_aula301() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 301; aula < 304; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 5, anio + "-0" + mes + "-0" + dia, "12:40", "13:35", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 301; aula < 304; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 5, anio + "-0" + mes + "-0" + dia, "12:40", "13:35", "NULL", 0, "LIBRE");
                    }
                }
            }

        }
    }

    public void hacerFranjasFranjas6_aula101() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 101; aula < 104; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 6, anio + "-0" + mes + "-0" + dia, "13:35", "14:30", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 201; aula < 204; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 6, anio + "-0" + mes + "-0" + dia, "13:35", "14:30", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
    }

    public void hacerFranjasFranjas6_aula201() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 101; aula < 104; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 6, anio + "-0" + mes + "-0" + dia, "13:35", "14:30", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 201; aula < 204; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 6, anio + "-0" + mes + "-0" + dia, "13:35", "14:30", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
    }

    public void hacerFranjasFranjas6_aula301() throws SQLException {
        for (int dia = 1; dia < 9; dia++) {
            for (int mes = 1; mes < 9; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 301; aula < 304; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 6, anio + "-0" + mes + "-0" + dia, "13:35", "14:30", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
        for (int dia = 10; dia < 31; dia++) {
            for (int mes = 10; mes < 12; mes++) {
                for (int anio = anioMin; anio < anioMax; anio++) {
                    for (int aula = 301; aula < 304; aula++) {
                        ConexionEstatica.Insertar_Dato_Franja("franja", aula, 6, anio + "-0" + mes + "-0" + dia, "13:35", "14:30", "NULL", 0, "LIBRE");
                    }
                }
            }
        }
    }
}
