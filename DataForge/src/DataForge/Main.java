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
    
    public static void main(String[] args) {
        FrmPrincipal inicio = new FrmPrincipal();
        inicio.setTitle("Data-Forge");
        inicio.setDefaultCloseOperation(FrmPrincipal.EXIT_ON_CLOSE);
        inicio.setLocationRelativeTo(null);
        inicio.setVisible(true);
        String ruta = "P:/Programacion/PracticasJava/QuintoSemestre/Compiladores1/Proyecto1/DataForge/src/DataForge/Lexer.flex";
        generarLexer(ruta);
        //C:/Users/lenovo/Downloads/AnalizadorLexico/AnalizadorLexico/src/codigo/Lexer.flex
        //P:\Programacion/PracticasJava/QuintoSemestre/Compiladores1/Proyecto1/DataForge/src/codigo/Lexer.flex
        //P:\Programacion\PracticasJava\QuintoSemestre\Compiladores1\Proyecto1\DataForge\src\DataForge\Lexer.flex
        
    }
    
    public static void generarLexer(String ruta){
        File archivo = new File(ruta);
        JFlex.Main.generate(archivo);
    }
    
    
    

  

    
}
