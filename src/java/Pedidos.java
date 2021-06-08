/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clases.DetallePedido;
import Clases.Productos;
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
public class Pedidos extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            int cantidad = Integer.parseInt(request.getParameter("cantidadtxt"));
            int id = Integer.parseInt(request.getParameter("idtxt"));
            int id_caf = Integer.parseInt(request.getParameter("id_caftxt"));
            double subtotal= Double.parseDouble(request.getParameter("preciotxt"));
            
            HttpSession session = request.getSession(true);
            ArrayList<DetallePedido> productos = session.getAttribute("carrito") == null ? new ArrayList<>() : (ArrayList) session.getAttribute("carrito") ;
            boolean flag = false;
            boolean comp = false;
            Productos opP = new Productos();
            if (productos.size() > 0) {
                
                for (DetallePedido p: productos) {
                    int id_caf1 = opP.getIdCafeteriaProducto(id);
                    int id_caf2 = opP.getIdCafeteriaProducto(p.getId_prod());
                    
                    if (id_caf1 == id_caf2) {
                        comp=true;
                    }else{
                        comp=false;
                        break;
                    }
                }

                for (DetallePedido a: productos) {
                    if(id == a.getId_prod()){
                        a.setCant_detPed(a.getCant_detPed() + cantidad);
                        a.setSub_detPed(subtotal*a.getCant_detPed());
                        flag = true;
                        break;
                    }
                }
                
            }else{
                comp=true;
            }
            
            if (comp==true) {
                if (!flag) {
                    subtotal = subtotal * cantidad;
                    DetallePedido pedido = new DetallePedido(id, cantidad, subtotal);
                    productos.add(pedido);
                    session.setAttribute("carrito", productos);
                }
                response.sendRedirect("usuario/carritoCompras.jsp?admrs="+id_caf);
            }else{
                    response.sendRedirect("error.jsp");
                }

        }catch(Exception e){
            e.printStackTrace();
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
