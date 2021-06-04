/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author bocal
 */
public class Minuto {
    int id_minuto;
    String minuto;

    public ArrayList<Minuto> getMinutos(){
        ArrayList<Minuto> minutos = new ArrayList<>();
        try{
            Connection con = conexion.getConexion();
            String sql = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            sql="select * from cminuto";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Minuto m = new Minuto();
                    m.setId_minuto(rs.getInt(1));
                    m.setMinuto(rs.getString(2));
                    
                minutos.add(m);
            }            
            con.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return minutos;
    }
    
    public Minuto getMinutoById(int id){
        Minuto m = new Minuto();
        try{
            Connection con = conexion.getConexion();
            String sql = "Select * from cminuto where id_minuto = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                m.setId_minuto(rs.getInt(1));
                m.setMinuto(rs.getString(2)); 
                break;
            }
            ps.close();
            con.close();
            
        }catch(Exception ed){
            System.out.println("error en get cafeteria by id");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return m;
    }
    
    public int getId_minuto() {
        return id_minuto;
    }

    public void setId_minuto(int id_minuto) {
        this.id_minuto = id_minuto;
    }

    public String getMinuto() {
        return minuto;
    }

    public void setMinuto(String minuto) {
        this.minuto = minuto;
    }
    
    
}
