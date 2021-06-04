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
import java.util.ArrayList;

/**
 *
 * @author bocal
 */
public class DetallePedido {
    int id_detPed,id_ped,id_prod,cant_detPed;
    double sub_detPed;

    public ArrayList<DetallePedido> getDetallePedidoCaf(int id_ped) throws SQLException{
        ArrayList<DetallePedido> dpedidos = new ArrayList<>();
        Connection con = conexion.getConexion();
        PreparedStatement ps=null;
        ResultSet rs=null;
        try{
            
            String sql = "select * from dpedido, mproducto where id_ped=? and dpedido.id_prod=mproducto.id_prod";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id_ped);
            rs = ps.executeQuery();
            
            while(rs.next()){
                DetallePedido dp = new DetallePedido();
                dp.setId_detPed(rs.getInt(1));
                dp.setId_ped(rs.getInt(2));
                dp.setId_prod(rs.getInt(3));
                dp.setCant_detPed(rs.getInt(4));
                dp.setSub_detPed(rs.getDouble(5));
                dpedidos.add(dp);
            }
            
            con.close();
            
        }catch(Exception ed){
            System.out.println("error en get usuario by id");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        
        }finally{
            rs.close();
            ps.close();
            con.close();
        }
        
        return dpedidos;
    }
    
    public DetallePedido(){
    
    }
    public DetallePedido(int id, int cantidad, double subtotal) {
        
        this.id_prod = id;
        this.cant_detPed = cantidad;
        this.sub_detPed = subtotal;
    }
    
    
    public int getId_detPed() {
        return id_detPed;
    }

    public void setId_detPed(int id_detPed) {
        this.id_detPed = id_detPed;
    }

    public int getId_ped() {
        return id_ped;
    }

    public void setId_ped(int id_ped) {
        this.id_ped = id_ped;
    }

    public int getId_prod() {
        return id_prod;
    }

    public void setId_prod(int id_prod) {
        this.id_prod = id_prod;
    }

    public int getCant_detPed() {
        return cant_detPed;
    }

    public void setCant_detPed(int cant_detPed) {
        this.cant_detPed = cant_detPed;
    }

    public double getSub_detPed() {
        return sub_detPed;
    }

    public void setSub_detPed(double sub_detPed) {
        this.sub_detPed = sub_detPed;
    }
    
    
    
}
