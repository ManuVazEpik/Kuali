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
public class Queja {
    int id_que, status_que, satisfaccion, id_usu;
    String nom_que, email_que, tel_que, queja;

    
    public static int RegistrarQueja(Queja q) throws SQLException{
        int estatus = -1;
        try{
            Connection con = conexion.getConexion();
            
            String sq1="insert into queja (nom_que,email_que,tel_que,queja,status_que,satisfaccion) values (?,?,?,?,?,?)";
            PreparedStatement ps1 = con.prepareStatement(sq1);
            ps1.setString(1, q.getNom_que());
            ps1.setString(2, q.getEmail_que());
            ps1.setString(3, q.getTel_que());
            ps1.setString(4, q.getQueja());
            ps1.setInt(5, 3);
            ps1.setInt(6, q.getSatisfaccion());
            estatus=ps1.executeUpdate();
            System.out.println(estatus);
            con.close();
        }catch(Exception ed){
            System.out.println("Error al guardar usuario");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return estatus;

    }
    
    public static int ConcluirQueja(int id) throws SQLException{
        int estatus = -1;
        try{
            Connection con = conexion.getConexion();
            
            String sq1="update queja set status_que=? where id_que=?";
            PreparedStatement ps1 = con.prepareStatement(sq1);
            ps1.setInt(1, 1);
            ps1.setInt(2, id);
            estatus=ps1.executeUpdate();
            con.close();
        }catch(Exception ed){
            System.out.println("Error al guardar usuario");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return estatus;

    }
    
     public ArrayList<Queja> getQuejas(){
        ArrayList<Queja> lista = new ArrayList<>();
        cifrar cifra = new cifrar();
        try{
            Connection con = conexion.getConexion();
            String sql = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            sql="select * from queja where status_que=3";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Queja q = new Queja();
                    q.setId_que(rs.getInt(1));
                    q.setNom_que(rs.getString(2));
                    q.setEmail_que(rs.getString(3));
                    q.setTel_que(rs.getString(4));
                    q.setQueja(rs.getString(5));
                    q.setStatus_que(rs.getInt(6));
                    q.setSatisfaccion(rs.getInt(7));
                lista.add(q);
            }            
            con.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return lista;
    }
    public int getId_que() {
        return id_que;
    }

    public void setId_que(int id_que) {
        this.id_que = id_que;
    }

    public int getStatus_que() {
        return status_que;
    }

    public void setStatus_que(int status_que) {
        this.status_que = status_que;
    }

    public int getSatisfaccion() {
        return satisfaccion;
    }

    public void setSatisfaccion(int satisfaccion) {
        this.satisfaccion = satisfaccion;
    }

    public int getId_usu() {
        return id_usu;
    }

    public void setId_usu(int id_usu) {
        this.id_usu = id_usu;
    }

    public String getNom_que() {
        return nom_que;
    }

    public void setNom_que(String nom_que) {
        this.nom_que = nom_que;
    }

    public String getEmail_que() {
        return email_que;
    }

    public void setEmail_que(String email_que) {
        this.email_que = email_que;
    }

    public String getTel_que() {
        return tel_que;
    }

    public void setTel_que(String tel_que) {
        this.tel_que = tel_que;
    }

    public String getQueja() {
        return queja;
    }

    public void setQueja(String queja) {
        this.queja = queja;
    }

    
    
}
