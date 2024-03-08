/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DataForge;

import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import javax.swing.JTextArea;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

/**
 *
 * @author lenovo
 */
public class arbol {
    public String etiqueta;
    public ArrayList<arbol> hijos;
    public String result;
    public Map<String,String> contGraph = new HashMap<>();

    
    public arbol(String etiqueta){
        this.etiqueta = etiqueta;
        this.hijos=new ArrayList();
    }
    
    public void addHijo(arbol hijo){
        this.hijos.add(hijo);
    }
    
    
    public void printArbol(arbol raiz){
        for (arbol hijo : raiz.hijos ) {
            printArbol(hijo);
        }
        System.out.println(raiz.etiqueta );
    }
    
    public String getValor(ArrayList<CTablaSimb>TablaSim,String nombre){
        for(CTablaSimb elemento : TablaSim){
            if(elemento.nombre.equals(nombre)){
                return elemento.valor;
            }
        }
        return "No se encontro valor";
    }
    
    public static double OpEstadistica(String operacion , String valores){
        String[] omitirComa = valores.split(",");
        double[] datos = new double[omitirComa.length];
        
        for(int i = 0; i< omitirComa.length; i++){
            datos[i] = Double.parseDouble(omitirComa[i]);
        }
        System.out.println(datos);
        
        switch (operacion) {
            case "media":
                double getMedia = 0;
                for (double cantidad:datos){
                    getMedia += cantidad;
                }
                double resultado = getMedia/datos.length;
                return resultado;
            case "mediana":
                // Ordena los datos
                Arrays.sort(datos);
                int n = datos.length;
                if (n % 2 != 0) {
                    // Si el número de datos es impar, la mediana es el dato del medio
                    return datos[n / 2];
                } else {
                    // Si el número de datos es par, la mediana es el promedio de los dos datos del medio
                    return (datos[n / 2 - 1] + datos[n / 2]) / 2.0;
                }
            case "moda":
                // Calcula la moda
                Map<Double, Integer> frecuencia = new HashMap<>();
                for (double dato : datos) {
                    frecuencia.put(dato, frecuencia.getOrDefault(dato, 0) + 1);
                }
                double moda = 0;
                int maxFrecuencia = 0;
                for (Map.Entry<Double, Integer> entry : frecuencia.entrySet()) {
                    if (entry.getValue() > maxFrecuencia) {
                        moda = entry.getKey();
                        maxFrecuencia = entry.getValue();
                    }
                }
                return moda;
            case "varianza":
                double media = OpEstadistica("media", valores);
                double sumaCuadradosDiferencias = 0;
                for (double dato : datos) {
                    sumaCuadradosDiferencias += Math.pow(dato - media, 2);
                }
                return sumaCuadradosDiferencias / datos.length;
            case "max":
                double max = Double.NEGATIVE_INFINITY;
                for (double dato : datos) {
                    if (dato > max) {
                        max = dato;
                    }
                }
                return max;
            case "min":
                double min = Double.POSITIVE_INFINITY;
                for (double dato : datos) {
                    if (dato < min) {
                        min = dato;
                    }
                }
                return min;
            default:
                System.out.println("Error en operacion aritmetica");
                throw new AssertionError();
        }
    }
    
    public String FormarColumna(String titulo, String datos){
        StringBuilder columna= new StringBuilder();
        columna.append("\n------------\n");
        columna.append((titulo)).append("\n");
        columna.append("------------\n");
        String[] arregloColumna = datos.split(",");
        for(String valor: arregloColumna){
            columna.append(valor).append("\n");
        }
        return columna.toString();
    }

    
    public static void tipoGrafica(String tipoGrafica, Map<String, String> contGraph) throws IOException {
        switch (tipoGrafica.toLowerCase()) {
            case "graphbar":
               generarGraficaBarra(contGraph);
                break;
            case "linea":
//                generarGraficaLinea(contGraph);
                break;
            case "graphpie":
//                System.out.println(contGraph.get("titulo"));
//                System.out.println(contGraph.get("ejeX"));
//                System.out.println(contGraph.get("ejeY"));
               generarGraficaPie(contGraph);
                break;
            case "histograma":
//                generarGraficaHistograma(contGraph);
                break;
            default:
                System.out.println("Tipo de grafica indefinido");
        }
    }
    
    public static void generarGraficaBarra(Map<String, String> contGraph) throws IOException {
        // Obtener datos relevantes del contGraph
        String titulo = contGraph.get("titulo");
        String ejesX = contGraph.get("ejeX");
        String[] valoresX = ejesX.split(",");
        String ejesY = contGraph.get("ejeY");
        String[] valoresY = ejesY.split(",");
        String tituloX = contGraph.get("tituloX");
        String tituloY = contGraph.get("tituloY");
        double[] valoresAsDoubleY = new double[valoresY.length];

        for (int i = 0; i < valoresY.length; i++) {
            valoresAsDoubleY[i]=Double.parseDouble(valoresY[i]);
        }
        // Crear un conjunto de datos para la gráfica de barras
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        for (int i = 0; i < valoresX.length; i++) {
           dataset.addValue(valoresAsDoubleY[i],tituloY,valoresX[i]);
        }

        // Crear la gráfica de barras
        JFreeChart chart = ChartFactory.createBarChart3D(
                titulo,     // Título de la gráfica
                tituloX,    // Título del eje X
                tituloY,    // Título del eje Y
                dataset,     // Datos
                PlotOrientation.VERTICAL,
                true,
                true,
                false
        );

        // Guardar la gráfica como una imagen JPG
                int width = 674;
                int height = 357;
                File barChart = new File("P:/Programacion/PracticasJava/QuintoSemestre/Compiladores1/Proyecto1/DataForge/graficas/" + "graficaBarras.png");
                //imgGraficas.addImagePath("C:/Users/Usuario/Desktop/img/" + fileName);
                ChartUtilities.saveChartAsPNG(barChart, chart, width, height);
    }
    
     public static void generarGraficaPie(Map<String, String> contGraph) throws IOException {
         String titulo = contGraph.get("titulo");
         String ejesX = contGraph.get("label");
         String[] valoresX = ejesX.split(",");
         String ejesY = contGraph.get("values");
        String[] valoresY = ejesY.split(",");

         
         double[] valoresAsDoubleY = new double[valoresY.length];

        for (int i = 0; i < valoresY.length; i++) {
            valoresAsDoubleY[i]=Double.parseDouble(valoresY[i]);
        }
        // Crear un conjunto de datos para la gráfica de pastel
        DefaultPieDataset dataset = new DefaultPieDataset();
        for (int i = 0; i < valoresX.length; i++) {
           dataset.setValue(valoresX[i], valoresAsDoubleY[i]);
        }

        // Crear la gráfica de pastel
        JFreeChart chart = ChartFactory.createPieChart(
                titulo,  // Título de la gráfica
                dataset
        );

        // Guardar la gráfica como una imagen PNG
        int width = 674;
        int height = 357;
        File pieChart = new File("P:/Programacion/PracticasJava/QuintoSemestre/Compiladores1/Proyecto1/DataForge/graficas/" + "graficaPie.png");
        ChartUtilities.saveChartAsPNG(pieChart, chart, width, height);
     }
    
    public void run (arbol raiz, ArrayList<CTablaSimb> TablaSim, JTextArea areaConsola) throws IOException{
        for (arbol hijo : raiz.hijos ) {
            run(hijo,TablaSim,areaConsola);
        }
        
        if(raiz.etiqueta == "D_VARIABLE"){
            System.out.println("Se encontro : "
            + raiz.hijos.get(0).etiqueta
            + " de tipo: " + raiz.hijos.get(2).etiqueta
            + " con el valor : " + raiz.hijos.get(6).result);
            
            CTablaSimb simbolo = new CTablaSimb(raiz.hijos.get(4).etiqueta,
            raiz.hijos.get(2).etiqueta, "Variable",raiz.hijos.get(6).result);
            TablaSim.add(simbolo);
        }else if(raiz.etiqueta == "TIPOEXPR" && raiz.hijos.size()==2){
            raiz.result = raiz.hijos.get(0).etiqueta + raiz.hijos.get(1).etiqueta;
        }else if(raiz.etiqueta == "TIPOEXPR" && raiz.hijos.size()==4){
            raiz.result = String.valueOf(this.OpEstadistica(raiz.hijos.get(0).etiqueta.toString().toLowerCase() , raiz.hijos.get(2).result));
        }else if(raiz.etiqueta == "TIPOEXPR" && raiz.hijos.size()==1){
            if (raiz.hijos.get(0).etiqueta.substring(0,1).equals("\"")){
                raiz.result = raiz.hijos.get(0).etiqueta;
            }else{
                try{
                    double var = Double.parseDouble(raiz.hijos.get(0).etiqueta);
                    raiz.result = raiz.hijos.get(0).etiqueta;
                }catch (Exception e){
                    String varAsString = this.getValor(TablaSim, raiz.hijos.get(0).etiqueta);
                    if (varAsString.equals("Se produjo un error semantico")){
                        System.out.println("Error!");
                    }else{
                        raiz.result = varAsString;
                    }
                }
            }
        }else if(raiz.etiqueta == "TIPOEXPR" && raiz.hijos.size()==6){
            //System.out.println(raiz.hijos.get(0).etiqueta+" " + raiz.hijos.get(2).result +" " +raiz.hijos.get(4).result);
            if(raiz.hijos.get(0).etiqueta.equalsIgnoreCase("sum")){
                raiz.result = String.valueOf(Double.parseDouble(raiz.hijos.get(2).result) + 
                        Double.parseDouble(raiz.hijos.get(4).result));
            }else if(raiz.hijos.get(0).etiqueta.equalsIgnoreCase("res")){
                raiz.result = String.valueOf(Double.parseDouble(raiz.hijos.get(2).result) - Double.parseDouble(raiz.hijos.get(4).result));
            }else if(raiz.hijos.get(0).etiqueta.equalsIgnoreCase("mul")){
                raiz.result = String.valueOf(Double.parseDouble(raiz.hijos.get(2).result) * Double.parseDouble(raiz.hijos.get(4).result));
            }else if(raiz.hijos.get(0).etiqueta.equalsIgnoreCase("div")){
                raiz.result = String.valueOf(Double.parseDouble(raiz.hijos.get(2).result) / Double.parseDouble(raiz.hijos.get(4).result));
            }else if(raiz.hijos.get(0).etiqueta.equalsIgnoreCase("mod")){
                raiz.result = String.valueOf(Double.parseDouble(raiz.hijos.get(2).result) % Double.parseDouble(raiz.hijos.get(4).result));
            }
        }else if(raiz.etiqueta == "D_ARREGLO"){
            System.out.println("Se encontro : "
            + raiz.hijos.get(0).etiqueta
            + " de tipo: " + raiz.hijos.get(2).etiqueta
            + " con nombre : " + raiz.hijos.get(4).etiqueta + raiz.hijos.get(5).etiqueta
            + " con contenido : " + raiz.hijos.get(8).result);
            
            CTablaSimb simbolo = new CTablaSimb(raiz.hijos.get(4).etiqueta + raiz.hijos.get(5).etiqueta,
            raiz.hijos.get(2).etiqueta, "Array",raiz.hijos.get(8).result);
            TablaSim.add(simbolo);

        }else if(raiz.etiqueta == "LISTA_DATOS" && raiz.hijos.size()==3){
            raiz.result = raiz.hijos.get(0).result + raiz.hijos.get(1).etiqueta + raiz.hijos.get(2).result;
//            System.out.println("estoy en lista datos hijos 3: " +raiz.result);
        }else if(raiz.etiqueta == "LISTA_DATOS" && raiz.hijos.size()==1){
            raiz.result = raiz.hijos.get(0).result;
//             System.out.println("estoy en lista datos hijos 1: " +raiz.result);
        }else if(raiz.etiqueta == "D_COMENTARIO"){ //imprimir en consola print/column

             
        }else if(raiz.etiqueta == "LISTA_COMENTARIO" && raiz.hijos.size()==5){  //es de tipo print
            raiz.result = raiz.hijos.get(2).result ;
            System.out.println("Se encontro la funcion : "
            + raiz.hijos.get(0).etiqueta
            + " contenido: " + raiz.hijos.get(2).result);
            areaConsola.append(raiz.hijos.get(2).result);
        }else if(raiz.etiqueta == "LISTA_COMENTARIO" && raiz.hijos.size()==7){ // es de tipo column
            raiz.result = raiz.hijos.get(4).result ;

            System.out.println("Se encontro la funcion : "
            + raiz.hijos.get(0).etiqueta
            + " con titulo: " + raiz.hijos.get(2).result
            + " con contenido: "+ raiz.hijos.get(4).result);
            String columna = FormarColumna(raiz.hijos.get(2).result,raiz.hijos.get(4).result);
            areaConsola.append(columna);
            
        }else if(raiz.etiqueta == "TIPOARRAY" && raiz.hijos.size()==1){
//             raiz.result = raiz.hijos.get(0).result;
             String valorVar = this.getValor(TablaSim, raiz.hijos.get(0).result);
                if (valorVar.equals("No se encontro valor")){
                    System.out.println("Error, valor no encontrado!");
                }else{
                    raiz.result = valorVar;
                }
             //System.out.println("tipoarray de 1 hijos"+raiz.hijos.get(0).result);
        }else if(raiz.etiqueta == "TIPOARRAY" && raiz.hijos.size()==3){
             raiz.result =  raiz.hijos.get(1).result ;
//             System.out.println("tipoarray de 3 hijos"+raiz.hijos.get(0).etiqueta + raiz.hijos.get(1).result + raiz.hijos.get(2).etiqueta);
        }else if(raiz.etiqueta == "EXPRE_EST" && raiz.hijos.size()==3){
            raiz.result = raiz.hijos.get(1).result;
        }else if(raiz.etiqueta == "EXPRE_EST" && raiz.hijos.size()==1){

             String valorVar = this.getValor(TablaSim, raiz.hijos.get(0).result);
                if (valorVar.equals("No se encontro valor")){
                    System.out.println("Error, valor no encontrado!");
                }else{
                    raiz.result = valorVar;
                }
        }else if(raiz.etiqueta == "D_GRAFICA"){
            System.out.println("Es una grafica de tipo: " 
            + raiz.hijos.get(0).etiqueta);
            tipoGrafica(raiz.hijos.get(0).etiqueta, contGraph);
        }else if(raiz.etiqueta=="CONTGRAPH" && raiz.hijos.size()==2){
            raiz.result =  raiz.hijos.get(1).result ;
        }else if(raiz.etiqueta=="CONTGRAPH" && raiz.hijos.size()==1){
            raiz.result =  raiz.hijos.get(0).result ;
        }else if(raiz.etiqueta.equals("ATRIBUTOS") && raiz.hijos.size()==3) {
            // Verificamos si el primer hijo es "titulo"
            //System.out.println(raiz.hijos.get(0).etiqueta);
            if (raiz.hijos.get(0).etiqueta.equalsIgnoreCase("titulo")) {
                // Si es "titulo", accedemos al tercer hijo para obtener el valor
                raiz.result = raiz.hijos.get(2).etiqueta;
                contGraph.put("titulo",raiz.hijos.get(2).etiqueta);
                System.out.println("El título es: " + raiz.result);
            }else if(raiz.hijos.get(0).etiqueta.equalsIgnoreCase("ejeX")){
                raiz.result = raiz.hijos.get(2).result;
                contGraph.put("ejeX",raiz.result);
                System.out.println("El eje x es: " + raiz.result);
            }else if(raiz.hijos.get(0).etiqueta.equalsIgnoreCase("ejeY")){
                raiz.result = raiz.hijos.get(2).result;
                contGraph.put("ejeY",raiz.result);
                System.out.println("El eje y es: " + raiz.result);
            }else if(raiz.hijos.get(0).etiqueta.equalsIgnoreCase("tituloX")){
                raiz.result = raiz.hijos.get(2).etiqueta;
                contGraph.put("tituloX",raiz.hijos.get(2).etiqueta);
                System.out.println("El titulo en x es: " + raiz.result);
            }else if(raiz.hijos.get(0).etiqueta.equalsIgnoreCase("tituloY")){
                raiz.result = raiz.hijos.get(2).etiqueta;
                contGraph.put("tituloY",raiz.hijos.get(2).etiqueta);
                System.out.println("El titulo en y es: " + raiz.result);
            }else if(raiz.hijos.get(0).etiqueta.equalsIgnoreCase("label")){
                raiz.result = raiz.hijos.get(2).result;
                contGraph.put("label",raiz.result);
                System.out.println("El label es: " + raiz.result);
            }else if(raiz.hijos.get(0).etiqueta.equalsIgnoreCase("values")){
                raiz.result = raiz.hijos.get(2).result;
                contGraph.put("values",raiz.result);
                System.out.println("values es: " + raiz.result);
            }
        }
            
    }
}
