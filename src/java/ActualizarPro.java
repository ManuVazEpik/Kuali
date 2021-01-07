/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clases.Productos;
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
public class ActualizarPro extends HttpServlet {

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
            String nom_prod, desc_prod, pre_prodS , id_cafS, dispon;
            boolean  disp_prod=true;
            
            id_cafS=request.getParameter("id_caf");
            int id_caf = Integer.parseInt(id_cafS);
            nom_prod = request.getParameter("nom_prod");
            Part part=request.getPart("fot_prod");
            InputStream inputStream=part.getInputStream();
            desc_prod = request.getParameter("desc_prod");
            pre_prodS = request.getParameter("pre_prod");
            dispon=request.getParameter("dispon");
            
            if ("Disponible".equals(dispon)) {
                disp_prod=true;
            }else if("NoDisponible".equals(dispon)){
                disp_prod=false;
            }else{
                response.sendRedirect("error.jsp");
            }
            
            float pre_prod=Float.parseFloat(pre_prodS);
            Productos c = new Productos();
            Productos operC= new Productos();
            c.setFot_prod(inputStream);
            c.setNom_prod(nom_prod);
            c.setDesc_prod(desc_prod);
            c.setId_caf(id_caf);
            c.setPre_prod(pre_prod);
            c.setDisp_prod(disp_prod);
            int estado=operC.Guardar(c);

            if(estado >0){
                response.sendRedirect("ModificarCafeteria.jsp");
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
