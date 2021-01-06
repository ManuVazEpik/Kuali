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
    
    String id_cafS=request.getParameter("id_caf");
    int id_caf=Integer.parseInt(id_cafS);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cafeteria</title>
    </head>
    <body>
        <table border="0" aling="center" width="1060px" style="font-size: 20px">
        <%
            ArrayList<Productos> lp = Productos.getProductosCaf(id_caf);
            int salto=0;            
            for (Productos prod: lp) {
        %>                        
                    <th>
                        <img src="obtenerImg?idI=<%=prod.getId_prod()%>"><p>
                            <%= prod.getNom_prod()%><br>
                            Descripcion: <%= prod.getDesc_prod()%><br>
                            Precio <%= prod.getPre_prod()%><br>
                            <input hidden value="<%= prod.getDisp_prod()%>"><br>
                            <a href="anadirPedido.jsp?id=<%= prod.getId_prod()%>" style="color:white">Añadir</a>
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
        %>
        </table>
    </body>
</html>
<%
}
%>