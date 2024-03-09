/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DataForge;

/**
 *
 * @author lenovo
 */
public class CToken {
     int contador = 0;
    String token;
    String tipo;
    int linea = 0;
    int columna = 0;

    public CToken(int contador,String token, String tipo , int linea, int columna) {
        this.contador = contador;
        this.token = token;
        this.tipo = tipo;
        this.linea = linea;
        this.columna = columna;
    }
}
