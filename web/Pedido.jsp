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
    </head>
    <body>
        <% 
            String usuario = "";
            HttpSession sessionOk = request.getSession();
            if (sessionOk.getAttribute("usuario")== null || (Integer) sessionOk.getAttribute("privilegio") != 0){
        %>
        
        <jsp:forward page="index.jsp">
            <jsp:param name="error" value="es obligatorio identificarse"></jsp:param>
        </jsp:forward>
        
        <%
            }else{
                usuario = (String)sessionOk.getAttribute("usuario");
            }
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
                
                <%
                    float total = 0;
                    if (productos != null){
                        for (DetallePedido a: productos) {
                                Productos prod = Productos.getProductoById(a.getId_prod());
                %>
                <tr>
                    <td>
                        <a href=""><img src="images/<%=prod.getFot_prod()%>"></a>
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
                        <form action="eliminarProd" method="post">
                            <input type="hidden" value="<%=prod.getId_prod()%>" name="idtxt">
                            <input type="submit" value="X">
                                
                        </form>
                    </td>
                </tr>
                <tr>
                    <%} %>
                    <<form action="crearOrden">
                    Total a pagar:
                    </td>
                    <td>
                        <input hidden="" name="hora" value="<%date.toString();%>">
                    </td>
                    <td>
                        <input type="submit" value="Ordenar">
                    </td>
                    </form>
                </tr>
                </table>
                <%
                }else{%>
                <h1>No hay Articulos en el carro</h1> 
                <%}
                %>
                
    </body>
</html>
