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

    
//    public static void main(String[] args) {
//        FrmPrincipal inicio = new FrmPrincipal();
//        inicio.setTitle("Data-Forge");
//        inicio.setDefaultCloseOperation(FrmPrincipal.EXIT_ON_CLOSE);
//        inicio.setLocationRelativeTo(null);
//        inicio.setVisible(true);
//        String ruta = "P:/Programacion/PracticasJava/QuintoSemestre/Compiladores1/Proyecto1/DataForge/src/DataForge/Lexer.flex";
//        generarLexer(ruta);
//        //C:/Users/lenovo/Downloads/AnalizadorLexico/AnalizadorLexico/src/codigo/Lexer.flex
//        //P:\Programacion/PracticasJava/QuintoSemestre/Compiladores1/Proyecto1/DataForge/src/codigo/Lexer.flex
//        //P:\Programacion\PracticasJava\QuintoSemestre\Compiladores1\Proyecto1\DataForge\src\DataForge\Lexer.flex
//        
//    }
//    
//    public static void generarLexer(String ruta){
//        File archivo = new File(ruta);
//        JFlex.Main.generate(archivo);
//    }
    
}
