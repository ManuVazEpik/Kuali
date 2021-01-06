/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clases.Cafeteria;
import Clases.Cuentas;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

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
            String tipo, nom_caf, dir_caf, calle, col, num;
            tipo=request.getParameter("tipo");
            
                String idS=request.getParameter("id_usu");
                int id_usu = Integer.parseInt(idS);
                nom_caf = request.getParameter("nom_caf");
                Part part=request.getPart("fot_caf");
                InputStream inputStream=part.getInputStream();
                calle = request.getParameter("calle_caf");
                col = request.getParameter("col_caf");
                num =request.getParameter("num_caf");
                dir_caf="Calle: "+calle+" Colonia: "+col+" Numero: "+num;
                
                Cafeteria c = new Cafeteria();
                Cafeteria operC= new Cafeteria();
                c.setFot_caf(inputStream);
                c.setNom_caf(nom_caf);
                c.setDir_caf(dir_caf);
                c.setId_usu(id_usu);
                int estado=operC.AñadirCafeteria(c);
            
                if(estado >0){
                    response.sendRedirect("index.html");
                }else{
                    out.println("<h1>Valio cake</h1>");
                    out.println("");
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
