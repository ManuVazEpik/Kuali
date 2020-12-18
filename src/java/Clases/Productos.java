/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author bocal
 */
public class Productos {
    private String nombre, descripción;
    private int costo, id;
    private boolean dispon;

    public int getID(){
        return id;
    }
    public void setID(int id){
        this.id=id;
    }
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripción() {
        return descripción;
    }

    public void setDescripción(String descripción) {
        this.descripción = descripción;
    }

    public int getCosto() {
        return costo;
    }

    public void setCosto(int costo) {
        this.costo = costo;
    }

    public boolean isDispon() {
        return dispon;
    }

    public void setDispon(boolean dispon) {
        this.dispon = dispon;
    }
    
    public static int Guardar(Productos p){
        int estatus = -1;
        try{
            
            Connection con = conexion.getConexion();
            String q = "insert into d () values ()";
            PreparedStatement ps = con.prepareStatement(q);
            ps.executeUpdate();
            estatus=ps.executeUpdate();
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al guardar usuario");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return estatus;
    }
    public static int Actualizar(Productos p) throws SQLException{
        int estatus = 0;
        Connection con = conexion.getConexion();
        String sql = "";
        PreparedStatement ps = null;
        try{

            sql= "update tabla set a=? where id=?";
            ps = con.prepareStatement(sql);
            estatus += ps.executeUpdate();

        }catch(Exception ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }finally{
            ps.close();
            con.close();
        }
        return estatus;
    }
    public static int Eliminar(int id) throws SQLException{
        Connection con = null;
        PreparedStatement ps = null;
        String q=null;
        int estatus = 0;
        try{
            
            con = conexion.getConexion();
            q ="delete from tabla where id=?";
            ps = con.prepareStatement(q);
            ps.setInt(1, id);
            estatus += ps.executeUpdate();
        
        }catch (Exception ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }finally{
            ps.close();
            con.close();
        }
        return estatus;   
    }
    public static Productos getUsuarioById(int id){
        Productos p = new Productos();
        try{
            Connection con = conexion.getConexion();
            String sql = "Select * from a "
                    + "where id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                break;
            }
            
            con.close();
            
        }catch(Exception ed){
            System.out.println("error en get usuario by id");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        
        }
        return p;
    }
}
