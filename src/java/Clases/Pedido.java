/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author bocal
 */
public class Pedido {
    int id_ped,id_usu;
    String fecha_ped,status_ped;
    float tot_ped;

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
