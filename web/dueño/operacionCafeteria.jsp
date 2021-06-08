<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Cafeteria" %>
<%@ page session="true" %>
<%
String idUS = "";
String usuario="";
HttpSession sessionOk = request.getSession();

if(sessionOk.getAttribute("usuario")==null){
   
%>
    <jsp:forward page="index.html">
        <jsp:param name="error" value="Es obligatorio identificarse"/>
    </jsp:forward>
<%   
}else if("0".equals(sessionOk.getAttribute("autorizacion"))){

%>
    <jsp:forward page="Cuentas.jsp">
        <jsp:param name="error" value="Es obligatorio identificarse"/>
    </jsp:forward>
<%
}else{

    usuario = (String)sessionOk.getAttribute("usuario");
    idUS = (String)session.getAttribute("id");

    int idU=Integer.parseInt(idUS);
    int id_caf=Integer.parseInt(request.getParameter("admrs").trim());
    Cafeteria opc = new Cafeteria();
    Cafeteria c=opc.getCafeteriaByIdCaf(id_caf);
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../img/logos/granoCafe.png" type="image/x-icon" rel="shortcut icon" />
        <title>Cafeteria</title>
    </head>
    <body>
        <a href="modificarCafeterias.jsp">Regresar</a>
    
    
    <h2>Modificar</h2>
    <form action='../ActualizarCaf' method='POST' name='formulario1'>
        <input type='hidden' name='id_caf' value='<%=c.getId_caf()%>'/>
    <ul>
        <a href="https://postimages.org" target="_blank">Accede a la siguiente página para subir la foto de tu cafeteria</a>.
        <p>Copia el url que dice DirectLink y pégalo en el siguiente campo de texto</p>
        <input type="text" name="fot_caf" value="<%=c.getFot_caf()%>"><br>
        <li>Nombre Local: <input type='text' name='nom_caf' value='<%=c.getNom_caf()%>'/></li>
        <li>Direccion de la cafeteria: <input type='text' name='dir_caf' value='<%=c.getDir_caf()%>'/></li>
        <input type="submit" value="Aceptar"/>
    </ul>
    </form>
    
    
    </body>
</html>
<%
}
%>