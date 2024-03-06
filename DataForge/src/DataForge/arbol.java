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
    public String result;
    
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
        return "Se produjo un error semantico";
    }
    
    
    public void run (arbol raiz, ArrayList<CTablaSimb> TablaSim){
        for (arbol hijo : raiz.hijos ) {
            run(hijo,TablaSim);
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
            System.out.println("Si entre al if");
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
                raiz.result = String.valueOf(Double.parseDouble(raiz.hijos.get(2).result) + Double.parseDouble(raiz.hijos.get(4).result));
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
//            Aqui voy a meter mi token a la tabla, ya las cosas concatenadas
        }else if(raiz.etiqueta == "LISTA_DATOS" && raiz.hijos.size()==3){
            raiz.result = raiz.hijos.get(0).result + raiz.hijos.get(1).etiqueta + raiz.hijos.get(2).result;
        }else if(raiz.etiqueta == "LISTA_DATOS" && raiz.hijos.size()==1){
            raiz.result = raiz.hijos.get(0).result;
        }
        
    }
    
}
