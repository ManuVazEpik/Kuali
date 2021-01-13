<%-- 
    Document   : index.jsp
    Created on : 13/01/2021, 10:48:15 AM
    Author     : user
--%>

<%@page import="Clases.Cafeteria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="0" aling="center" width="1060px" style="font-size: 20px">
        <%
            ArrayList<Cafeteria> lp = Cafeteria.getCafeteriasAutorizadas();
            int salto=0;            
            for (Cafeteria caf: lp) {
        %>                        
                    <th>
                        <img src="<%=caf.getFot_caf()%>" href="Cafeteria.jsp?id=<%=caf.getId_caf()%>"><p>
                            <%= caf.getNom_caf()%><br>
                            Direccion: <%= caf.getDir_caf()%><br>
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
