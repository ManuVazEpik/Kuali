<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clases.Productos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page session="true" %>
<%
String idUS = "";
String usuario="";
HttpSession sessionOk = request.getSession();

boolean ex=true;
if(sessionOk.getAttribute("usuario")==null){
%>
        <jsp:forward page="../index.html">
            <jsp:param name="error" value="Es obligatorio identificarse"/>
        </jsp:forward>
<%   
}else{
    usuario = (String)sessionOk.getAttribute("usuario");
    idUS = (String)session.getAttribute("id");
    int id_caf=0;
    
    try{

        id_caf = Integer.parseInt(request.getParameter("qwer"));

    }catch(Exception e){
        System.out.println("Error " + e);
        response.sendRedirect("../error.jsp");
    }
    
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú | Kuali </title>
        <script data-ad-client="ca-pub-1261964740268428" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    </head>
    <body>
    <header>
        <a href="inicioUsuarios.jsp" >Inicio</a>
    </header>
        <table>
        <%
    
    try{
    
            ArrayList<Productos> lp = Productos.getProductosDisCaf(id_caf);
            int salto=0;            
            for (Productos prod: lp) {
        %>                        
            <th>
                <a href="añadirPedido.jsp?admrs=<%= prod.getId_prod()%>&ewewe=<%=id_caf%>"><img src="<%=prod.getFot_prod()%>" width="200pt" ></a><p>
                    <%= prod.getNom_prod()%><br>
                    Descripcion: <%= prod.getDesc_prod()%><br>
                    Precio <%= prod.getPre_prod()%><br>
                    <input type="hidden" value="<%= prod.getDisp_prod()%>"><br>
            </th>
        <%
            salto++;
            if (salto == 4) {
        %>
        <tr>
        <%
                salto=0;
            }
           }
            
            }catch(Exception e){
            
                System.out.println("Error" + e);
                response.sendRedirect("../error.jsp");
            
            }
        %>
        </table>
    </body>
</html>
<%
}
%>
