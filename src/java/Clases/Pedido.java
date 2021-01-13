/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.*;
import java.util.ArrayList;


/**
 *
 * @author bocal
 */
public class Pedido {
    int id_ped,id_usu;
    String fecha_ped,status_ped;
    float tot_ped;
    
    private int ultimoCodigoInsertado(Connection cn){
        int codigo = 0;
        PreparedStatement pr = null;
        ResultSet rs = null;
        
        try{
            String q = "select MAX(id_ped) as codigo from Pedido";
            pr = cn.prepareStatement(q);
            rs = pr.executeQuery();
            
            while(rs.next()){
                codigo= rs.getInt("codigo");
                break;
            }
            
        }catch(SQLException ex){
            ex.printStackTrace();
         
        }finally{
            try{
                rs.close();
                pr.close();
                cn.close();
                
            }catch(SQLException ex){
                ex.printStackTrace();
                System.out.println(ex.getMessage());
            }
        }
        return codigo;
    }
    
    public boolean registrarPedido(Pedido p, ArrayList<DetallePedido> ldp) throws ClassNotFoundException, SQLException{
        
        boolean registro= false;
        Connection cn= null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        
        try{
            cn = conexion.getConexion();
            String q = "insert into pedido(fecha_ped, id_usu, tot_ped, status)"
                    + "values (?, ?, ?, ?)";
            pr = cn.prepareStatement(q);
            pr.setString(1, p.getFecha_ped());
            pr.setInt(2, p.getId_usu());
            pr.setFloat(3, p.getTot_ped());
            pr.setString(4, "pendiente");
            
            if (pr.executeUpdate() == 1) {
                int codigo = this.ultimoCodigoInsertado(cn);
                registro = this.registrarDetalleVenta(codigo, ldp, cn);
                
            }else{
                registro = false;
            }
            
        }catch(SQLException ex){
            ex.printStackTrace();
            registro = false;
            
        }finally{
            try{
                pr.close();
                cn.close();
                
            }catch(SQLException ex){
                ex.printStackTrace();
                System.out.println(ex.getMessage());
            }
        }
        
        return registro;
        
    }
    
    private boolean registrarDetalleVenta(int codigo, ArrayList<DetallePedido> ldp, Connection cn) throws SQLException{
        boolean registro = false;
        PreparedStatement pr= null;
        
        try{
            for (DetallePedido dp : ldp) {
                String q = "insert into DetallePedido (id_ped, id_prod, cant_detPed, sub_detPed) values (?, ?, ?, ?)";
                pr = cn.prepareStatement(q);
                pr.setInt(1, codigo);
                pr.setInt(3, dp.getId_prod());
                pr.setInt(4, dp.getCant_detPed());
                pr.setFloat(5, dp.getSub_detPed());
                
                if (pr.executeUpdate() == 1) {
                    
                    registro = true;
                    
                }else{
                    
                    registro = false;
                    
                }

            }
        }catch(SQLException ex){
            ex.printStackTrace();
            registro = false;
            
        }finally{
            try{
                pr.close();
                cn.close();
                
            }catch(SQLException ex){
                ex.printStackTrace();
                System.out.println(ex.getMessage());
            }
        }
        return registro;
    }

    public Pedido(int id_usu, String fecha_ped, float tot_ped) {
        this.id_usu = id_usu;
        this.fecha_ped = fecha_ped;
        this.tot_ped = tot_ped;
    }

    public int getId_ped() {
        return id_ped;
    }

    public void setId_ped(int id_ped) {
        this.id_ped = id_ped;
    }

    public int getId_usu() {
        return id_usu;
    }

    public void setId_usu(int id_usu) {
        this.id_usu = id_usu;
    }

    public String getFecha_ped() {
        return fecha_ped;
    }

    public void setFecha_ped(String fecha_ped) {
        this.fecha_ped = fecha_ped;
    }

    public String getStatus_ped() {
        return status_ped;
    }

    public void setStatus_ped(String status_ped) {
        this.status_ped = status_ped;
    }

    public float getTot_ped() {
        return tot_ped;
    }

    public void setTot_ped(float tot_ped) {
        this.tot_ped = tot_ped;
    }
    
}
