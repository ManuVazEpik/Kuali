/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clases.cifrar;
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
public class RegistrarUsu extends HttpServlet {

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

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String tel_usu, nom_usu, appat_usu, apmat_usu, email_usu, pass_usu, tipo, nom_caf, dir_caf, aut_caf,calle,col,num;
            tipo=request.getParameter("tipo");
            
                nom_usu = request.getParameter("nom_usu");
                appat_usu = request.getParameter("appat_usu");
                apmat_usu = request.getParameter("apmat_usu");
                tel_usu =request.getParameter("tel_usu");
                email_usu=request.getParameter("email_usu");
                pass_usu=request.getParameter("pass_usu");
                
                try{
                
                Usuario operC= new Usuario();
//                c.setNom_usu(nom_usu);
//                c.setAppat_usu(appat_usu);
//                c.setApmat_usu(apmat_usu);
//                c.setEmail_usu(email_usu);
//                c.setPass_usu(pass_usu);
//                c.setTel_usu(tel_usu);
                
                cifrar cifra = new cifrar();
                
                Usuario u = cifra.AESCifrar(nom_usu,appat_usu,apmat_usu,tel_usu);
                
                operC.setEmail_usu(email_usu);
                operC.setPass_usu(pass_usu);
                
                int estado=operC.AñadirUsuario(u);
            
                if(estado >0){
                    response.sendRedirect("index.html");
                }else{
                    out.println("<h1>Valio cake</h1>");
                    out.println("");
                }
            
        } catch (SQLException ex) {
            Logger.getLogger(RegistrarUsu.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        
    }

}
}
