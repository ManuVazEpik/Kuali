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
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bocal
 */
public class Cuentas {
    private int idC, permisos,ex;
    private String nombre, appat, apmat, colonia, correo, contrasena, calle, nomLocal, tel;
    private InputStream foto;
    
    public InputStream getFoto() {
        return foto;
    }

    public void setFoto(InputStream foto) {
        this.foto = foto;
    }
    
    public int getIdC() {
        return idC;
    }

    public void setIdC(int idC) {
        this.idC = idC;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public int getPermisos() {
        return permisos;
    }

    public void setPermisos(int permisos) {
        this.permisos = permisos;
    }

    public int getEx() {
        return ex;
    }

    public void setEx(int ex) {
        this.ex = ex;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAppat() {
        return appat;
    }

    public void setAppat(String appat) {
        this.appat = appat;
    }

    public String getApmat() {
        return apmat;
    }

    public void setApmat(String apmat) {
        this.apmat = apmat;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getNomLocal() {
        return nomLocal;
    }

    public void setNomLocal(String nomLocal) {
        this.nomLocal = nomLocal;
    }
    
    public int Guardar(Cuentas c){
        int estatus = -1;
        try{
            
            Connection con = conexion.getConexion();
            String q1="insert into cuenta (email_usu,pass_usu,perm_usu) values (?,?,?)";
            PreparedStatement ps1 = con.prepareStatement(q1);
            ps1.setString(1, c.getCorreo());
            ps1.setString(2, c.getContrasena());
            ps1.setInt(3, c.getPermisos());
            int est=ps1.executeUpdate();
            System.out.println(est);
            
            String sql = "select * from cuenta where email_usu = '"+c.getCorreo()+"' and pass_usu = '"+c.getContrasena()+"'";
            PreparedStatement ps2 = con.prepareStatement(sql);
            ResultSet rs = ps2.executeQuery();
            
            int idC=0;
            if(rs.next()){
                idC=rs.getInt(1);
            }
            System.out.println("id obtenida"+idC);
            if (c.getPermisos()==2) {
                String q = "insert into usuario (id_usu, id_cue, nom_usu, appat_usu, appmat_usu, tel_usu) values (?,?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(q);
                ps.setInt(1, idC);
                ps.setInt(2, idC);
                ps.setString(3, c.getNombre());
                ps.setString(4, c.getAppat());
                ps.setString(5, c.getApmat());
                ps.setString(6, c.getTel());
                
                estatus=ps.executeUpdate();
            }else if(c.getPermisos()==3){
                String q = "insert into cafeteria (id_caf, id_cue, img_caf, nom_caf,calle_caf,col_caf,num_caf) values (?,?,?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(q);
                ps.setInt(1, idC);
                ps.setInt(2, idC);
                ps.setBlob(3, c.getFoto());
                ps.setString(4, c.getNomLocal());
                ps.setString(5, c.getCalle());
                ps.setString(6, c.getColonia());
                ps.setInt(7, c.getEx());
                estatus=ps.executeUpdate();
            }
            
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al guardar usuario");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return estatus;
    }
    public int Actualizar(Cuentas c) throws SQLException{
        int estatus = 0;
        Connection con = conexion.getConexion();
        String sql = "";
        PreparedStatement ps = null;
        try{
            if (c.getPermisos()==2) {
                sql= "update usuario set nom_usu=?, appat_usu=?, apmat_usu=?, tel_usu=? where id_usu=?";
                ps = con.prepareStatement(sql);
                ps.setString(1, c.getNombre());
                ps.setString(2, c.getAppat());
                ps.setString(3, c.getApmat());
                ps.setString(4, c.getTel());
                ps.setInt(5, c.getIdC());
                estatus += ps.executeUpdate();
            }else if(c.getPermisos()==3){
                sql= "update cafeteria set nom_caf=?, img_caf=?, calle_caf=?, col_caf=?, num_caf=? where id_caf=?";
                ps = con.prepareStatement(sql);
                ps.setString(1, c.getNomLocal());
                ps.setBlob(2, c.getFoto());
                ps.setString(3, c.getCalle());
                ps.setString(4, c.getColonia());
                ps.setInt(5, c.getEx());
                ps.setInt(6, c.getIdC());
                estatus += ps.executeUpdate();
            }
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
    public int Eliminar(int id, int permisos) throws SQLException{
        Connection con = null;
        PreparedStatement ps = null;
        String q=null;
        int estatus = 0;
        try{
            if (permisos==2) {
                con = conexion.getConexion();
                q ="delete from usuario where id_usu=?";
                ps = con.prepareStatement(q);
                ps.setInt(1, id);
                estatus += ps.executeUpdate();
            }
            
        
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
    public Cuentas getUsuarioById(int id){
        Cuentas c = new Cuentas();
        try{
            Connection con = conexion.getConexion();
            String sql = "Select * from usuario,cuenta where usuario.id_cue=cuenta.id_cue and id_usu = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                c.setIdC(rs.getInt(1));
                c.setNombre(rs.getString(3));
                c.setAppat(rs.getString(4));
                c.setApmat(rs.getString(5));
                c.setTel(rs.getString(6));
                c.setCorreo(rs.getString(8));
                c.setContrasena(rs.getString(9));
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
    public Cuentas getCafeteriaById(int id){
        Cuentas c = new Cuentas();
        try{
            Connection con = conexion.getConexion();
            String sql = "Select * from cafeteria,cuenta where cafeteria.id_cue=cuenta.id_cue and id_caf = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                c.setIdC(rs.getInt(1));
                c.setFoto(rs.getBinaryStream(3));
                c.setNomLocal(rs.getString(4));
                c.setCalle(rs.getString(5));
                c.setColonia(rs.getString(6));
                c.setEx(rs.getInt(7));
                c.setCorreo(rs.getString(9));
                c.setContrasena(rs.getString(10));
                break;
            }
            
            con.close();
            
        }catch(Exception ed){
            System.out.println("error en get cafeteria by id");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        
        }
        return c;
    }
    public Cuentas encontrarUsuario(String correo, String contr) throws SQLException{
        Cuentas c = new Cuentas ();
            Connection con = conexion.getConexion();
            String sql="select * from cuenta where email_usu = '"+correo+"' and pass_usu = '"+contr+"'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                c.setIdC(rs.getInt(1));
                c.setCorreo(rs.getString(2));
                c.setContrasena(rs.getString(3));
                c.setPermisos(rs.getInt(4));
                break;
            }
    
        return c;
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
            String q="SELECT img_caf FROM cafeteria where id_caf="+idP+"";
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
