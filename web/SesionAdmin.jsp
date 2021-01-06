<%-- 
    Document   : SesionAdmin
    Created on : 5/01/2021, 07:00:00 PM
    Author     : bocal
--%>

<%@page import="Clases.Cuentas"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String usuario = "";
HttpSession sesionOk = request.getSession();
String priv=(String)sesionOk.getAttribute("privilegio");
System.out.println("aqui va un nuevo sout   "+priv);
if (sesionOk.getAttribute("usuario") == null ) {
%>
<jsp:forward page="IniciarSesion.jsp">
<jsp:param name="error" value="Es obligatorio identificarse"/>
</jsp:forward>
<%
} else if("2".equals(priv)){
    response.sendRedirect("Sesion.jsp");
} else {
    usuario = (String)sesionOk.getAttribute("usuario");
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SesionAdmin</title>
    </head>
    <body>
        <h1>Sesion Administrador</h1>
        <p>Cafeterias por autorizar</p>
        <%
        Cuentas operC=new Cuentas();
        ArrayList<Cuentas> listaNoAut=operC.getCafeteriasNoAutorizadas();
        %>
        <table>
            <th>Id_caf</th>
            <th>Nombre_caf</th>
            <th>Direccion_caf</th>
            <th>Id Usuario</th>
            <th>Autorizar</th>
    <%
        for(Cuentas c:listaNoAut){
            System.out.println("id del sesion admin"+c.getId_usu());
    %>
            <tr>
                <td><%=c.getId_caf()%></td>
                <td><%=c.getNom_caf()%></td>
                <td><%=c.getDir_caf()%></td>
                <td><%=c.getId_usu()%></td>
                <td><form action="Autorizar" method="POST">
                    <input type="hidden" name="id_usu" value="<%=c.getId_usu()%>"/>
                    <input type="submit" value="Autorizar"/>
                </form></td>
            </tr>
    <%
        }
    %>
        </table>
    </body>
</html>

