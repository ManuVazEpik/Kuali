/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 *
 * @author bocal
 */
public class Pedido {
    int id_ped,id_usu, id_hora, id_min, hora, status_ped, id_caf;
    String fecha_ped, min, nom_caf;

    public String getNom_caf() {
        return nom_caf;
    }

    public void setNom_caf(String nom_caf) {
        this.nom_caf = nom_caf;
    }
    double tot_ped;
    
    private int ultimoCodigoInsertado(Connection cn){
        int codigo = 0;
        PreparedStatement pr = null;
        ResultSet rs = null;
        
        try{
            String q = "select MAX(id_ped) as codigo from mPedido";
            pr = cn.prepareStatement(q);
            rs = pr.executeQuery();
            
            while(rs.next()){
                codigo= rs.getInt("codigo");
                break;
            }
            
        }catch(SQLException ex){
            ex.printStackTrace();
         
        }
        return codigo;
    }
    
    public boolean registrarPedido(Pedido p, ArrayList<DetallePedido> ldp) throws ClassNotFoundException, SQLException{
        
        boolean registro= false;
        Connection cn= null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        
        int id_h;
        
        if(p.getHora()==7){
            id_h=4;
        }else if(p.getHora()==8){
            id_h=14;
        }else if(p.getHora()==9){
            id_h=24;
        }else if(p.getHora()==10){
            id_h=34;
        }else if(p.getHora()==11){
            id_h=44;
        }else if(p.getHora()==12){
            id_h=54;
        }else if(p.getHora()==13){
            id_h=64;
        }else if(p.getHora()==14){
            id_h=74;
        }else if(p.getHora()==15){
            id_h=84;
        }else if(p.getHora()==16){
            id_h=94;
        }else if(p.getHora()==17){
            id_h=104;
        }else if(p.getHora()==18){
            id_h=114;
        }else if(p.getHora()==19){
            id_h=124;
        }else if(p.getHora()==20){
            id_h=134;
        }else{
            return registro;
        }
        
        int id_m;
        if("15".equals(p.getMin())){
            id_m=4;
        }else if("30".equals(p.getMin())){
            id_m=14;
        }else if("45".equals(p.getMin())){
            id_m=24;
        }else if("00".equals(p.getMin())){
            id_m=34;
        }else{
            return registro;
        }
        
        try{
            cn = conexion.getConexion();
            String q = "insert into mpedido(id_usu, id_chora, id_minuto, fecha_ped, status_ped, total_ped) "
                    + "values (?, ?, ?, ?, ?, ?)";
            pr = cn.prepareStatement(q);
            pr.setInt(1, p.getId_usu());
            pr.setInt(2, id_h);
            pr.setInt(3, id_m);
            pr.setString(4, p.getFecha_ped());
            pr.setInt(5, 24);
            pr.setDouble(6, p.getTot_ped());
            
            System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
            if (pr.executeUpdate() == 1) {
                System.out.println("bbbbbbbbbbbbbbb");
                int codigo = this.ultimoCodigoInsertado(cn);
                registro = this.registrarDetalleVenta(codigo, ldp, cn);
                
            }else{
                registro = false;
            }
            
        }catch(SQLException ex){
            ex.printStackTrace();
            registro = false;
            
        }
        return registro;
        
    }
    
    private boolean registrarDetalleVenta(int codigo, ArrayList<DetallePedido> ldp, Connection cn) throws SQLException{
        boolean registro = false;
        PreparedStatement pr= null;
        
        try{
            int status=0;
            for (DetallePedido dp : ldp) {
                String q = "insert into DPedido (id_ped, id_prod, cant_prod, sub_dped) values (?, ?, ?, ?)";
                pr = cn.prepareStatement(q);
                System.out.println("Codigo"+codigo);
                pr.setInt(1, codigo);
                pr.setInt(2, dp.getId_prod());
                pr.setInt(3, dp.getCant_detPed());
                pr.setDouble(4, dp.getSub_detPed());
                status = pr.executeUpdate();
            }
                if (status != 0) {
                    registro = true;
                }else{
                    registro = false;
                }

            
        }catch(SQLException ex){
            System.out.println("sssssssssss"+ex.getMessage());
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
    
    public static boolean comprobarCancelacion(int id_pedido){
        boolean comp=false;
        
        try{
            Connection con = conexion.getConexion();
            String sql="select * from mpedido where id_ped=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id_pedido);
            ResultSet rs = ps.executeQuery();
            Pedido p = new Pedido();
            if(rs.next()){
                p.setId_ped(rs.getInt(1));
                p.setId_usu(rs.getInt(2));
                p.setId_hora(rs.getInt(3));
                p.setId_min(rs.getInt(4));
                p.setFecha_ped(rs.getString(5));
                p.setStatus_ped(rs.getInt(6));
                p.setTot_ped(rs.getDouble(7));
            }
            
            String fecha=p.getFecha_ped();
            String año="", mes="", dia="";
            int contador=0;
            for(int i=0; i<fecha.length(); i++){
                char letra=fecha.charAt(i);
                
                if(contador<4){
                    año=año+letra;
                }else if(contador<7 && contador>4){
                    mes= mes+letra;
                }else if(contador>7 && contador<10){
                    dia=dia+letra;
                }
                contador++;
            }
            
            Date fechaactual = new Date();
            String strDateFormat = "yyyy-MM-dd";
            
            SimpleDateFormat sdf = new SimpleDateFormat(strDateFormat);
            
            String añoactual="", mesactual="", diaactual="";
            int contador2=0;
            String fechaact=sdf.format(fechaactual);
            for(int i=0; i<fechaact.length(); i++){
                char letra=fechaact.charAt(i);
                
                if(contador2<4){
                    añoactual=añoactual+letra;
                }else if(contador2<7 && contador2>4){
                    mesactual= mesactual+letra;
                }else if(contador2>7 && contador2<10){
                    diaactual=diaactual+letra;
                }
                contador2++;
            }
            
            Hora oh=new Hora();
            Minuto om=new Minuto();
            int horaactual=fechaactual.getHours();
            int minactual = fechaactual.getMinutes();
            
            
            if(Integer.parseInt(año)>=Integer.parseInt(añoactual) && Integer.parseInt(mes)>=Integer.parseInt(mesactual)){
                
                if(Integer.parseInt(mes)==Integer.parseInt(mesactual) && Integer.parseInt(dia)>=Integer.parseInt(diaactual)){
                    
                    if(Integer.parseInt(dia)==Integer.parseInt(diaactual)){
                        Hora h= oh.getHoraById(p.getId_hora());
                        Minuto m=om.getMinutoById(p.getId_min());

                        if(Integer.parseInt(h.getHora())<horaactual){
                            comp=true;
                        }else if(Integer.parseInt(h.getHora())==horaactual){
                            if(Integer.parseInt(m.getMinuto())+15>=minactual){
                                comp=false;
                            }else{
                                comp=true;
                            }
                        }
                    }else{
                        comp=true;
                    }
                }else if(Integer.parseInt(mes)>Integer.parseInt(mesactual)){
                    
                    if(Integer.parseInt(dia)==Integer.parseInt(diaactual)){
                        Hora h= oh.getHoraById(p.getId_hora());
                        Minuto m=om.getMinutoById(p.getId_min());

                        if(Integer.parseInt(h.getHora())<horaactual){
                            comp=true;
                        }else if(Integer.parseInt(h.getHora())==horaactual){
                            if(Integer.parseInt(m.getMinuto())+15>=minactual){
                                comp=false;
                            }else{
                                comp=true;
                            }
                        }
                    }else{
                        comp=true;
                    }
                }else{
                    comp = false;
                }
            }else{
                comp = false;
            }
        }catch(Exception e){
            System.out.println("Error comprobacion pedido");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        return comp;
    }

    public static boolean Cancelar(int id_pedido) throws SQLException{
        boolean comp=false;
        Connection con=null;
        PreparedStatement ps=null;
        try{
            con = conexion.getConexion();
            
            String sql="update mpedido set status_ped=14 where id_ped=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id_pedido);
            ps.executeUpdate();
            comp=true;
        }catch(Exception e){
            System.out.println("Error comprobacion pedido");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        ps.close();
        con.close();
        return comp;
    }
    
    public boolean comprobarFinalizacion(int id_pedido){
        boolean comp=false;
        try{
            Connection con = conexion.getConexion();
            String sql="select * from mpedido where id_ped=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id_pedido);
            ResultSet rs = ps.executeQuery();
            Pedido p = new Pedido();
            if(rs.next()){
                p.setId_ped(rs.getInt(1));
                p.setId_usu(rs.getInt(2));
                p.setId_hora(rs.getInt(3));
                p.setId_min(rs.getInt(4));
                p.setFecha_ped(rs.getString(5));
                p.setStatus_ped(rs.getInt(6));
                p.setTot_ped(rs.getDouble(7));
            }
            String fecha=p.getFecha_ped();
            String año="", mes="", dia="";
            int contador=0;
            for(int i=0; i<fecha.length(); i++){
                char letra=fecha.charAt(i);
                
                if(contador<4){
                    año=año+letra;
                }else if(contador<7 && contador>4){
                    mes= mes+letra;
                }else if(contador>7 && contador<10){
                    dia=dia+letra;
                }
                contador++;
            }
            
            Date fechaactual = new Date();
            String strDateFormat = "yyyy-MM-dd";
            
            SimpleDateFormat sdf = new SimpleDateFormat(strDateFormat);
            
            String añoactual="", mesactual="", diaactual="";
            int contador2=0;
            String fechaact=sdf.format(fechaactual);
            for(int i=0; i<fechaact.length(); i++){
                char letra=fechaact.charAt(i);
                
                if(contador2<4){
                    añoactual=añoactual+letra;
                }else if(contador2<7 && contador2>4){
                    mesactual= mesactual+letra;
                }else if(contador2>7 && contador2<10){
                    diaactual=diaactual+letra;
                }
                contador2++;
            }
            
            Hora oh=new Hora();
            Minuto om=new Minuto();
            int horaactual=fechaactual.getHours();
            int minactual = fechaactual.getMinutes();
            
            if(Integer.parseInt(año)==Integer.parseInt(añoactual) && Integer.parseInt(mes)==Integer.parseInt(mesactual)
                    && Integer.parseInt(dia)==Integer.parseInt(diaactual)){

                Hora h= oh.getHoraById(p.getId_hora());
                Minuto m=om.getMinutoById(p.getId_min());
                
                int limite1 = Integer.parseInt(m.getMinuto());
                int limite2 = Integer.parseInt(m.getMinuto())+20;
                if(Integer.parseInt(h.getHora())==horaactual){
                    if(minactual>=limite1 && minactual<=limite2){
                        comp=true;
                    }else{
                        comp=false;
                    }
                }
                
            }else{
                comp = false;
            }
        }catch(Exception e){
            System.out.println("Error comprobacion pedido");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        return comp;
    }
    
    public static boolean validacionNumeroPedidos(Pedido p){
        boolean exp=false;
        Connection con= null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        int id_h;
        if(p.getHora()==7){
            id_h=4;
        }else if(p.getHora()==8){
            id_h=14;
        }else if(p.getHora()==9){
            id_h=24;
        }else if(p.getHora()==10){
            id_h=34;
        }else if(p.getHora()==11){
            id_h=44;
        }else if(p.getHora()==12){
            id_h=54;
        }else if(p.getHora()==13){
            id_h=64;
        }else if(p.getHora()==14){
            id_h=74;
        }else if(p.getHora()==15){
            id_h=84;
        }else if(p.getHora()==16){
            id_h=94;
        }else if(p.getHora()==17){
            id_h=104;
        }else if(p.getHora()==18){
            id_h=114;
        }else if(p.getHora()==19){
            id_h=124;
        }else if(p.getHora()==20){
            id_h=134;
        }else{
            return exp;
        }
        
        int id_m;
        if("15".equals(p.getMin())){
            id_m=4;
        }else if("30".equals(p.getMin())){
            id_m=14;
        }else if("45".equals(p.getMin())){
            id_m=24;
        }else if("00".equals(p.getMin())){
            id_m=34;
        }else{
            return exp;
        }
        try{
            con = conexion.getConexion();
            String sql="select * from mpedido where fecha_ped=? and id_chora=? and id_minuto=? and status_ped=24";
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getFecha_ped());
            ps.setInt(2, id_h);
            ps.setInt(3, id_m);
            rs = ps.executeQuery();
            
            int contador=0;
            while(rs.next()){
                contador++;
            }
            if (contador<=3) {
                exp=true;
            }else{
                exp=false;
            }
        }catch(Exception e){
            System.out.println("Error comprobacion pedido");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        
        return exp;
    } 
    
    public static void checkoutPendientes(int id, boolean usu){
        ArrayList <Pedido> listaPedidos = new ArrayList<>();
        try{
            
            Connection con = conexion.getConexion();
            String sql=null;
            if(usu==false){
                sql="select mpedido.id_ped, id_chora, id_minuto, fecha_ped, status_ped, total_ped from mpedido, dpedido, mproducto where "
                        + "mpedido.id_ped=dpedido.id_ped and dpedido.id_prod=mproducto.id_prod and id_caf=?";
                System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaa");
            }else if(usu==true){
                sql="select id_ped, id_chora, id_minuto, fecha_ped, status_ped, total_ped from mpedido where id_usu=?";
            }
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Pedido p = new Pedido();
                p.setId_ped(rs.getInt(1));
                p.setId_hora(rs.getInt(2));
                p.setId_min(rs.getInt(3));
                p.setFecha_ped(rs.getString(4));
                p.setStatus_ped(rs.getInt(5));
                p.setTot_ped(rs.getDouble(6));
                listaPedidos.add(p);
            }
            
            for(Pedido p:listaPedidos){
                if(p.getStatus_ped()==24){
                    String fecha=p.getFecha_ped();
                    String año="", mes="", dia="";
                    int contador=0;

                    for(int i=0; i<fecha.length(); i++){
                        char letra=fecha.charAt(i);

                        if(contador<4){
                            año=año+letra;
                        }else if(contador<7 && contador>4){
                            mes= mes+letra;
                        }else if(contador>7 && contador<10){
                            dia=dia+letra;
                        }
                        contador++;
                    }

                    Date fechaactual = new Date();
                    String strDateFormat = "yyyy-MM-dd";

                    SimpleDateFormat sdf = new SimpleDateFormat(strDateFormat);

                    String añoactual="", mesactual="", diaactual="";
                    int contador2=0;
                    String fechaact=sdf.format(fechaactual);
                    for(int i=0; i<fechaact.length(); i++){
                        char letra=fechaact.charAt(i);

                        if(contador2<4){
                            añoactual=añoactual+letra;
                        }else if(contador2<7 && contador2>4){
                            mesactual= mesactual+letra;
                        }else if(contador2>7 && contador2<10){
                            diaactual=diaactual+letra;
                        }
                        contador2++;
                    }

                    Hora oh=new Hora();
                    Minuto om=new Minuto();
                    int horaactual=fechaactual.getHours();
                    int minactual = fechaactual.getMinutes();

                    System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
                    if(Integer.parseInt(año)==Integer.parseInt(añoactual) && Integer.parseInt(mes)==Integer.parseInt(mesactual)
                            && Integer.parseInt(dia)==Integer.parseInt(diaactual)){
                        System.out.println("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
                        Hora h= oh.getHoraById(p.getId_hora());
                        Minuto m=om.getMinutoById(p.getId_min());

                        int limite = Integer.parseInt(m.getMinuto())+20;
                        if(Integer.parseInt(h.getHora())==horaactual){
                            if(minactual>limite){
                                String sql2="update mpedido set status_ped=34 where id_ped=?";
                                PreparedStatement ps2 = con.prepareStatement(sql2);
                                ps2.setInt(1, p.getId_ped());
                                ps2.executeUpdate();
                            }
                        }else if(Integer.parseInt(h.getHora())<horaactual){
                            String sql2="update mpedido set status_ped=34 where id_ped=?";
                            PreparedStatement ps2 = con.prepareStatement(sql2);
                            ps2.setInt(1, p.getId_ped());
                            ps2.executeUpdate();
                        }
                    }else if(Integer.parseInt(año)<=Integer.parseInt(añoactual) && Integer.parseInt(mes)<=Integer.parseInt(mesactual)
                            && Integer.parseInt(dia)<Integer.parseInt(diaactual)){
                        String sql2="update mpedido set status_ped=34 where id_ped=?";
                        PreparedStatement ps2 = con.prepareStatement(sql2);
                        ps2.setInt(1, p.getId_ped());
                        ps2.executeUpdate();
                    }
                }
            }
        }catch(Exception e){
            System.out.println("Error comprobacion pedido");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        
    }
    
    public static ArrayList<Cafeteria> pedidosEn15Min(int id){
        ArrayList <Cafeteria> listaCafeteria = new ArrayList<>();
        ArrayList <Pedido> listaPedidos = new ArrayList<>();
        try{
            
            Connection con = conexion.getConexion();
            String sql=null;
            sql="select id_chora, id_minuto, fecha_ped, status_ped, total_ped, cafeteria.nom_caf from mpedido, dpedido, mproducto, cafeteria "
                    + "where mpedido.id_ped=dpedido.id_ped and dpedido.id_prod=mproducto.id_prod and "
                    + "mproducto.id_caf=cafeteria.id_caf and cafeteria.id_usu=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Pedido p = new Pedido();
                p.setId_hora(rs.getInt(1));
                p.setId_min(rs.getInt(2));
                p.setFecha_ped(rs.getString(3));
                p.setStatus_ped(rs.getInt(4));
                p.setTot_ped(rs.getDouble(5));
                p.setNom_caf(rs.getString(6));
                listaPedidos.add(p);
            }
            
            for(Pedido p:listaPedidos){
                if(p.getStatus_ped()==3){
                    String fecha=p.getFecha_ped();
                    String año="", mes="", dia="";
                    int contador=0;

                    for(int i=0; i<fecha.length(); i++){
                        char letra=fecha.charAt(i);

                        if(contador<4){
                            año=año+letra;
                        }else if(contador<7 && contador>4){
                            mes= mes+letra;
                        }else if(contador>7 && contador<10){
                            dia=dia+letra;
                        }
                        contador++;
                    }

                    Date fechaactual = new Date();
                    String strDateFormat = "yyyy-MM-dd";

                    SimpleDateFormat sdf = new SimpleDateFormat(strDateFormat);

                    String añoactual="", mesactual="", diaactual="";
                    int contador2=0;
                    String fechaact=sdf.format(fechaactual);
                    for(int i=0; i<fechaact.length(); i++){
                        char letra=fechaact.charAt(i);

                        if(contador2<4){
                            añoactual=añoactual+letra;
                        }else if(contador2<7 && contador2>4){
                            mesactual= mesactual+letra;
                        }else if(contador2>7 && contador2<10){
                            diaactual=diaactual+letra;
                        }
                        contador2++;
                    }

                    Hora oh=new Hora();
                    Minuto om=new Minuto();
                    int horaactual=fechaactual.getHours();
                    int minactual = fechaactual.getMinutes();

                    
                    if(Integer.parseInt(año)==Integer.parseInt(añoactual) && Integer.parseInt(mes)==Integer.parseInt(mesactual)
                            && Integer.parseInt(dia)==Integer.parseInt(diaactual)){
                        
                        Hora h= oh.getHoraById(p.getId_hora());
                        Minuto m=om.getMinutoById(p.getId_min());

                        
                        String min =m.getMinuto();
                        if (min.equals("00")) {
                            if(Integer.parseInt(h.getHora())-1==horaactual){
                                if (minactual>=45 && minactual<=59) {
                                    Cafeteria c = new Cafeteria();
                                    c.setNom_caf(p.getNom_caf());
                                    listaCafeteria.add(c);
                                }
                            }
                        }else{
                            if (Integer.parseInt(h.getHora())==horaactual) {
                                int resta = Integer.parseInt(m.getMinuto())-15;
                                if (minactual>=resta && minactual<=resta) {
                                    Cafeteria c = new Cafeteria();
                                    c.setNom_caf(p.getNom_caf());
                                    listaCafeteria.add(c);
                                }
                            }
                        }
                    }
                }
            }
        }catch(Exception e){
            System.out.println("Error comprobacion pedido");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        return listaCafeteria;
    }
    
    
    public static boolean Finalizar(int id_pedido) throws SQLException{
        boolean comp=false;
        Connection con=null;
        PreparedStatement ps=null;
        try{
            con = conexion.getConexion();
            //"update cafeteria set nom_caf=?, dir_caf=?, fot_caf=? where id_caf=?";
            String sql="update mpedido set status_ped=4 where id_ped=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id_pedido);
            ps.executeUpdate();
            comp=true;
        }catch(Exception e){
            System.out.println("Error comprobacion pedido");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        ps.close();
        con.close();
        return comp;
    }
    
    public ArrayList<Pedido> getPedidosCaf(int id_caf){
        ArrayList<Pedido> pedidos = new ArrayList<>();
        try{
            
            Connection con = conexion.getConexion();
            String sql = "select mpedido.id_ped, id_usu, id_chora, id_minuto"
                    + ", fecha_ped, status_ped, total_ped from mpedido, dpedido, mproducto where"
                    + " id_caf=? and mpedido.id_ped=dpedido.id_ped and dpedido.id_prod=mproducto.id_prod and mpedido.status_ped=24";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id_caf);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Pedido p = new Pedido();
                p.setId_ped(rs.getInt(1));
                p.setId_usu(rs.getInt(2));
                p.setId_hora(rs.getInt(3));
                p.setId_min(rs.getInt(4));
                p.setFecha_ped(rs.getString(5));
                p.setStatus_ped(rs.getInt(6));
                p.setTot_ped(rs.getDouble(7));
                pedidos.add(p);
            }
            
            con.close();
            
        }catch(Exception ed){
            System.out.println("error en get usuario by id");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        
        }
        
        return pedidos;
    }
    
    public ArrayList<Pedido> getPedidosClie(int id_usu){
        ArrayList<Pedido> pedidos = new ArrayList<>();
        try{
            
            Connection con = conexion.getConexion();
            String sql = "select mpedido.id_ped, id_usu, id_chora, id_minuto, fecha_ped, status_ped, total_ped, "
                    + "id_caf from mpedido, dpedido, mproducto where id_usu=? and mpedido.id_ped=dpedido.id_ped and mpedido.status_ped=24 "
                    + "and dpedido.id_prod=mproducto.id_prod";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id_usu);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Pedido p = new Pedido();
                p.setId_ped(rs.getInt(1));
                p.setId_usu(rs.getInt(2));
                p.setId_hora(rs.getInt(3));
                p.setId_min(rs.getInt(4));
                p.setFecha_ped(rs.getString(5));
                p.setStatus_ped(rs.getInt(6));
                p.setTot_ped(rs.getDouble(7));
                p.setId_caf(rs.getInt(8));
                pedidos.add(p);
            }
            
            con.close();
            
        }catch(Exception ed){
            System.out.println("error en get usuario by id");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        
        }
        
        return pedidos;
    }
    
    public Pedido(){
        
    }
    public Pedido(int id_usu, int hora, String min, String fecha_ped, double tot_ped) {
        this.id_usu = id_usu;
        this.fecha_ped = fecha_ped;
        this.tot_ped = tot_ped;
        this.hora = hora;
        this.min = min;
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

    public int getStatus_ped() {
        return status_ped;
    }

    public void setStatus_ped(int status_ped) {
        this.status_ped = status_ped;
    }

    public double getTot_ped() {
        return tot_ped;
    }

    public void setTot_ped(double tot_ped) {
        this.tot_ped = tot_ped;
    }

    public int getId_hora() {
        return id_hora;
    }

    public void setId_hora(int id_hora) {
        this.id_hora = id_hora;
    }

    public int getId_min() {
        return id_min;
    }

    public void setId_min(int id_min) {
        this.id_min = id_min;
    }

    public int getHora() {
        return hora;
    }

    public void setHora(int hora) {
        this.hora = hora;
    }

    public String getMin() {
        return min;
    }

    public void setMin(String min) {
        this.min = min;
    }

    public int getId_caf() {
        return id_caf;
    }

    public void setId_caf(int id_caf) {
        this.id_caf = id_caf;
    }
    
}
