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
    
    public static void main(String[] args) throws Exception {
        System.out.println (new File ("").getAbsolutePath ());
        String rutap = new File ("").getAbsolutePath ()+"/";
        String ruta1 = rutap +"src/DataForge/Lexer.flex";
        String ruta2 = rutap+"src/DataForge/LexerCup.flex";
        String[] rutaS = {"-parser", "Sintax", rutap+"src/DataForge/Sintax.cup"};
        generar(ruta1, ruta2, rutaS);
    }
    
    public static void generar(String ruta1, String ruta2, String[] rutaS) throws IOException, Exception{
        File archivo;
        archivo = new File(ruta1);
        JFlex.Main.generate(archivo);
        archivo = new File(ruta2);
        JFlex.Main.generate(archivo);
        java_cup.Main.main(rutaS);
        System.out.println (new File (".").getAbsolutePath ());
        String rutap = new File ("").getAbsolutePath ()+"/";
        Path rutaSym = Paths.get(rutap+"src/DataForge/sym.java");
        if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
        Files.move(
                Paths.get(rutap+"sym.java"), 
                Paths.get(rutap+"src/DataForge/sym.java")
        );
        Path rutaSin = Paths.get(rutap+"src/DataForge/Sintax.java");
        if (Files.exists(rutaSin)) {
            Files.delete(rutaSin);
        }
        Files.move(
                Paths.get(rutap+"Sintax.java"), 
                Paths.get(rutap+"src/DataForge/Sintax.java")
        );
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
