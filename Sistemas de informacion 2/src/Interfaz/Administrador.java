/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaz;
import java.util.ArrayList;
/**
 *
 * @author Maurisio
 */
public class Administrador {

    
    public static ArrayList<Pais>lista;
    private static SecundarioAgregarP ventanaAgregar;
    
    //public static ArrayList<Pais>lista;
    public Administrador(){
            lista=new ArrayList<>();
            ventanaAgregar= new SecundarioAgregarP();
    
    }
    static void agregarPais(String a, String b, String c) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        lista.add(new Pais(a,b,c));
        
    }
    public void agregar(String nombre,String idioma,String codigo){
        lista.add(new Pais(nombre,idioma,codigo));
    }
    
    public int existe(String nombre){
        int res=-1;
      for(int i=0;i<lista.size();i++){
          if(lista.get(i).nombrePais.equals(nombre))res++;
      }  
        
    return res;
    }
    public void eliminarPais(String nombre){
        int indice=existe(nombre);
        if(indice>-1){
            lista.remove(indice);
       }
    }
    public void setNombre(String pais,String cambio){
        int aux=existe(pais);
        if(aux>-1){
            lista.get(aux).nombrePais=cambio;
        }
        
        
    }
    public void setCodPais(String pais,String codCambio){
        int aux=existe(pais);
        if(aux>-1){
            lista.get(aux).codigoPais=codCambio;
        }
    }
    public void setIdioma(String pais,String idiomaCambio){
        int aux=existe(pais);
        if(aux>-1){
            lista.get(aux).idioma=idiomaCambio;
        }
    }
    
}
