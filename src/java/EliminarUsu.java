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
public class EliminarUsu extends HttpServlet {

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
            String idS, tipoS;
            idS = request.getParameter("id");
            tipoS=request.getParameter("tipo");
            int id = Integer.parseInt(idS);
            int tipo = Integer.parseInt(tipoS);
            
            Usuario opc = new Usuario();
            int estatus=opc.EliminarUsuario(id);
            if(estatus>0){
               if("2".equals(tipoS) || "3".equals(tipoS)){
                    response.sendRedirect("index.html");
                }else if("1".equals(tipoS)){
                    response.sendRedirect("SesionAdmin.jsp");
                }else{
                    response.sendRedirect("error.html");
                }
                
                
            }else{
                response.sendRedirect("error.html");
            }
        } catch (SQLException ex) {
            Logger.getLogger(EliminarUsu.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
