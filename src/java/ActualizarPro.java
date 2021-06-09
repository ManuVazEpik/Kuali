/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clases.Productos;
import Clases.Validar;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author bocal
 */
public class ActualizarPro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
            String nom_prod, desc_prod, pre_prodS , id_prodS, dispon, id_cafS;
            boolean  disp_prod=true;
            
            nom_prod = request.getParameter("nom_prod");
            String fot_prod=request.getParameter("fot_prod");
            desc_prod = request.getParameter("desc_prod");
            pre_prodS = request.getParameter("pre_prod");
            id_prodS= request.getParameter("id_prod");
            id_cafS= request.getParameter("id_caf");
            
            System.out.println(fot_prod);
            
            Validar val = new Validar();
            boolean exp1=val.direcciones(nom_prod);
            boolean exp2=val.numerosEnteros(id_prodS);
            boolean exp3=this.comprobarURL(fot_prod);
            boolean exp4=val.direcciones(desc_prod);
            boolean exp5=val.numerosDecimales(pre_prodS);
            System.out.println(":"+exp1+exp2+exp3+exp4+exp5);
            if(exp1==true && exp2==true && exp4==true && exp5==true && exp3==true ){
                
                if(nom_prod.length()<=20 && desc_prod.length()<=100 && pre_prodS.length()<=30 && fot_prod.length()<1000){
                    int id_prod = Integer.parseInt(id_prodS);
            
                    float pre_prod=Float.parseFloat(pre_prodS);
                    Productos c = new Productos();
                    Productos operC= new Productos();
                    c.setFot_prod(fot_prod);
                    c.setNom_prod(nom_prod);
                    c.setDesc_prod(desc_prod);
                    c.setId_prod(id_prod);
                    c.setPre_prod(pre_prod);
                    c.setDisp_prod(disp_prod);
                    
                    int estado=operC.Actualizar(c);
                    
                    if(estado >0){
                        
                        response.sendRedirect("dueno"+"/operacionProductos.jsp?admrs="+id_cafS);
                    }else{
                        
                        response.sendRedirect("error.jsp");
                    }
                
                }else{
                    response.sendRedirect("error.jsp");
                }
            }else{
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException ex) {
            response.sendRedirect("error.jsp");
            Logger.getLogger(ActualizarPro.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }

    public boolean comprobarURL(String parametro){
        String fot_caf=parametro;
        String delante="";
        String atras="";
        for (int i = 0; i < 8; i++) {
            delante+=fot_caf.charAt(i);
        }
        for (int i = fot_caf.length()-4; i < fot_caf.length(); i++) {
            atras+=fot_caf.charAt(i);
        }
        System.out.println(delante);
        if (!"https://".equals(delante)) {
            return false;
        }else{
            if (!".jpg".equals(atras) && !".png".equals(atras)) {
                return false;
            }else{
                return true;
            }
        }
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
