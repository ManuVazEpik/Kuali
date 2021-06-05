/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clases.Productos;
import Clases.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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
public class Disponibilidad extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id_prodS=request.getParameter("id_prod");
            String id_cafS=request.getParameter("admrs");
            String dis=request.getParameter("dis_prod");
            int id_prod=Integer.parseInt(id_prodS);
            if ("Disponible".equals(dis)) {
                
                Productos prod=new Productos();
                boolean estatus=prod.NoDisponible(id_prod);
                if (estatus==true) {
                    String direccion = URLEncoder.encode ("dueño", "UTF-8");
                    response.sendRedirect(direccion+"operacionProductos.jsp?admrs="+id_cafS);
                }else{
                    response.sendRedirect("error.html");
                }
            }else if("NoDisponible".equals(dis)){
                Productos prod=new Productos();
                boolean estatus=prod.Disponible(id_prod);
                if (estatus==true) {
                    String direccion = URLEncoder.encode ("dueño", "UTF-8");
                        response.sendRedirect(direccion+"operacionProductos.jsp?admrs="+id_cafS);
                }else{
                    response.sendRedirect("error.html");
                }
            }else{
                out.println("<h1>No cambies nada >:|</h1>");
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
