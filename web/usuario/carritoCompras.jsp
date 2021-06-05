<%@page import="java.time.*"%>
<%@page import="Clases.Productos"%>
<%@page import="Clases.DetallePedido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/externals/normalize.css">
    <link rel="stylesheet" href="../css/ajustesUsuarios.css">
    <title>Ajustes | KUALI</title>
</head>
<body>
    <%
        String usuario = "";
        HttpSession sessionOk = request.getSession();
        if (sessionOk.getAttribute("id")== null){
    %>

    <jsp:forward page="../index.html">
        <jsp:param name="error" value="es obligatorio identificarse"></jsp:param>
    </jsp:forward>

    <%
        }else{
            usuario = (String)sessionOk.getAttribute("usuario");
        }
    %>
    <div class="contenedor-principal">
        <nav class="menu">
            <div class="logo">
                <a href="../index.html"><img src="../img/logos/Logo_negro.png" alt="Logotipo de KUALI color blanco"></a>
            </div>
            
            <div class="ubicacion">
                <a href="./inicioUsuarios.jsp"><i class="fas fa-map-marker-alt fa-lg"></i>Cafeterías</a>
            </div>
            
            <div class="pedidos-agendados">
                <a href="./pedidosAgendados.html"><i class="fas fa-calendar-alt fa-lg"></i>Mis Pedidos Agendados</a>
            </div>
            
            <div class="ubicacion">
                <a href="./ajustesUsuarios.jsp"><i class="fas fa-map-marker-alt fa-lg"></i>Perfil</a>
            </div>
    
            <div class="opciones-usuario">
                
                <img src="../img/perfil-ejemplo.jpg" alt="imagen de perfil del usuario actual">
            </div>
        </nav>
        
        <%
    ArrayList<DetallePedido> productos = session.getAttribute("carrito") == null ? null : (ArrayList) session.getAttribute("carrito") ;
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
                    <form action="../EliminarDelCarro" method="POST">
                        <% System.out.println(prod.getId_prod()); %>
                        <input type="hidden" value="<%=prod.getId_prod()%>" name="id_elm">
                        <input type="submit" value="X">

                    </form>
                </td>
            </tr>
        
        <br>
    <%} %>
    </table>
    <form action="../Ordenar" method="POST">
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
    </div>

    <footer>
        <div class="presentacion-kuali">
            <h3>KUALI</h3>
            <p>El único sistema de servicio instantáneo y reservaciones en la CDMX.</p>
        </div>

        <div class="redes-sociales">

        </div>

        <div class="derechos">
            <p>© 2021 Axolo Software. Todos los derechos reservados.</p>
            <div class="enlacer">
                <a href="./avisoPrivacidad.html">Política de privacidad</a>
                <a href="./terminosyCondiciones.html">Terminos y Condiciones</a>
            </div>
        </div>
    </footer>
    
    <!-- SCRIPTS -->
    <script src="https://kit.fontawesome.com/59bcf5d722.js" crossorigin="anonymous"></script>
</body>
</html>