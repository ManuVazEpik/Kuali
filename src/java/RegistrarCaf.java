/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clases.Cafeteria;
import Clases.Usuario;
import Clases.Validar;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig

/**
 *
 * @author bocal
 */
public class RegistrarCaf extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
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
            String fot_caf, tipo, nom_caf, dir_caf, calle, col, num,idS;
            
            
            nom_caf = request.getParameter("nom_caf");
            idS=request.getParameter("id_usuC");
            fot_caf=request.getParameter("fot_caf");
            calle = request.getParameter("calle_caf");
            col = request.getParameter("col_caf");
            num =request.getParameter("num_caf");
            
            Validar val = new Validar();
            boolean exp1=val.letrasEspacios(nom_caf);
            boolean exp2=val.numerosEnteros(idS);
            //boolean exp3=val.direccionesURL(fot_caf);
            boolean exp4=val.direcciones(calle);
            boolean exp5=val.direcciones(col);
            boolean exp6=val.numerosEnteros(num);
            
            if(exp1==true && exp2==true && exp4==true && exp5==true && exp6==true){
                if(nom_caf.length()<20 && calle.length()<30 && col.length()<30 && num.length()<4 && fot_caf.length()<100){
                    dir_caf="Calle: "+calle+" Colonia: "+col+" Numero: "+num;
                    int id_usu = Integer.parseInt(idS);
                    Cafeteria c = new Cafeteria();
                    Cafeteria operC= new Cafeteria();
                    c.setFot_caf(fot_caf);
                    c.setNom_caf(nom_caf);
                    c.setDir_caf(dir_caf);
                    c.setId_usu(id_usu);
                    
                    int estado=operC.AñadirCafeteria(c);

                    if(estado >0){
                        response.sendRedirect("dueno/verCafeterias.jsp");
                    }else{
                        response.sendRedirect("error.jsp");
                    }

                }else{
                    response.sendRedirect("error.jsp");
                }
            }else{
                response.sendRedirect("error.jsp");
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
