/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clases.Cuentas;
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
            String telS, nombre, appat, apmat, correo, contrasena, permisosS,calle,col,num,nomLocal;
            
            int idC = Integer.parseInt(request.getParameter("idC").trim());
            
            permisosS=request.getParameter("perU");
            int permisos = Integer.parseInt(permisosS);
            
            if (permisos==2) {
                nombre = request.getParameter("nomU");
                appat = request.getParameter("appatU");
                apmat = request.getParameter("apmatU");
                telS =request.getParameter("telU");


                Cuentas c = new Cuentas();
                Cuentas operC= new Cuentas();

                System.out.println(permisosS);
                c.setIdC(idC);
                c.setNombre(nombre);
                c.setAppat(appat);
                c.setApmat(apmat);
                c.setTel(telS);
                c.setPermisos(Integer.parseInt(permisosS));

                int estado=operC.Actualizar(c);

                if(estado >0){
                    response.sendRedirect("Cuentas.jsp");
                }else{
                    out.println("<h1>Valio cake</h1>");
                    out.println("");
                }
            }else if (permisos==3) {
                System.out.println("?");
                Part part=request.getPart("imgC");
                InputStream inputStream=part.getInputStream();
                nomLocal = request.getParameter("nomC");
                calle = request.getParameter("calleC");
                col = request.getParameter("colC");
                num =request.getParameter("numC");


                Cuentas c = new Cuentas();
                Cuentas operC= new Cuentas();

                System.out.println(permisosS);
                c.setIdC(idC);
                c.setFoto(inputStream);
                c.setNomLocal(nomLocal);
                c.setCalle(calle);
                c.setColonia(col);
                c.setEx(Integer.parseInt(num));
                c.setPermisos(Integer.parseInt(permisosS));

                int estado=operC.Actualizar(c);

                if(estado >0){
                    response.sendRedirect("Cafeteria.jsp");
                }else{
                    out.println("<h1>Valio cake</h1>");
                    out.println("");
                }
            }
{
                
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ActualizarUsu.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
