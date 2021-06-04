<%-- 
    Document   : añadirPedido
    Created on : 13/01/2021, 10:24:57 AM
    Author     : user
--%>

<%@page import="Clases.Cafeteria"%>
<%@page import="Clases.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Productos oprod = new Productos();
    Productos prod = oprod.getProductoById(Integer.parseInt(request.getParameter("id_prod")));
    Cafeteria caf = new Cafeteria();
    
%>
<html>
    <head>
        <title>Añadir Producto a tu pedido</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css\cafeteria.css">
    </head>
    <body>
        <% 
            String usuario = "";
            HttpSession sessionOk = request.getSession();
            if (sessionOk.getAttribute("usuario")== null) {
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
            <h2>¿Que comeras hoy?</h2>
        </div>
    
    </header>
        <h1 aling="center">Añadir Producto al Carrito</h1>
                    <table border="0" width="1060" aling="center">
                        
                        <form method="post" action="Pedidos">
                            <tr>
                                <th rowspan="5"><img src="<%= prod.getFot_prod()%>" width="140px" height="140px"></th> 
                                <th><input hidden="" type="number" name="idtxt" value="<%= prod.getId_prod()%>" readonly=""></th>
                            </tr>
                            <tr>
                                <th>Nombre</th>
                                <th><input type="text" name="nomtxt" value="<%= prod.getNom_prod()%>" readonly=""></th>
                            </tr>
                            <tr>
                                <th>Descripcion</th>
                                <th><input type="text" name="desctxt" value="<%= prod.getDesc_prod()%>" readonly=""></th>
                            </tr>
                            <tr>
                                <th>Precio</th>
                                <th><input type="text" name="preciotxt" value="<%= prod.getPre_prod()%>" readonly=""></th>
                            </tr>
                            <tr>
                                <th>Cantidad</th>
                                <th><input type="number" value="1" min="1" max="5" name="cantidadtxt"></th>
                            </tr>
                            <tr>
                                <th colspan="3"><input type="submit" value="Añadir" name="btnAñadir"></th>
                            </tr>
                        </form>
                        
                    </table>
    </body>
</html>
