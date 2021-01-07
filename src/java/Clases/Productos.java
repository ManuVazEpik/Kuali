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
    private InputStream fot_prod;

    public InputStream getFot_prod(){
        return fot_prod;
    }
    
    public void setFot_prod(InputStream fot_prod){
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
            ps.setBlob(5, p.getFot_prod());
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

            sql= "update Producto set nom_prod=?, desc_prod=?, pre_prod=?,disp_prod=?,fot_prod=? where id_prod=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNom_prod());
            ps.setString(2, p.getDesc_prod());
            ps.setFloat(3, p.getPre_prod());
            ps.setBoolean(4,p.getDisp_prod());
            ps.setBlob(5, p.getFot_prod());
            ps.setInt(6, p.getId_prod());
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
    public void listarImg(int idP, HttpServletResponse response) throws IOException{
        Connection cn=null;
        PreparedStatement ps=null;
        ResultSet rs= null;
        InputStream inputstream=null;
        OutputStream outputstream=null;
        BufferedInputStream bufferedinputstream=null;
        BufferedOutputStream bufferedoutputstream=null;
        response.setContentType("image/*");
        try{
            outputstream=response.getOutputStream();
            cn=conexion.getConexion();
            String q="SELECT fot_prod FROM Producto where id_prod="+idP+"";
            ps=cn.prepareStatement(q);
            rs=ps.executeQuery();
            if(rs.next()){
                inputstream=rs.getBinaryStream(1);
            }
            bufferedinputstream=new BufferedInputStream(inputstream);
            bufferedoutputstream=new BufferedOutputStream(outputstream);
            int i=0;
            while((i=bufferedinputstream.read())!=-1){
                bufferedoutputstream.write(i);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            System.out.println("Error en listarImg");
        }finally{
            try{
                rs.close();
                ps.close();
                cn.close();
            }catch(SQLException ex){
                ex.getStackTrace();
                System.out.println(ex.getMessage());
            }
        }
    }
}
