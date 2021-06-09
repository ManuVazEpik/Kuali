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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
                
            Validar val = new Validar();
            boolean exp1=val.letrasEspacios(nom_usu);
            boolean exp2=val.letrasEspacios(appat_usu);
            boolean exp3=val.letrasEspacios(apmat_usu);
            boolean exp4=val.numerosEnteros(tel_usu);
            boolean exp5=val.Correo(email_usu);
            boolean exp6=val.Contrasenas(pass_usu);
            
            int perm=0;
            if (tipo.equals("Cliente")) {
                perm=2;
            }else if (tipo.equals("Dueño")) {
                perm=3;
            }
            
            if(exp1==true && exp2==true && exp3==true && exp4==true && exp5==true && exp6==true && perm!=0 ){
                if(nom_usu.length()<=20 && appat_usu.length()<=30 && apmat_usu.length()<=30 && tel_usu.length()==10 && 
                        email_usu.length()<50 && pass_usu.length()<30){
                    Usuario operC= new Usuario();
                    cifrar cifra = new cifrar();
                    Usuario u = cifra.AESCifrar(nom_usu,appat_usu,apmat_usu,tel_usu,email_usu,pass_usu);
                    u.setPerm_usu(perm);
                    int estado=operC.AñadirUsuario(u);
                    if(estado >0){
                        response.sendRedirect("IniciarSesion.html");
                    }else{
                        response.sendRedirect("error.jsp");
                    }
                }else{
                    response.sendRedirect("error.jsp");
                }
            }else{
                response.sendRedirect("error.jsp");
            }
        
    }   catch (SQLException ex) {
            Logger.getLogger(RegistrarUsu.class.getName()).log(Level.SEVERE, null, ex);
        }

}
}
