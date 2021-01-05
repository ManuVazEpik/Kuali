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
    private String nom_prod, desc_prod;
    private int id_prod;
    private float pre_prod;
    private int id_caf;
    private boolean disp_prod;

    public String getNom_prod() {
        return nom_prod;
    }

    public void setNom_prod(String nom_prod) {
        this.nom_prod = nom_prod;
    }

    public String getDesc_prod() {
        return desc_prod;
    }

    public void setDesc_prod(String desc_prod) {
        this.desc_prod = desc_prod;
    }

    public int getId_prod() {
        return id_prod;
    }

    public void setId_prod(int id_prod) {
        this.id_prod = id_prod;
    }

    public float getPre_prod() {
        return pre_prod;
    }

    public void setPre_prod(float pre_prod) {
        this.pre_prod = pre_prod;
    }

    public int getId_caf() {
        return id_caf;
    }

    public void setId_caf(int id_caf) {
        this.id_caf = id_caf;
    }

    public boolean isDisp_prod() {
        return disp_prod;
    }

    public void setDisp_prod(boolean disp_prod) {
        this.disp_prod = disp_prod;
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
