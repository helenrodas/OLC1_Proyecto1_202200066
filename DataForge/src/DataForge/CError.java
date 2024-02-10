/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DataForge;

/**
 *
 * @author lenovo
 */
public class CError {
    int contador = 0;
    String error;
    String tipo;
    int linea = 0;
    int columna = 0;

    public CError(int contador, String error, String tipo, int linea, int columna) {
        this.contador = contador;
        this.error = error;
        this.tipo = tipo;
        this.linea = linea;
        this.columna = columna;
    }
    
    
    
}
