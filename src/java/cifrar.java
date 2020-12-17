/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import javax.crypto.*;
import java.util.*;
import javax.crypto.spec.SecretKeySpec;
import sun.misc.BASE64Encoder;
import java.util.ArrayList;

/**
 *
 * @author manua
 */
public class cifrar {
    
    ArrayList AESCifrar(String nombre, String apellido, String edad, String telefono){
    
        ArrayList usuario = new ArrayList();
        usuario.clear();
        String llaveS = "AxolosoftwareWin";
        
        SecretKeySpec key = new SecretKeySpec(llaveS.getBytes(), "AES");
        
        Cipher cifrado;
        
        try{
        
            System.out.println("Verificamos el llenado de datos");
            System.out.println(nombre);
            System.out.println(apellido);
            System.out.println(edad);
            System.out.println(telefono);
            System.out.println("***********************************");
            
            cifrado = Cipher.getInstance("AES");
            
            cifrado.init(Cipher.ENCRYPT_MODE,key);
            
            /*Declaracion de los bytes para cada campo*/
            byte campoNombre[] = cifrado.doFinal(nombre.getBytes());
            byte campoApellido[] = cifrado.doFinal(apellido.getBytes());
            byte campoEdad[] = cifrado.doFinal(edad.getBytes());
            byte campoTel[] = cifrado.doFinal(telefono.getBytes());
            
            /*Comprobación de los datos cifrados*/
            System.out.println("Esto pertenece a la clase cifrado");
            System.out.println("Nombre: "+campoNombre);
            System.out.println("Apellido: "+campoApellido);
            System.out.println("Edad: "+campoEdad);
            System.out.println("Telefono: "+campoTel);
            
            usuario.add(campoNombre);
            usuario.add(campoApellido);
            usuario.add(campoEdad);
            usuario.add(campoTel);
            
        }catch(Exception e){
        
            System.out.println("Error, murió la cosa esta UnU");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
        
        return usuario;
    }
    
    ArrayList AESDescifrar(String nombre, String apellido, String edad, String telefono){
    
        ArrayList u = new ArrayList();
        u.clear();
        String llaveS = "AxolosoftwareWin";
        
        SecretKeySpec key = new SecretKeySpec(llaveS.getBytes(), "AES");
        
        Cipher cifrado;
        
        try{
            
            System.out.println("Verificamos el llenado de datos");
            System.out.println(nombre);
            System.out.println(apellido);
            System.out.println(edad);
            System.out.println(telefono);
            System.out.println("***********************************");
            
            cifrado = Cipher.getInstance("AES");
            System.out.println("Creado cifrado con AES");
            cifrado.init(Cipher.DECRYPT_MODE, key);
            System.out.println("Iniciamos cifrado en modo decrypt");
            
            byte nombreCifrado[] = cifrado.doFinal(nombre.getBytes());
            byte apellidoCifrado[] = cifrado.doFinal(apellido.getBytes());
            byte edadCifrado[] = cifrado.doFinal(edad.getBytes());
            byte telefonoCifrado[] = cifrado.doFinal(telefono.getBytes());
            
            System.out.println("Verificamos que se descifró correctamente");
            System.out.println(nombreCifrado);
            System.out.println(apellidoCifrado);
            System.out.println(edadCifrado);
            System.out.println(telefonoCifrado);
            
            u.add(nombreCifrado);
            u.add(apellidoCifrado);
            u.add(edadCifrado);
            u.add(telefonoCifrado);
            
        }catch(Exception e){}
        
        
        return u;
    }
    
    /*Lo de canchas*/
    void DESCifrar(){
    
        String llaveS = "AxolosoftwareWin";
        
        
        
    }
    
    void DESDescifrar(){
    
        String llaveS = "AxolosoftwareWin";
        
    }
    
    
    
}
