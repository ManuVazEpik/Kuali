/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Clases.Usuario;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@MultipartConfig
/**
 *
 * @author bocal
 */
public class ActualizarUsu extends HttpServlet {

    

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
            String tel_usu, nom_usu, appat_usu, apmat_usu, tipo, nom_caf, dir_caf;
            int id_usu = Integer.parseInt(request.getParameter("id_usu").trim());
            tipo=request.getParameter("tipo");
                
                nom_usu = request.getParameter("nom_usu");
                appat_usu = request.getParameter("appat_usu");
                apmat_usu = request.getParameter("apmat_usu");
                tel_usu =request.getParameter("tel_usu");
                
                Usuario c = new Usuario();
                Usuario operC= new Usuario();

                c.setId_usu(id_usu);
                c.setNom_usu(nom_usu);
                c.setAppat_usu(appat_usu);
                c.setApmat_usu(apmat_usu);
                c.setTel_usu(tel_usu);

                int estado=operC.AñadirUsuario(c);

                if(estado >0){
                    response.sendRedirect("Cuentas.jsp");
                }else{
                    out.println("<h1>Valio cake</h1>");
                    out.println("");
                }
            
        } catch (SQLException ex) {
            Logger.getLogger(ActualizarUsu.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
