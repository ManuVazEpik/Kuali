
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author manua
 */
public class usuario {
    
    private int idU;
    private String nombre;
    private String apellido;
    private String edad;
    private int permiso;
    private String telefono;
    
    public boolean guardarPersona(String nombre, String apellido, String edad, String telefono) throws SQLException{
    
        Connection con = conexion.getConexion();
        PreparedStatement ps = null;
        String sql = "Insert into datos(nombre, apellido, edad, telefono) values(?,?,?,?)";
        boolean check = false;
        
        try {
            
            ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setString(3, edad);
            ps.setString(4, telefono);
            ps.executeUpdate();
            check = true;
            
            con.close();
            ps.close();
            
            
        } catch (Exception e) {
            
            System.out.println("Error " + e);
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            con.close();
            ps.close();
            
        }
        
        return check;
    }

    public int getIdU() {
        return idU;
    }

    public void setIdU(int idU) {
        this.idU = idU;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEdad() {
        return edad;
    }

    public void setEdad(String edad) {
        this.edad = edad;
    }

    public int getPermiso() {
        return permiso;
    }

    public void setPermiso(int permiso) {
        this.permiso = permiso;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    
    
}
