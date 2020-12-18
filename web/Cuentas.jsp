<%-- 
    Document   : Cuentas
    Created on : 10/12/2020, 12:22:20 PM
    Author     : bocal
--%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Cuentas" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
System.out.println("s");
    usuario = (String)sessionOk.getAttribute("usuario");
    idUS = (String)session.getAttribute("id");
    int idU=Integer.parseInt(idUS);
    Cuentas opc = new Cuentas();
    Cuentas u=opc.getUsuarioById(idU);
    String tipo="";
    if(u.getPermisos()==2){
        tipo="cliente";
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cuentas</title>
    </head>
    <body>

    <h1>Datos</h1>
    <ul>
        <li>Nombre completo:<%=u.getNombre()+" "+u.getAppat()+" "+u.getApmat()%> <br></li>
        <li>Telefono: <%=u.getTel()%></li>
        <li>Correo <%=u.getCorreo()%><br></li>
        <li>Contraseña: <%=u.getContrasena()%><br></li>
        <li>Tipo de Cuenta: <%=tipo%><br></li>
    </ul>
    
    <a href="CerrarSesion">Cerrar Sesion</a>
    <h2>Modificar</h2>
    <form action='ActualizarUsu' method='POST' name='formulario1'>
        <input type='hidden' name='idU' value='<%=idU%>'/>
        <input type='hidden' name='perU' value='<%=u.getPermisos()%>'/>
    
    <ul>
        <li>Nombre: <input type='text' name='nomU' value='<%=u.getNombre()%>'/></li>
        <li>Apellido paterno: <input type='text' name='appatU' value='<%=u.getAppat()%>'/></li>
        <li>Apellido materno: <input type='text' name='apmatU' value='<%=u.getApmat()%>'/></li>
        <li>Telefono: <input type='text' name='telU' value='<%=u.getTel()%>'/></li>
        <input type="submit" value="Aceptar"/>
    </ul>
    </form>
    <h2>Eliminar</h2>
    <form action='EliminarUsu' method='POST'>
        <input type='hidden' name='idUE' value='<%=idU%>'/>
        <input type='hidden' name='perUE' value='<%=u.getPermisos()%>'/>
        <input type="submit" value="Eliminar"/>
    </form>
    </body>
</html>
<%}%>
