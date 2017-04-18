/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package application;



public class verificacion

{
    
    public boolean validarTexto(String texto){
        int contador=0;
        boolean bandera=false;
        for(int i=0;i<texto.length();i++){
         if(letras(texto.charAt(i))){
          contador++;
         }
        }
        if(contador==texto.length()){
            bandera=true;
        }else{
            bandera=false;
        }
        return bandera;
    }
    public boolean validarTextoyNumeros(String texto){
        int contador=0;
        boolean bandera=false;
        for(int i=0;i<texto.length();i++){
         if(letras(texto.charAt(i)) || numeros(texto.charAt(i))){
          contador++;
         }
        }
        if(contador==texto.length()){
            bandera=true;
        }else{
            bandera=false;
        }
        return bandera;
    }
    public boolean letras(char caracter){
        boolean bandera=false;
        if(' '==caracter || ' '==caracter){bandera=true;}
        if('a'==caracter || 'A'==caracter){bandera=true;}
        if('b'==caracter || 'B'==caracter){bandera=true;}
        if('c'==caracter || 'C'==caracter){bandera=true;}
        if('d'==caracter || 'D'==caracter){bandera=true;}
        if('e'==caracter || 'E'==caracter){bandera=true;}
        if('f'==caracter || 'F'==caracter){bandera=true;}
        if('g'==caracter || 'G'==caracter){bandera=true;}
        if('h'==caracter || 'H'==caracter){bandera=true;}
        if('i'==caracter || 'I'==caracter){bandera=true;}
        if('j'==caracter || 'J'==caracter){bandera=true;}
        if('k'==caracter || 'K'==caracter){bandera=true;}
        if('l'==caracter || 'L'==caracter){bandera=true;}
        if('m'==caracter || 'M'==caracter){bandera=true;}
        if('n'==caracter || 'N'==caracter){bandera=true;}
        if('o'==caracter || 'O'==caracter){bandera=true;}
        if('p'==caracter || 'P'==caracter){bandera=true;}
        if('q'==caracter || 'Q'==caracter){bandera=true;}
        if('r'==caracter || 'R'==caracter){bandera=true;}
        if('s'==caracter || 'S'==caracter){bandera=true;}
        if('t'==caracter || 'T'==caracter){bandera=true;}
        if('u'==caracter || 'U'==caracter){bandera=true;}
        if('v'==caracter || 'V'==caracter){bandera=true;}
        if('w'==caracter || 'W'==caracter){bandera=true;}
        if('x'==caracter || 'X'==caracter){bandera=true;}
        if('y'==caracter || 'Y'==caracter){bandera=true;}
        if('z'==caracter || 'Z'==caracter){bandera=true;}
        return bandera;
    }
       public boolean numeros(char caracter){
        boolean bandera=false;
        if('0'==caracter){bandera=true;}
        if('1'==caracter){bandera=true;}
        if('2'==caracter){bandera=true;}
        if('3'==caracter){bandera=true;}
        if('4'==caracter){bandera=true;}
        if('5'==caracter){bandera=true;}
        if('6'==caracter){bandera=true;}
        if('7'==caracter){bandera=true;}
        if('8'==caracter){bandera=true;}
        if('9'==caracter){bandera=true;}
        return bandera;
    }
    public boolean validarNumero(String texto){
        boolean res=true;
        try{
            Integer.parseInt(texto);
        }catch(NumberFormatException e){
            res=false;
        }
        return res;
    }
    
     
        
}
