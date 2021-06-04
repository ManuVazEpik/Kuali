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
public class Hora {
    int id_hora;
    String hora;

    public ArrayList<Hora> getHoras(){
        ArrayList<Hora> horas = new ArrayList<>();
        try{
            Connection con = conexion.getConexion();
            String sql = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            sql="select * from chora";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Hora h = new Hora();
                    h.setId_hora(rs.getInt(1));
                    h.setHora(rs.getString(2));
                    
                horas.add(h);
            }            
            con.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return horas;
    }
    
    public Hora getHoraById(int id){
        Hora h = new Hora();
        try{
            Connection con = conexion.getConexion();
            String sql = "Select * from chora where id_chora = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                h.setId_hora(rs.getInt(1));
                h.setHora(rs.getString(2)); 
                break;
            }
            ps.close();
            con.close();
            
        }catch(Exception ed){
            System.out.println("error en get cafeteria by id");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return h;
    }
    
    public int getId_hora() {
        return id_hora;
    }

    public void setId_hora(int id_hora) {
        this.id_hora = id_hora;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }
    
    
}
