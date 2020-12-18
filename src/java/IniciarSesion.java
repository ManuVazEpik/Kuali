/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clases.Cuentas;
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
                Cuentas opc = new Cuentas();
                Cuentas c = opc.encontrarUsuario(noms, cons);
                nivel = c.getIdC();
                int perm= c.getPermisos();
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
                        response.sendRedirect("Cuentas.jsp");
                        
                    }else if(perm==3){
                        HttpSession sesion = request.getSession(true);
                        sesion.setAttribute("usuario", c);
                        HttpSession sesionOK = request.getSession();
                        sesionOK.setAttribute("usuario", noms);
                        sesionOK.setAttribute("id", nivelS);
                        sesionOK.setAttribute("privilegio", privS);
                        response.sendRedirect("Cafeteria.jsp");
                    }else if(perm==1 && nivel!=0){
                        HttpSession sesion = request.getSession(true);
                        sesion.setAttribute("usuario", c);
                        HttpSession sesionOK = request.getSession();
                        sesionOK.setAttribute("usuario", noms);
                        sesionOK.setAttribute("privilegio", privS);
                        response.sendRedirect("SesionAdmin.jsp");
                    }else{
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Sesion</title>"
                                + "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/estilos.css\">");
                        out.println("</head>");
                        out.println("<body>"
                                + "<h1>No se encuentra la sesion, intentelo de nuevo</h1>"
                                + "<a href='IniciarSesion.jsp'>Regresar</a>");
                        out.println("</body>");
                        out.println("</html>");    
                    }
                }else{
                    out.println("\n" +
                    "<%@page contentType=\"text/html\" pageEncoding=\"UTF-8\"%>\n" +
                    "<!DOCTYPE html>\n" +
                    "<html>\n" +
                    "    <head>\n" +
                    "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
                    "        <title>JSP Page</title>\n" +
                    "        <link href=\"css/pago.css\" rel=\"stylesheet\">\n" +
                    "        <link href=\"css/botones.css\" rel=\"stylesheet\">\n" +
                    "    </head>\n" +
                    "    <body>\n" +
                    "        <div class=\"overlay\">\n" +
                    "        <div class=\"color3\">\n" +
                    "            <div class=\"margin\">\n" +
                    "                <h1>Error</h1>\n" +
                    "                <p>No se encuentra la sesion</p>\n" +
                    "                <a href=\"index.html\"><input class=\"boton\" type=\"button\" value=\"Regresar al home\"></a>\n" +
                    "            </div>\n" +
                    "        </div>\n" +
                    "        </div>    \n" +
                    "    </body>\n" +
                    "</html>\n" +
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
