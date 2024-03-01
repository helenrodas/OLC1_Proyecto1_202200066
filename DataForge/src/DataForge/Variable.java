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
public class Variable {

    public static ArrayList<ModelVar> listaVariables = new ArrayList<>();

    public void addVar(String nombreVar, String tipoVar, String valorVar) {
        listaVariables.add(new ModelVar(nombreVar, tipoVar, valorVar));
    }
}
