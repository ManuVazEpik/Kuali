<%-- 
    Document   : Cafeteria
    Created on : 17/12/2020, 11:06:38 AM
    Author     : bocal
--%>

<%@page import="Clases.Productos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page session="true" %>
<%
String idUS = "";
String usuario="";
HttpSession sessionOk = request.getSession();

if(sessionOk.getAttribute("usuario")==null){
%>
        <jsp:forward page="index.html">
            <jsp:param name="error" value="Es obligatorio identificarse"/>
        </jsp:forward>}
<%   
}else{
    usuario = (String)sessionOk.getAttribute("usuario");
    idUS = (String)session.getAttribute("id");
    int idU=Integer.parseInt(idUS);
    
    int id_caf=0;
    String id_cafS=""; 
    
    try{
        
        id_caf = Integer.parseInt(request.getParameter("id"));
        
        
    }catch(Exception e){
    
        System.out.println("Error " + e);
        response.sendRedirect("e500.html");
        
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cafeteria </title>
        <script data-ad-client="ca-pub-1261964740268428" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <link rel="stylesheet" type="text/css" href="css\cafeteria.css">
    </head>
    <body>
        <header>
        
        <nav id="nav" class="nav1">
            <div class="contenedor-nav">
                <div class="logo">
                    <img src="" alt="">
                </div>
                <div class="enlaces" id="enlaces">
                    <!--<a href="IniciarSesion.jsp" id="enlace-" class="btn-header">Inicio de sesión</a>
                    <a href="RegistrarUsuario.html" id="enlace-" class="btn-header">Registrarse</a>-->
                    <a href="index.jsp" id="enlace-" class="btn-header">Cafeterias</a>
                </div>
                <div class="icono" id="open">
                    <span>&#9776</span>
                </div>
                
            </div>
        </nav>
        
        <div class="letras">
            <h1>Instant Lunch</h1>
            <h2>¿Que comeras hoy?</h2>
        </div>
    
    </header>
        <table border="0" aling="center" width="1060px" style="font-size: 20px">
        <%
    
    try{
    
            ArrayList<Productos> lp = Productos.getProductosCaf(id_caf);
            int salto=0;            
            for (Productos prod: lp) {
        %>                        
                    <th>
                        <a href="añadirPedido.jsp?id=<%= prod.getId_prod()%>"><img src="<%=prod.getFot_prod()%>" ></a><p>
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
                response.sendRedirect("e500.jsp");
            
            }
        %>
        </table>
    </body>
</html>
<%
}
%>
