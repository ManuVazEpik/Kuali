/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clases.DetallePedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class anadirPedido extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            System.out.println("no");
           int cantidad = Integer.parseInt(request.getParameter("cantidadtxt"));
            int id = Integer.parseInt(request.getParameter("idtxt"));
            float subtotal= Float.parseFloat(request.getParameter("preciotxt"));
            
            HttpSession session = request.getSession(true);
            ArrayList<DetallePedido> productos = session.getAttribute("carrito") == null ? new ArrayList<>() : (ArrayList) session.getAttribute("carrito") ;
            
            boolean flag = false;
            
            if (productos.size() > 0) {
                for (DetallePedido a: productos) {
                    if(id == a.getId_prod()){
                        a.setCant_detPed(a.getCant_detPed()+ cantidad);
                        a.setSub_detPed(subtotal*a.getCant_detPed());
                        flag = true;
                        break;
                    }
                }
            }
            
            if (!flag) {
                productos.add(new DetallePedido(id, cantidad, subtotal));
            }
            
            session.setAttribute("carrito", productos);
            
            response.sendRedirect("Cafeteria.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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
        processRequest(request, response);
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
