/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import javax.crypto.*;
import java.util.*;
import javax.crypto.spec.SecretKeySpec;
import sun.misc.BASE64Encoder;

/**
 *
 * @author manua
 */
public class cifrar {
    
    usuario AESCifrar(String nombre, String apellido, int edad, String telefono){
    
        usuario u = new usuario();
        String llaveS = "AxolosoftwareWin";
        
        SecretKeySpec key = new SecretKeySpec(llaveS.getBytes(), "AES");
        
        Cipher cifrado;
        
        
        
        return u;
    }
    
    usuario AESDescifrar(String nombre, String apellido, int edad, String telefono){
    
        usuario u = new usuario();
        String llaveS = "AxolosoftwareWin";
        
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
