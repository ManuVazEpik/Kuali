/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clases.Cuentas;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String tel_usu, nom_usu, appat_usu, apmat_usu, email_usu, pass_usu, tipo, nom_caf, dir_caf, aut_caf,calle,col,num;
            tipo=request.getParameter("tipo");
            
            if (Integer.parseInt(tipo)==2) {
                nom_usu = request.getParameter("nom_usu");
                appat_usu = request.getParameter("appat_usu");
                apmat_usu = request.getParameter("apmat_usu");
                tel_usu =request.getParameter("tel_usu");
                email_usu=request.getParameter("email_usu");
                pass_usu=request.getParameter("pass_usu");
                
                Cuentas c = new Cuentas();
                Cuentas operC= new Cuentas();
                c.setNom_usu(nom_usu);
                c.setAppat_usu(appat_usu);
                c.setApmat_usu(apmat_usu);
                c.setEmail_usu(email_usu);
                c.setPass_usu(pass_usu);
                c.setTel_usu(tel_usu);
                
                int estado=operC.Guardar(c,2);
            
                if(estado >0){
                    response.sendRedirect("index.html");
                }else{
                    out.println("<h1>Valio cake</h1>");
                    out.println("");
                }
            }else if (Integer.parseInt(tipo)==3) {
                String idS=request.getParameter("id_usu");
                int id_usu = Integer.parseInt(idS);
                nom_caf = request.getParameter("nom_caf");
                Part part=request.getPart("fot_caf");
                InputStream inputStream=part.getInputStream();
                calle = request.getParameter("calle_caf");
                col = request.getParameter("col_caf");
                num =request.getParameter("num_caf");
                dir_caf="Calle: "+calle+" Colonia: "+col+" Numero: "+num;
                
                Cuentas c = new Cuentas();
                Cuentas operC= new Cuentas();
                c.setFot_caf(inputStream);
                c.setNom_caf(nom_caf);
                c.setDir_caf(dir_caf);
                c.setId_usu(id_usu);
                int estado=operC.Guardar(c,3);
            
                if(estado >0){
                    response.sendRedirect("index.html");
                }else{
                    out.println("<h1>Valio cake</h1>");
                    out.println("");
                }
            }
{
                
            }
            
            
            
            
            
            
           
            
        }
    }

}
