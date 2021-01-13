<%-- 
    Document   : SesionAdmin
    Created on : 5/01/2021, 07:00:00 PM
    Author     : bocal
--%>

<%@page import="Clases.Cafeteria"%>
<%@page import="Clases.Usuario"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String usuario = "";
HttpSession sesionOk = request.getSession();
String priv=(String)sesionOk.getAttribute("privilegio");
if (sesionOk.getAttribute("usuario") == null ) {
%>
<jsp:forward page="IniciarSesion.jsp">
<jsp:param name="error" value="Es obligatorio identificarse"/>
</jsp:forward>
<%
} else if("2".equals(priv)){
    response.sendRedirect("Cuentas.jsp");
} else {
    usuario = (String)sesionOk.getAttribute("usuario");
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SesionAdmin</title>
        <script data-ad-client="ca-pub-1261964740268428" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    </head>
    <body>
        <h1>Sesion Administrador</h1>
        <h3>Cafeterias por autorizar</h3>
        <%
        Cafeteria operC=new Cafeteria();
        ArrayList<Cafeteria> listaNoAut=operC.getCafeteriasPendientes();
        %>
        <table>
            <th>Id_caf</th>
            <th>Nombre_caf</th>
            <th>Direccion_caf</th>
            <th>Id Usuario</th>
            <th>Autorizar</th>
            <th>Rechazar</th>
    <%
        for(Cafeteria c:listaNoAut){
    %>
            <tr>
                <td><%=c.getId_caf()%></td>
                <td><%=c.getNom_caf()%></td>
                <td><%=c.getDir_caf()%></td>
                <td><%=c.getId_usu()%></td>
                <td><form action="Autorizar" method="POST">
                    <input type="hidden" name="id_usu" value="<%=c.getId_usu()%>"/>
                    <input type="hidden" name="tipo" value="1"/>
                    <input type="submit" value="Aceptar"/>
                </form></td>
                <td><form action="Autorizar" method="POST">
                    <input type="hidden" name="id_usu" value="<%=c.getId_usu()%>"/>
                    <input type="hidden" name="tipo" value="2"/>
                    <input type="submit" value="Aceptar"/>
                    </form></td>
            </tr>
    <%
        }
    %>
        </table>
        
        <h3>Cafeterias Autorizadas</h3>
        <%
        ArrayList<Cafeteria> listaAut=operC.getCafeteriasAutorizadas();
        %>
        <table>
            <th>Id_caf</th>
            <th>Nombre_caf</th>
            <th>Direccion_caf</th>
            <th>Id Usuario</th>
            <th>Eliminar</th>
    <%
        for(Cafeteria c:listaAut){
    %>
            <tr>
                <td><%=c.getId_caf()%></td>
                <td><%=c.getNom_caf()%></td>
                <td><%=c.getDir_caf()%></td>
                <td><%=c.getId_usu()%></td>
                <td><form action="EliminarUsu" method="POST">
                    <input type="hidden" name="id" value="<%=c.getId_caf()%>"/>
                    <input type="hidden" name="tipo" value="3"/>
                    <input type="submit" value="Eliminar"/>
                </form></td>
            </tr>
    <%
        }
    %>
        </table>
        
        <h3>Cafeterias Autorizadas</h3>
        <%
        Usuario u = new Usuario();
        ArrayList<Usuario> listaUsu=u.getUsuarios();
        
        %>
        <table>
            <th>Id_usu</th>
            <th>Nombre_usu</th>
            <th>Appat_usu</th>
            <th>Apmat_usu</th>
            <th>Email</th>
            <th>Contraseña</th>
            <th>Telefono</th>
            <th>Eliminar</th>
    <%
        for(Usuario c:listaUsu){
    %>
            <tr>
                <td><%=c.getId_usu()%></td>
                <td><%=c.getNom_usu()%></td>
                <td><%=c.getAppat_usu()%></td>
                <td><%=c.getApmat_usu()%></td>
                <td><%=c.getEmail_usu()%></td>
                <td><%=c.getPass_usu()%></td>
                <td><%=c.getTel_usu()%></td>
                <td><form action="EliminarUsu" method="POST">
                    <input type="hidden" name="id" value="<%=c.getId_usu()%>"/>
                    <input type="hidden" name="tipo" value="2"/>
                    <input type="submit" value="Eliminar"/>
                </form></td>
            </tr>
    <%
        }
    %>
        </table>
        <a href="CerrarSesion">Cerrar Sesion</a>
    </body>
</html>

