/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DataForge;

import java.util.ArrayList;

/**
 *
 * @author lenovo
 */
public class arbol {
    public String etiqueta;
    public ArrayList<arbol> hijos;
    
    public arbol(String etiqueta){
        this.etiqueta = etiqueta;
        this.hijos=new ArrayList();
    }
    
    public void addHijo(arbol hijo){
        this.hijos.add(hijo);
    }
}
