package Clases;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import javax.crypto.*;
import java.util.*;
import javax.crypto.spec.SecretKeySpec;
import static org.apache.commons.codec.binary.Base64.decodeBase64;
import static org.apache.commons.codec.binary.Base64.encodeBase64;
import java.util.ArrayList;

/**
 *
 * @author manua
 */
public class cifrar {
    
    public Usuario AESCifrar(String nombre, String apellidoPat, String apellidoMat, String tel){
    
        Usuario usuario = new Usuario();
        
        String llaveS = "AxolosoftwareWin";
        
        SecretKeySpec key = new SecretKeySpec(llaveS.getBytes(), "AES");
        
        System.out.println("Llave: "+key);
        
        Cipher cifrado;
        
        try{
        
            System.out.println("Verificamos el llenado de datos");
            System.out.println(nombre);
            System.out.println(apellidoPat);
            System.out.println(apellidoMat);
            System.out.println(tel);
            System.out.println("***********************************");
            
            cifrado = Cipher.getInstance("AES");
            
            cifrado.init(Cipher.ENCRYPT_MODE,key);
            
            /*Declaracion de los bytes para cada campo*/
            byte campoNombre[] = cifrado.doFinal(nombre.getBytes());
            byte campoApellidoPat[] = cifrado.doFinal(apellidoPat.getBytes());
            byte campoApellidoMat[] = cifrado.doFinal(apellidoMat.getBytes());
            byte campoTel[] = cifrado.doFinal(tel.getBytes());
            
            
            /* Recuperacion mediante BASE64 para la legibilidad */
            String nombreB64 = new String(encodeBase64(campoNombre));
            String apellidoPatB64 = new String(encodeBase64(campoApellidoPat));
            String apellidoMatB64 = new String(encodeBase64(campoApellidoMat));
            String telB64 = new String(encodeBase64(campoTel));
            
            
            /*Comprobación de los datos cifrados*/
            System.out.println("Esto pertenece a la clase cifrado");
            System.out.println("Nombre: "+nombreB64);
            System.out.println("Apellido Paterno: "+apellidoPatB64);
            System.out.println("Apellido Materno: " + apellidoMatB64);
            System.out.println("Telefono: "+ telB64);
            
            usuario.setNom_usu(nombreB64);
            usuario.setAppat_usu(apellidoPatB64);
            usuario.setApmat_usu(apellidoMatB64);
            usuario.setTel_usu(telB64);
            
            
        }catch(Exception e){
        
            System.out.println("Error, murió la cosa esta UnU");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
        
        return usuario;
    }
    
    public Usuario AESDescifrar(String nombre, String apellidoPat,
            String apellidoMat, String tel){
    
        Usuario u = new Usuario();
        String llaveS = "AxolosoftwareWin";
        
        SecretKeySpec key = new SecretKeySpec(llaveS.getBytes(), "AES");
        
        Cipher cifrado;
        
        try{
            
            cifrado = Cipher.getInstance("AES");
            System.out.println("Creado cifrado con AES");
            cifrado.init(Cipher.DECRYPT_MODE, key);
            System.out.println("Iniciamos cifrado en modo decrypt");
            
            /*Recuperamos primero con BASE64*/
            byte nomB[] = decodeBase64(nombre);
            byte appatB[] = decodeBase64(apellidoPat);
            byte apmatB[] = decodeBase64(apellidoMat);
            byte telB[] = decodeBase64(tel);
            
            byte nombreD[] = cifrado.doFinal(nomB);
            byte apellidoPatD[] = cifrado.doFinal(appatB);
            byte apellidoMatD[] = cifrado.doFinal(apmatB);
            byte telD[] = cifrado.doFinal(telB);
            
            String nombreRec = new String(nombreD);
            String apellidoPatRec = new String(apellidoPatD);
            String apellidoMatRec = new String(apellidoMatD);
            String telRec = new String(telD);
            
            u.setNom_usu(nombreRec);
            u.setAppat_usu(apellidoPatRec);
            u.setApmat_usu(apellidoMatRec);
            u.setTel_usu(telRec);
            
        }catch(Exception e){
        
            System.out.println("Fallo en el descifrado");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        
        }
        
        
        return u;
    }
    
    
    
    
    
}
