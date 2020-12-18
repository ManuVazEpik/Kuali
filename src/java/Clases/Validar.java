/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author bocal
 */
import java.util.regex.Matcher;
import java.util.regex.Pattern;
public class Validar {
    public static boolean letrasEspacios(String var){
        boolean test= false;
        try{
            Pattern p = Pattern.compile("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+(\\s*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]*)*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+$");
            Matcher m = p.matcher(var);
            if(!m.find()){
                test=false;
            }else{
                test=true;
            }
        }catch(Exception e){
            System.out.println("Error en letras espacios");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        return test;
    }
    public static boolean letras(String var){ //letras espacios acentos y ñ
        boolean test=false;
        try{
            Pattern p = Pattern.compile("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1]*[a-zA-ZÀ-ÿ\\u00f1\\u00d1][a-zA-ZÀ-ÿ\\u00f1\\u00d1]+$");
            Matcher m = p.matcher(var);
            if(!m.find()){
                test=false;
            }else{
                test=true;
            }
        }catch(Exception e){
            System.out.println("Error en validacion1");
            System.out.println(e.getMessage());
        }
        return test;
    }
    public static boolean numerosEnteros(String var){ //numeros enteros
        boolean test=false;
        try{
            Pattern p = Pattern.compile("^[0-9]+$");
            Matcher m = p.matcher(var);
            if(!m.find()){
                test=false;
                System.out.println("se hace false");
            }else{
                test=true;
                System.out.println("se hace true");
            }
        }catch(Exception e){
            System.out.println("Error en validacion1");
            System.out.println(e.getMessage());
        }
        return test;
    }
    
    public static boolean direcciones(String var){
        boolean test= false;
        try{
            Pattern p = Pattern.compile("^[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1]+(\\s*[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1]*)*[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1]+$");
            Matcher m = p.matcher(var);
            if(!m.find()){
                test=false;
            }else{
                test=true;
            }
        }catch(Exception e){
            System.out.println("Error en letras espacios");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        return test;
    }
    
    public static boolean Contrasenas(String var){ //Fechas
        boolean test=false;
        try{
            Pattern p = Pattern.compile("^[a-zA-Z0-9]+$");
            Matcher m = p.matcher(var);
            if(!m.find()){
                test=false;
            }else{
                test=true;
            }
        }catch(Exception e){
            System.out.println("Error en validacion1");
            System.out.println(e.getMessage());
        }
        return test;
    }
    public static boolean Correo(String var){ //
        boolean test=false;
        try{
            Pattern p = Pattern.compile("^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$");
            Matcher m = p.matcher(var);
            if(!m.find()){
                test=false;
            }else{
                test=true;
            }
        }catch(Exception e){
            System.out.println("Error en validacion1");
            System.out.println(e.getMessage());
        }
        return test;
    }
    
    public static boolean numerosDecimales(String var){ //numros decimales
        boolean test=false;
        try{
            Pattern p = Pattern.compile("^[0-9]+([\\.][0-9]+)?$");
            Matcher m = p.matcher(var);
            if(!m.find()){
                test=false;
            }else{
                test=true;
            }
        }catch(Exception e){
            System.out.println("Error en validacion1");
            System.out.println(e.getMessage());
        }
        return test;
    }
    public static boolean direccionesURL(String var){ //direcciones url
        boolean test=false;
        try{
            Pattern p = Pattern.compile("/^https?:\\/\\/[\\w\\-]+(\\.[\\w\\-]+)+[/#?]?.*$/");
            Matcher m = p.matcher(var);
            if(!m.find()){
                test=false;
            }else{
                test=true;
            }
        }catch(Exception e){
            System.out.println("Error en validacion1");
            System.out.println(e.getMessage());
        }
        return test;
    }
    public static boolean letrasNumeros(String var){ //direcciones url
        boolean test=false;
        try{
            Pattern p = Pattern.compile("^[a-zA-Z0-9]");
            Matcher m = p.matcher(var);
            if(!m.find()){
                test=false;
            }else{
                test=true;
            }
        }catch(Exception e){
            System.out.println("Error en validacion1");
            System.out.println(e.getMessage());
        }
        return test;
    }
    public static boolean nombreApellidosTar(String var){ //nombre Tarjeta
        boolean test=false;
        try{
            Pattern p = Pattern.compile("^[A-Z]{3,20}");
            Matcher m = p.matcher(var);
            if(!m.find()){
                test=false;
            }else{
                test=true;
            }
        }catch(Exception e){
            System.out.println("Error en validacion1");
            System.out.println(e.getMessage());
        }
        return test;
    }
    public static boolean numeroTar(String var){ //numero de tarjeta
        boolean test=false;
        try{
            Pattern p = Pattern.compile("^[0-9]{16}");
            Matcher m = p.matcher(var);
            if(!m.find()){
                test=false;
            }else{
                test=true;
            }
        }catch(Exception e){
            System.out.println("Error en validacion1");
            System.out.println(e.getMessage());
        }
        return test;
    }
    public static boolean codigoTar(String var){ //codigo tarjeta
        boolean test=false;
        try{
            Pattern p = Pattern.compile("^[0-9]{3}");
            Matcher m = p.matcher(var);
            if(!m.find()){
                test=false;
            }else{
                test=true;
            }
        }catch(Exception e){
            System.out.println("Error en validacion1");
            System.out.println(e.getMessage());
        }
        return test;
    }
    public static boolean mesTarjeta(String var){ //mes
        boolean test=false;
        try{
            Pattern p = Pattern.compile("^(0[1-9]|1[0-2])$");
            Matcher m = p.matcher(var);
            if(!m.find()){
                test=false;
            }else{
                test=true;
            }
        }catch(Exception e){
            System.out.println("Error en validacion1");
            System.out.println(e.getMessage());
        }
        return test;
    }
    public static boolean anoTarjeta(String var){ //año de la tarjeta
        boolean test=false;
        try{
            Pattern p = Pattern.compile("^[0-9]{4}$");
            Matcher m = p.matcher(var);
            if(!m.find()){
                test=false;
            }else{
                test=true;
            }
        }catch(Exception e){
            System.out.println("Error en validacion1");
            System.out.println(e.getMessage());
        }
        return test;
    }
}
