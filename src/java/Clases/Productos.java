/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletResponse;

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
    private String fot_prod;

    public String getFot_prod(){
        return fot_prod;
    }
    
    public void setFot_prod(String fot_prod){
        this.fot_prod=fot_prod;
    }
    
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

    public boolean getDisp_prod() {
        return disp_prod;
    }

    public void setDisp_prod(boolean disp_prod) {
        this.disp_prod = disp_prod;
    }

    public int Guardar(Productos p){
        int estatus = -1;
        try{
            
            Connection con = conexion.getConexion();
            String q = "insert into Producto (nom_prod,desc_prod,pre_prod,disp_prod,fot_prod,id_caf) values (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, p.getNom_prod());
            ps.setString(2, p.getDesc_prod());
            ps.setFloat(3, p.getPre_prod());
            ps.setBoolean(4,p.getDisp_prod());
            ps.setString(5, p.getFot_prod());
            ps.setInt(6,p.getId_caf());
            estatus=ps.executeUpdate();
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al guardar usuario");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return estatus;
    }
    public int Actualizar(Productos p) throws SQLException{
        int estatus = 0;
        Connection con = conexion.getConexion();
        String sql = "";
        PreparedStatement ps = null;
        try{

            sql= "update Producto set nom_prod=?, desc_prod=?, pre_prod=?, fot_prod=? where id_prod=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNom_prod());
            ps.setString(2, p.getDesc_prod());
            ps.setFloat(3, p.getPre_prod());
            ps.setString(4, p.getFot_prod());
            ps.setInt(5, p.getId_prod());
            estatus += ps.executeUpdate();
            System.out.println(p.getNom_prod());
            System.out.println(p.getDesc_prod());
            System.out.println(p.getPre_prod());
            System.out.println(p.getFot_prod());
            System.out.println(p.getId_prod());

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
    public int Eliminar(int id) throws SQLException{
        Connection con = null;
        PreparedStatement ps = null;
        String q=null;
        int estatus = 0;
        try{
            
            con = conexion.getConexion();
            q ="delete from Producto where id_prod=?";
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
    public Productos getProductoById(int id){
        Productos p = new Productos();
        try{
            Connection con = conexion.getConexion();
            String sql = "Select * from Producto where id_prod = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                p.setId_prod(rs.getInt(1));
                p.setNom_prod(rs.getString(2));
                p.setDesc_prod(rs.getString(3));
                p.setPre_prod(rs.getFloat(4));
                p.setDisp_prod(rs.getBoolean(5));
                p.setFot_prod(rs.getString(6));
                p.setId_caf(rs.getInt(7));
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
    public static ArrayList<Productos> getProductosCaf(int id){
        ArrayList<Productos> listap = new ArrayList<>();
        try{
            Connection con = conexion.getConexion();
            String sql = "Select * from Producto where id_caf = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Productos p = new Productos();
                p.setId_prod(rs.getInt(1));
                p.setNom_prod(rs.getString(2));
                p.setDesc_prod(rs.getString(3));
                p.setPre_prod(rs.getFloat(4));
                p.setDisp_prod(rs.getBoolean(5));
                p.setFot_prod(rs.getString(6));
                p.setId_caf(rs.getInt(7));
                listap.add(p);
            }
            
            con.close();
            
        }catch(Exception ed){
            System.out.println("error en get usuario by id");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        
        }
        return listap;
    }
}