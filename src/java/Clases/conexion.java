/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;
import java.sql.*;

/**
 *
 * @author manua
 */
public class conexion {
    
    public static Connection getConexion(){
    
        Connection con = null;
        String url, username, password;
        url = "jdbc:mysql://us-cdbr-east-02.cleardb.com:3306/heroku_ee6731467b41755";
        username = "b1a21eb7e99a4f";
        password = "3d06b788";
        
        try{
        
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,username,password);
            System.out.println("Se conectó uwu");
            
        }catch(Exception e){
            System.out.println("No se conectó unu");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        
        
        return con;
    }
    
    
    
}
