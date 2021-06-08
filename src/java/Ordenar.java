/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clases.DetallePedido;
import Clases.Pedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class Ordenar extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id_cafS=request.getParameter("id_caf");
            String fecha = request.getParameter("fecha");
            int hora = Integer.parseInt(request.getParameter("hora"));
            String min = request.getParameter("minuto");
            double total = Double.parseDouble(request.getParameter("total"));
            
            if(hora!=7 && hora!=8 && hora!=9 && hora!=10 && hora!=11 && hora!=12 && hora!=13 && hora!=14 && 
                hora!=15 && hora!=16 && hora!=17 && hora!=18 && hora!=19 && hora!=20){
                response.sendRedirect("error.jsp");
            }else{
                if(!"00".equals(min) && !"15".equals(min) && !"30".equals(min) && !"45".equals(min)){
                   response.sendRedirect("error.jsp");
                }else{
                    
                    int id = Integer.parseInt(request.getParameter("id_usu"));

                    Pedido p = new Pedido(id, hora, min, fecha, total);
                    boolean verificacion = Pedido.validacionNumeroPedidos(p);
                    if (verificacion==true) {
                        HttpSession session = request.getSession(true);
                        ArrayList<DetallePedido> productos = session.getAttribute("carrito") == null ? new ArrayList<>() : (ArrayList) session.getAttribute("carrito") ;

                        if (productos.size() > 0 && productos.size()<=5) {
                            boolean flag = p.registrarPedido(p, productos);
                            if (flag) {
                                response.sendRedirect("EliminarTodoCarro");
                            }else{
                                response.sendRedirect("error.jsp");
                            }
                        }else{
                            response.sendRedirect("error.jsp");
                        }
                    }else{
                        response.sendRedirect("error.jsp?admrs=3&ewewe="+id_cafS);
                    }
                }
            }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Ordenar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Ordenar.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Ordenar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Ordenar.class.getName()).log(Level.SEVERE, null, ex);
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
