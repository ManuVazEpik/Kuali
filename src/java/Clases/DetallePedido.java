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
public class DetallePedido {
    int id_detPed,id_ped,id_prod,cant_detPed;
    float sub_detPed;

    public DetallePedido(int id, int cantidad, float subtotal) {
        
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

    public float getSub_detPed() {
        return sub_detPed;
    }

    public void setSub_detPed(float sub_detPed) {
        this.sub_detPed = sub_detPed;
    }
    
    
    
}
