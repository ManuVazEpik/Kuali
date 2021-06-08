/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clases.cifrar;
import Clases.Usuario;
import Clases.Validar;
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
            String tel_usu, nom_usu, appat_usu, apmat_usu,
                    email_usu, pass_usu, tipo, nom_caf, dir_caf;
            int id_usu = Integer.parseInt(request.getParameter("id_usu").trim());
            
            cifrar cifra = new cifrar();
            
            
            nom_usu = request.getParameter("nom_usu");
            appat_usu = request.getParameter("appat_usu");
            apmat_usu = request.getParameter("apmat_usu");
            tel_usu =request.getParameter("tel_usu");
            email_usu = request.getParameter("email_usu");
            pass_usu = request.getParameter("pass_usu");

            Validar val = new Validar();
            boolean exp1=val.letras(nom_usu);
            boolean exp2=val.letras(appat_usu);
            boolean exp3=val.letras(apmat_usu);
            boolean exp4=val.numerosEnteros(tel_usu);
            
            if(exp1==true && exp2==true && exp3==true && exp4==true){
                if(nom_usu.length()<20 && appat_usu.length()<30 && apmat_usu.length()<30 && tel_usu.length()==10 ){
                    Usuario c = new Usuario();
                Usuario operC= new Usuario();

                c = cifra.AESCifrar(nom_usu,appat_usu,apmat_usu,tel_usu,email_usu,pass_usu);
                c.setId_usu(id_usu);
//                c.setNom_usu(nom_usu);
//                c.setAppat_usu(appat_usu);
//                c.setApmat_usu(apmat_usu);
//                c.setTel_usu(tel_usu);

                int estado=operC.ActualizarUsuario(c);

                if(estado >0){
                    response.sendRedirect("usuario/ajustesUsuarios.jsp");
                }else{
                    response.sendRedirect("error.jsp");
                }
                }else{
                    response.sendRedirect("error.jsp");
                }
            }else{
                response.sendRedirect("error.jsp");
            }
                
            
        } catch (SQLException ex) {
            Logger.getLogger(ActualizarUsu.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
