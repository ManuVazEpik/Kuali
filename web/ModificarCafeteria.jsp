<%-- 
    Document   : ModificarCafeteria
    Created on : 6/01/2021, 01:55:28 PM
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
        
    <h2>Registrar producto nuevo</h2>
    <form enctype="multipart/form-data" action="RegistrarPro" method="POST">
        <input type="hidden" name="id_caf"value="<%=c.getId_caf()%>"/>
        Ingresa el nombre del producto<input type="text" name="nom_prod"/><br>
        Ingresa la descripcion del producto<input type="text" name="desc_prod"/><br>
        Ingresa el precio del producto<input type="text" name="pre_prod"/><br>
        Ingresa una foto del producto<input type="file" name="fot_prod"/><br>
        <input type="submit" value="Aceptar"/>
    </form>

    <h2>Producto cafeteria</h2>
    <table>
        <th>Id_producto</th>
        <th>Nombre</th>
        <th>Descripcion</th>
        <th>Precio</th>
        <th>Img</th>
        <th>Disponibilidad</th>
        <th>Modificar</th>
        <th>Eliminar</th>
        <%
        Productos opP = new Productos();
        ArrayList<Productos> listap=opP.getProductosCaf(c.getId_caf());
        for(Productos p:listap){
            
    %>
            <tr>
                <td><%=p.getId_prod()%></td>
                <td><%=p.getNom_prod()%></td>
                <td><%=p.getDesc_prod()%></td>
                <td><%=p.getPre_prod()%></td>
                <td><img src="ObtenerImgP?idI=<%=p.getId_prod()%>"></td>
                <%if(p.getDisp_prod()==true){%>
                <td>Disponible</td>
                <%}else{%>
                <td>NoDisponible</td>
                <%}%>
                <td><form action="ModificarPro.jsp" method="POST">
                    <input type="hidden" name="id_pro" value="<%=p.getId_prod()%>"/>
                    <input type="submit" value="Aceptar"/>
                </form></td>
                <td><form action="EliminarPro" method="POST">
                    <input type="hidden" name="id_prod" value="<%=p.getId_prod()%>"/>
                    <input type="submit" value="Aceptar"/>
                    </form></td>
            </tr>
    <%
        }
    %>
    </table>
                
    </body>
</html>
<%
}
%>