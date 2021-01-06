/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clases.Cafeteria;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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
public class ActualizarCaf extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

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
            String nom_caf, dir_caf;
            Part part=request.getPart("fot_usu");
            InputStream inputStream=part.getInputStream();
            int id_caf = Integer.parseInt(request.getParameter("id_caf").trim());
            nom_caf = request.getParameter("nom_caf");
            dir_caf = request.getParameter("dir_caf");

            Cafeteria c = new Cafeteria();
            Cafeteria operC= new Cafeteria();

            c.setId_caf(id_caf);
            c.setFot_caf(inputStream);
            c.setNom_caf(nom_caf);
            c.setDir_caf(dir_caf);

            int estado=operC.ActualizarCafeteria(c);

            if(estado >0){
                response.sendRedirect("Cafeteria.jsp");
            }else{
                out.println("<h1>Valio cake</h1>");
                out.println("");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ActualizarCaf.class.getName()).log(Level.SEVERE, null, ex);
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
