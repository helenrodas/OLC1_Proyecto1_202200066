/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DataForge;

/**
 *
 * @author lenovo
 */
public class ModelVar {
     private String nombreVar;
    private String tipoVar;
    private String valorVar;

    public ModelVar( String nombreVar,String tipoVar, String valorVar) {
        this.nombreVar = nombreVar;
        this.tipoVar = tipoVar;
        this.valorVar = valorVar;
    }

    public String getTipoVar() {
        return tipoVar;
    }

    public void setTipoVar(String tipoVar) {
        this.tipoVar = tipoVar;
    }

    public String getNombreVar() {
        return nombreVar;
    }

    public void setNombreVar(String nombreVar) {
        this.nombreVar = nombreVar;
    }

    public String getValorVar() {
        return valorVar;
    }

    public void setValorVar(String ValorVar) {
        this.valorVar = ValorVar;
    }
    
    
    
    
}
