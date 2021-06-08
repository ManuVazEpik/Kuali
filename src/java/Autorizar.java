/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clases.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bocal
 */
public class Autorizar extends HttpServlet {

  
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
            String idS=request.getParameter("id_usu");
            String tipo=request.getParameter("tipo");
            int id=Integer.parseInt(idS);
            
            if ("1".equals(tipo)) {
                Usuario c = new Usuario();
                int estatus=c.AutorizarCafeteria(id);
                if (estatus>0) {
                    response.sendRedirect("administradorGeneral/administrarCafeterias.jsp");
                }else{
                    response.sendRedirect("error.jsp");
                }
            }else if("2".equals(tipo)){
                Usuario c = new Usuario();
                int estatus=c.RechazarCafeteria(id);
                if (estatus>0) {
                    response.sendRedirect("administradorGeneral/administrarCafeterias.jsp");
                }else{
                    response.sendRedirect("error.jsp");
                }
            }else{
                response.sendRedirect("error.jsp");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Autorizar.class.getName()).log(Level.SEVERE, null, ex);
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
