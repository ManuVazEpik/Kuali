/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clases.cifrar;
import Clases.Cafeteria;
import Clases.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bocal
 */
public class IniciarSesion extends HttpServlet {

    

    
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
        try (PrintWriter out = response.getWriter()) {
            int nivel=0;
            String noms, cons;
            noms=request.getParameter("corU");
            cons=request.getParameter("conU");
            
            try{
                Usuario opc = new Usuario();
                
                Usuario c = opc.encontrarUsuario(noms, cons);
                
                nivel = c.getId_usu();
                int perm= c.getPerm_usu();
                String nivelS = String.valueOf(nivel);
                String privS = String.valueOf(perm);
                if(c != null){
                    if(perm==2){
                        HttpSession sesion = request.getSession(true);
                        sesion.setAttribute("usuario", c);
                        HttpSession sesionOK = request.getSession();
                        sesionOK.setAttribute("usuario", noms);
                        sesionOK.setAttribute("id", nivelS);
                        sesionOK.setAttribute("privilegio", privS);
                        Cafeteria operC=new Cafeteria();
                        boolean caftener=operC.comprobarCafExiste(nivel);
                        
                        if (caftener==true){
                            int autorizacion=operC.comprobarAutorizacion(nivel);
                            if(autorizacion==1){
                                sesionOK.setAttribute("autorizacion","1");
                            }
                        }else{
                            sesionOK.setAttribute("autorizacion","0");
                        }
                        
                        response.sendRedirect("Cuentas.jsp");
                    }else if(perm==1 && nivel!=0){
                        HttpSession sesion = request.getSession(true);
                        sesion.setAttribute("usuario", c);
                        HttpSession sesionOK = request.getSession();
                        sesionOK.setAttribute("usuario", noms);
                        sesionOK.setAttribute("privilegio", privS);
                        response.sendRedirect("SesionAdmin.jsp");
                    }else{
                        out.println("\n" +
                    "<!DOCTYPE html>"+
                    "<html><head><title>Error</title><meta charset='UTF-8'>"
                    + "<meta name='viewport' content='width=device-width, initial-scale=1.0'>"+
                    "<link rel='stylesheet' href='css/cafeteria.css'></head><body>"+
                    "<div style='margin-left:15%; margin-top:10rem; font-size: 40pt;'>No se encuentra la sesion, intentelo de nuevo<br>"
                                + "<a href='IniciarSesion.jsp'>Regresar</a></div>"
                    + ""+
                    "</body>"+
                    "</html>"+
                    "");
                    }
                }else{
                    out.println("\n" +
                    "<!DOCTYPE html>"+
                    "<html><head><title>Error</title><meta charset='UTF-8'>"
                    + "<meta name='viewport' content='width=device-width, initial-scale=1.0'>"+
                    "<link rel='stylesheet' href='css/cafeteria.css'></head><body>"+
                    "<div style='margin-left:15%; margin-top:10rem; font-size: 40pt;'>No se encuentra la sesion, intentelo de nuevo<br>"
                                + "<a href='IniciarSesion.jsp'>Regresar</a></div>"
                    + ""+
                    "</body>"+
                    "</html>"+
                    "");
                }
            }catch(Exception e){
                System.out.println("Que pedo que pedo");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            }
            
        }
        
    }

    
}
