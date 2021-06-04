<%-- 
    Document   : Pedido
    Created on : 13/01/2021, 12:14:14 PM
    Author     : user
--%>

<%@page import="java.time.*"%>
<%@page import="Clases.Productos"%>
<%@page import="Clases.DetallePedido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<DetallePedido> productos = session.getAttribute("carrito") == null ? null : (ArrayList) session.getAttribute("carrito") ;
    LocalDate date = LocalDate.now();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css\cafeteria.css">
    </head>
    <body>
        <% 
            String usuario = "";
            HttpSession sessionOk = request.getSession();
            if (sessionOk.getAttribute("id")== null){
        %>
        
        <jsp:forward page="index.jsp">
            <jsp:param name="error" value="es obligatorio identificarse"></jsp:param>
        </jsp:forward>
        
        <%
            }else{
                usuario = (String)sessionOk.getAttribute("usuario");
            }
        %>
        <header>
        
        <nav id="nav" class="nav1">
            <div class="contenedor-nav">
                <div class="logo">
                    <img src="" alt="">
                </div>
                <div class="enlaces" id="enlaces">
                    <!--<a href="IniciarSesion.jsp" id="enlace-" class="btn-header">Inicio de sesión</a>
                    <a href="RegistrarUsuario.html" id="enlace-" class="btn-header">Registrarse</a>-->
                    <a href="index.jsp" id="enlace-" class="btn-header">Cafeterias</a>
                    <a href="Pedido.jsp" id="enlace-" class="btn-header">Canasta</a>
                </div>
                <div class="icono" id="open">
                    <span>&#9776</span>
                </div>
            </div>
        </nav>
        <div class="letras">
            <h1>Instant Lunch</h1>
        </div>
    </header>
    <%
        double total = 0;
        if (productos != null){
    %>
        <table border="1px" width="1000px" style="font-size: 20px">
            <tr>
                <td>
                    <h1>Producto</h1>
                </td>
                <td>
                    <h1>Nombre</h1>
                </td>
                <td>
                    <h1>Precio</h1>
                </td>
                <td>
                    <h1>Cantidad</h1>
                </td>
                <td>
                    <h1>SubTotal</h1>
                </td>
                <td>

                </td>
            </tr>
        <%for (DetallePedido a: productos) {
            Productos oprod = new Productos();
            Productos prod = oprod.getProductoById(a.getId_prod());
        %>
            <tr>
                <td>
                    <a href=""><img src="<%=prod.getFot_prod()%>"></a>
                </td>
                <td>
                    <input type="text" name="nombre" value="<%=prod.getNom_prod()%>" autocomplete="off" size="2" readonly>
                </td>
                <td>
                    <input type="text" name="precio" value="<%=prod.getPre_prod()%>" autocomplete="off" size="2" readonly>
                </td>
                <td>
                    <div>
                        <input type="text" name="cantidad" value="<%=a.getCant_detPed()%>" autocomplete="off" size="2" readonly>
                    </div>
                </td>
                <td>
                    <input type="text" name="subtotal" value="<%=a.getSub_detPed()%>" autocomplete="off" size="2" readonly>
                    <%  total = total + a.getSub_detPed();
                    %>
                </td>
                <td>
                    <form action="EliminarDelCarro" method="POST">
                        <% System.out.println(prod.getId_prod()); %>
                        <input type="hidden" value="<%=prod.getId_prod()%>" name="id_elm">
                        <input type="submit" value="X">

                    </form>
                </td>
            </tr>
        
        <br>
    <%} %>
    </table>
    <form action="Ordenar" method="POST">
        Total a pagar: <input type="text" name="total" value="<%= total%>" readonly=""><br>
        Fecha<input type="date" name="fecha"/><br>
        Hora<input type="number" name="hora"/><br>
        Min<input type="number" name="minuto"/><br>
        <%--<input hidden="" name="fecha" value="<%date.toString();%>">--%>
        <input type="hidden" name="id_usu" value="<%= sessionOk.getAttribute("id") %>">
        <input type="submit" value="Ordenar">
    </form>
    <%
    }else{%>
    <h1>No hay Articulos en el carro</h1> 
    <%}
    %>
                
    </body>
</html>
