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
import Clases.cifrar;

/**
 *
 * @author bocal
 */
public class Usuario {
    private int id_usu;
    private int perm_usu;
    private String nom_usu;
    private String appat_usu;
    private String apmat_usu;
    private String email_usu;
    private String pass_usu;
    private String tel_usu;
    
    public int AñadirUsuario(Usuario c) throws SQLException{
        int estatus = -1;
        try{
            Connection con = conexion.getConexion();
            
            String q1="insert into usuario (nom_usu,appat_usu,apmat_usu,email_usu,pass_usu,tel_usu,perm_usu) values (?,?,?,?,?,?,?)";
            PreparedStatement ps1 = con.prepareStatement(q1);
            ps1.setString(1, c.getNom_usu());
            ps1.setString(2, c.getAppat_usu());
            ps1.setString(3, c.getApmat_usu());
            ps1.setString(4, c.getEmail_usu());
            ps1.setString(5, c.getPass_usu());
            ps1.setString(6, c.getTel_usu());
            ps1.setInt(7, 2);
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
    public int ActualizarUsuario(Usuario c) throws SQLException{
        int estatus = 0;
        Connection con = conexion.getConexion();
        String sql = "";
        PreparedStatement ps = null;
        try{
            sql= "update usuario set nom_usu=?, appat_usu=?, apmat_usu=?, tel_usu=? where id_usu=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getNom_usu());
            ps.setString(2, c.getAppat_usu());
            ps.setString(3, c.getApmat_usu());
            ps.setString(4, c.getTel_usu());
            ps.setInt(5, c.getId_usu());
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
    public int EliminarUsuario(int id) throws SQLException{
        Connection con = null;
        PreparedStatement ps = null;
        String q=null;
        int estatus = 0;
        try{
            
                con = conexion.getConexion();
                q ="delete from usuario where id_usu=?";
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
    public Usuario getUsuarioById(int id){
        Usuario c = new Usuario();
        cifrar cifra = new cifrar();
        try{
            Connection con = conexion.getConexion();
            String sql = "Select * from usuario where id_usu = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                c.setId_usu(rs.getInt(1));
                System.out.println(c.getId_usu());
                String nombre = rs.getString(2);
                String apPat = rs.getString(3);
                String apMat = rs.getString(4);
                String tel = rs.getString(7);
                c = cifra.AESDescifrar(nombre, apPat,
                        apMat, tel);
                c.setEmail_usu(rs.getString(5));
                c.setPass_usu(rs.getString(6));
                c.setPerm_usu(rs.getInt(8));
                break;
            }
            
            con.close();
            
        }catch(Exception ed){
            System.out.println("error en get usuario by id");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        
        }
        return c;
    }
    
    public Usuario encontrarUsuario(String correo, String contr) throws SQLException{
        Usuario c = new Usuario ();
            Connection con = conexion.getConexion();
            
            cifrar cifra = new cifrar();
            
            ArrayList<String> ul = cifra.verificarUsuario(correo, contr);
            
            String sql="select * from Usuario where email_usu = ? and pass_usu = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ul.get(1));
            ps.setString(2, ul.get(2));
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                c.setId_usu(rs.getInt(1));
                c.setEmail_usu(rs.getString(2));
                c.setPass_usu(rs.getString(3));
                c.setPerm_usu(rs.getInt(8));
                break;
            }
    
        return c;
    }
    
    public ArrayList<Usuario> getUsuarios(){
        ArrayList<Usuario> lista = new ArrayList<>();
        try{
            Connection con = conexion.getConexion();
            String sql = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            sql="select * from usuario where perm_usu=2";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Usuario c = new Usuario();
                    c.setId_usu(rs.getInt(1));
                    c.setNom_usu(rs.getString(2));
                    c.setAppat_usu(rs.getString(3));
                    c.setApmat_usu(rs.getString(4));
                    c.setEmail_usu(rs.getString(5));
                    c.setPass_usu(rs.getString(6));
                    c.setTel_usu(rs.getString(7));
                lista.add(c);
            }            
            con.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return lista;
    }
    
    public int AutorizarCafeteria(int id) throws SQLException{
        int estatus = 0;
        Connection con = conexion.getConexion();
        String sql = "";
        PreparedStatement ps = null;
        
        try{
                sql= "update cafeteria set aut_caf = '1' where id_caf = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, id);
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
    
    public int RechazarCafeteria(int id) throws SQLException{
        int estatus = 0;
        Connection con = conexion.getConexion();
        String sql = "";
        PreparedStatement ps = null;
        try{
                sql= "update cafeteria set aut_caf = '3' where id_caf = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, id);
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

    public int getId_usu() {
        return id_usu;
    }

    public void setId_usu(int id_usu) {
        this.id_usu = id_usu;
    }

    public int getPerm_usu() {
        return perm_usu;
    }

    public void setPerm_usu(int perm_usu) {
        this.perm_usu = perm_usu;
    }

    public String getNom_usu() {
        return nom_usu;
    }

    public void setNom_usu(String nom_usu) {
        this.nom_usu = nom_usu;
    }

    public String getEmail_usu() {
        return email_usu;
    }

    public void setEmail_usu(String email_usu) {
        this.email_usu = email_usu;
    }

    public String getPass_usu() {
        return pass_usu;
    }

    public void setPass_usu(String pass_usu) {
        this.pass_usu = pass_usu;
    }

    public String getTel_usu() {
        return tel_usu;
    }

    public void setTel_usu(String tel_usu) {
        this.tel_usu = tel_usu;
    }

    public Usuario() {
    }

    public String getAppat_usu() {
        return appat_usu;
    }

    public void setAppat_usu(String appat_usu) {
        this.appat_usu = appat_usu;
    }

    public String getApmat_usu() {
        return apmat_usu;
    }

    public void setApmat_usu(String apmat_usu) {
        this.apmat_usu = apmat_usu;
    }


}
