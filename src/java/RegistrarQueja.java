/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clases.Queja;
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
public class RegistrarQueja extends HttpServlet {

    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String tel = request.getParameter("tel");
            String queja = request.getParameter("queja");
            int satisfaccion = Integer.parseInt(request.getParameter("satisfaccion").trim());
            
            Queja q = new Queja();
            q.setNom_que(nombre);
            q.setEmail_que(correo);
            q.setTel_que(tel);
            q.setQueja(queja);
            q.setSatisfaccion(satisfaccion);
            int estatus = Queja.RegistrarQueja(q);
            if(estatus >0){
                response.sendRedirect("soporte/preguntasFrecuentes.html");
            }else{
                out.println("<h1>Valio cake</h1>");
                out.println("");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(RegistrarQueja.class.getName()).log(Level.SEVERE, null, ex);
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
