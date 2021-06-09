<%@page import="Clases.Usuario"%>
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
    response.sendRedirect("../error.jsp?admrs=2");
}else if(sessionOk.getAttribute("autorizacion")==null){
    response.sendRedirect("../error.jsp?admrs=2");
}else{
    usuario = (String)sessionOk.getAttribute("usuario");
    idUS = (String)session.getAttribute("id");
    int id_usu=Integer.parseInt(idUS);
    Cafeteria opc = new Cafeteria();
    int id_caf = Integer.parseInt(request.getParameter("id_caf").trim());
    Cafeteria c=opc.getCafeteriaByIdCaf(id_caf);
    
    String id_proS=request.getParameter("id_pro");
    int id_prod=Integer.parseInt(id_proS);
    Productos opP = new Productos();
    Productos p=opP.getProductoById(id_prod);
    Usuario opu = new Usuario();
    Usuario u=opu.getUsuarioById(id_usu);
    
    if (u.getPerm_usu()==3){
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Producto | Kuali</title>
    </head>
    <body>
        <a href='operacionProductos.jsp?admrs=<%=id_caf%>'>Regresar</a>
        <h1>Modificar</h1>
        <form name="formRegistroProducto" action="../ActualizarPro" method="POST">
        
        Ingresa el nombre del producto<input type="text" name="nom_prod" value="<%=p.getNom_prod()%>"/><br>
        Ingresa la descripcion del producto<input type="text" name="desc_prod" value="<%=p.getDesc_prod()%>"/><br>
        Ingresa el precio del producto<input type="text" name="pre_prod" value="<%=p.getPre_prod()%>"><br>
        <a href="https://postimages.org" target="_blank">Nueva foto</a>.
        Ingresa una foto del producto<input type="text" name="fot_prod" value="<%=p.getFot_prod()%>"/><br>
        <input type="hidden" name='id_prod' value="<%=p.getId_prod()%>">
        <input type="hidden" name='id_caf' value="<%=c.getId_caf()%>">
        <input onclick="return validar()" type="submit" value="Aceptar"/>
    </form>
        <script src="../js/validarRegistroProducto.js"></script>
    </body>
</html>
<%
    }else if(u.getPerm_usu()==2){
        response.sendRedirect("../usuario/inicioUsuarios.jsp");
    }else if(u.getPerm_usu()==1){
        response.sendRedirect("../administradorGeneral/administrarUsuarios.jsp");
    }else{
        response.sendRedirect("../index.html");
    }

}
%>