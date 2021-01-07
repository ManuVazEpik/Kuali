<%-- 
    Document   : ModificarPro
    Created on : 6/01/2021, 07:08:23 PM
    Author     : bocal
--%>
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
}else if(sessionOk.getAttribute("autorizacion")==null){
%>
    <jsp:forward page="Cuentas.jsp">
        <jsp:param name="error" value="Es obligatorio identificarse"/>
    </jsp:forward>
<%
}else{
    usuario = (String)sessionOk.getAttribute("usuario");
    idUS = (String)session.getAttribute("id");
    int idU=Integer.parseInt(idUS);
    Cafeteria opc = new Cafeteria();
    Cafeteria c=opc.getCafeteriaById(idU);
    
    String id_proS=request.getParameter("id_pro");
    int id_prod=Integer.parseInt(id_proS);
    Productos opP = new Productos();
    Productos p=opP.getProductoById(id_prod);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>
    </head>
    <body>
        <h1>Modificar</h1>
        <form enctype="multipart/form-data" action="ActualizarPro" method="POST">
        <input type="hidden" name="id_caf"value="<%=p.getId_caf()%>"/>
        Ingresa el nombre del producto<input type="text" name="nom_prod" value="<%=p.getNom_prod()%>"/><br>
        Ingresa la descripcion del producto<input type="text" name="desc_prod" value="<%=p.getDesc_prod()%>"/><br>
        Ingresa el precio del producto<input type="text" name="pre_prod" value="<%=p.getPre_prod()%>"><br>
        <select>
            <option>Disponible</option>
            <option>NoDisponible</option>
        </select><br>
        Ingresa una foto del producto<input type="file" name="fot_prod" /><br>
        <input type="submit" value="Aceptar"/>
    </form>
    </body>
</html>
<%}%>