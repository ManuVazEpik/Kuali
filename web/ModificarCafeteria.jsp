<%-- 
    Document   : ModificarCafeteria
    Created on : 6/01/2021, 01:55:28 PM
    Author     : bocal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Cafeteria" %>
<%@ page session="true" %>
<%
String idUS = "";
String usuario="";
HttpSession sessionOk = request.getSession();

if(sessionOk.getAttribute("usuario")==null || sessionOk.getAttribute("autorizacion")=="2" || 
        sessionOk.getAttribute("autorizacion")=="3" || sessionOk.getAttribute("autorizacion")=="0" ){
%>
        <jsp:forward page="index.html">
            <jsp:param name="error" value="Es obligatorio identificarse"/>
        </jsp:forward>}
<%   
}else if(sessionOk.getAttribute("autorizacion")=="1"){
    usuario = (String)sessionOk.getAttribute("usuario");
    idUS = (String)session.getAttribute("id");
    int idU=Integer.parseInt(idUS);
    Cafeteria opc = new Cafeteria();
    Cafeteria c=opc.getCafeteriaById(idU);
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cafeteria</title>
    </head>
    <body>
        <h1>Datos</h1>
        <ul>
            <li>Nombre:<%=c.getNom_caf()%> <br></li>
            <img src="obtenerImg?idI=<%=c.getId_caf()%>">
            <li>Direccion <%=c.getDir_caf()%><br></li>
        </ul>
        <a href="CerrarSesion">Cerrar Sesion</a>
    <h2>Modificar</h2>
    <form enctype="multipart/form-data" action='ActualizarCaf' method='POST' name='formulario1'>
        <input type='hidden' name='id_caf' value='<%=c.getId_caf()%>'/>
    <ul>
        <li>Imagen<input type="file" name="fot_caf"/></li>
        <li>Nombre Local: <input type='text' name='nom_caf' value='<%=c.getNom_caf()%>'/></li>
        <li>Direccion de la cafeteria: <input type='text' name='dir_caf' value='<%=c.getDir_caf()%>'/></li>
        <input type="submit" value="Aceptar"/>
    </ul>
    </form>
    <h2>Eliminar</h2>
    <form action='EliminarCaf' method='POST'>
        <input type='hidden' name='id' value='<%=c.getId_caf()%>'/>
        <input type="submit" value="Eliminar"/>
    </form>
    </body>
</html>
<%
}
%>