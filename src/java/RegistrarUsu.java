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
            String telS, nombre, appat, apmat, correo, contrasena, permisosS, nomLocal, calle, col, num;
            
            int idC = 0;
            
            permisosS=request.getParameter("perU");
            System.out.println(permisosS);
            if (permisosS.equals("Cliente")) {
                nombre = request.getParameter("nomU");
                appat = request.getParameter("appatU");
                apmat = request.getParameter("apmatU");
                telS =request.getParameter("telU");
                correo=request.getParameter("corU");
                contrasena=request.getParameter("conU");
                
                Cuentas c = new Cuentas();
                Cuentas operC= new Cuentas();
                c.setNombre(nombre);
                c.setAppat(appat);
                c.setApmat(apmat);
                c.setCorreo(correo);
                c.setContrasena(contrasena);
                c.setTel(telS);
                c.setPermisos(2);
                
                 int estado=operC.Guardar(c);
            
                if(estado >0){
                    response.sendRedirect("index.html");
                }else{
                    out.println("<h1>Valio cake</h1>");
                    out.println("");
                }
            }else if (permisosS.equals("Cafeteria")) {
                nomLocal = request.getParameter("nomC");
                
                Part part=request.getPart("imgC");
                InputStream inputStream=part.getInputStream();
                
                calle = request.getParameter("calleC");
                col = request.getParameter("colC");
                num =request.getParameter("numC");
                correo=request.getParameter("corU");
                contrasena=request.getParameter("conU");
                
                Cuentas c = new Cuentas();
                Cuentas operC= new Cuentas();
                c.setFoto(inputStream);
                c.setNomLocal(nomLocal);
                c.setColonia(col);
                c.setCalle(calle);
                c.setCorreo(correo);
                c.setContrasena(contrasena);
                c.setEx(Integer.parseInt(num));
                c.setPermisos(3);
                
                int estado=operC.Guardar(c);
            
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
