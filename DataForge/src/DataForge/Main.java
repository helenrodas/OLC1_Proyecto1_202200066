/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package DataForge;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author lenovo
 */
public class Main {
    
    public static void main(String[] args){
        String ruta = "./src/DataForge/";
        //generadorAnalizador(ruta, rutas);
        generadorAnalizador();
    }
    
    private static void generadorAnalizador(){
        
        try {
            
            /*File archivo = new File(ruta+"Lexer.flex");
            JFlex.Main.generate(archivo);
            java_cup.Main.main(rutas);*/
            
            String ruta = "src/DataForge/";
            String[] opcionesJFlex = {ruta+"LexerCup.flex", "-d", ruta};
            jflex.Main.generate(opcionesJFlex);
            
            String[] opcionesCup = {"-destdir", ruta, "-parser", "Parser", ruta+"Sintax.cup"};
            java_cup.Main.main(opcionesCup);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    
}
