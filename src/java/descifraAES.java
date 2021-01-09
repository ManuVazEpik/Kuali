/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author manua
 */
public class descifraAES extends HttpServlet {

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
            
            String nombre = "SQdbXmq8c4oHAQC1c86b9A==";
            String apellido = "LY6D5om0nA+Y5nUgLX8DFw==";
            String edad = "/792IY0ZA63Dua9a/TS+RA==";
            String telefono = "zZVFjPyLV3z+jbfhAOfziQ==";
            
            cifrar cifra = new cifrar();
            ArrayList usuario = new ArrayList();
            
            usuario = cifra.AESDescifrar(nombre, apellido, edad, telefono);
            
            System.out.println("Esto pertenece al servlet descifraAES");
            System.out.println(usuario.get(0).toString());
            System.out.println(usuario.get(1).toString());
            System.out.println(usuario.get(2).toString());
            System.out.println(usuario.get(3).toString());
            
            if (usuario.isEmpty()) {
                response.sendRedirect("error.html");
            }else{
            
                response.sendRedirect("perfecto.html");
                
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
