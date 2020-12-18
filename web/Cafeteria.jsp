<%-- 
    Document   : Cafeteria
    Created on : 17/12/2020, 11:06:38 AM
    Author     : bocal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Cuentas" %>
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
    Cuentas c=opc.getCafeteriaById(idU);
    String tipo="";
    if(c.getPermisos()==3){
        tipo="cafeteria";
    }
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
            <li>Nombre:<%=c.getNomLocal()%> <br></li>
            <img src="obtenerImg?idI=<%=c.getIdC()%>">
            <li>Calle <%=c.getCalle()%><br></li>
            <li>Colonia: <%=c.getColonia()%><br></li>
            <li>Num  <%=c.getEx()%><br></li>
            <li>Correo  <%=c.getCorreo()%><br></li
            <li>Contraseña  <%=c.getContrasena()%><br></li
        </ul>
        <a href="CerrarSesion">Cerrar Sesion</a>
    <h2>Modificar</h2>
    <form enctype="multipart/form-data" action='ActualizarUsu' method='POST' name='formulario1'>
        <input type='hidden' name='idC' value='<%=c.getIdC()%>'/>
        <input type='hidden' name='perU' value='<%=3%>'/>
    <ul>
        <li>Imagen<input type="file" name="imgC"/></li>
        <li>Nombre Local: <input type='text' name='nomC' value='<%=c.getNomLocal()%>'/></li>
        <li>Calle: <input type='text' name='calleC' value='<%=c.getCalle()%>'/></li>
        <li>Colonia: <input type='text' name='colC' value='<%=c.getColonia()%>'/></li>
        <li>Num ex: <input type='text' name='numC' value='<%=c.getEx()%>'/></li>
        <input type="submit" value="Aceptar"/>
    </ul>
    </form>
    <h2>Eliminar</h2>
    <form action='EliminarUsu' method='POST'>
        <input type='hidden' name='idUE' value='<%=idU%>'/>
        <input type='hidden' name='perUE' value='<%=c.getPermisos()%>'/>
        <input type="submit" value="Eliminar"/>
    </form>
    </body>
</html>
<%
}
%>