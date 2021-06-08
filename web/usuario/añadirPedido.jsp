
<%@page import="Clases.Cafeteria"%>
<%@page import="Clases.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Productos oprod = new Productos();
    Productos prod = oprod.getProductoById(Integer.parseInt(request.getParameter("id_prod")));
    Cafeteria caf = new Cafeteria();
    
%>
<html lang="es">
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../img/logos/granoCafe.png" type="image/x-icon" rel="shortcut icon" />
    <link rel="stylesheet" href="../css/externals/normalize.css">
    <link rel="stylesheet" href="../css/ajustesUsuarios.css">
    <title>Ajustes | KUALI</title>
    </head>
    <body>
    <% 
        String usuario = "";
        HttpSession sessionOk = request.getSession();
        if (sessionOk.getAttribute("usuario")== null) {
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
                <a href="./carritoCompras.jsp"><i class="fas fa-map-marker-alt fa-lg"></i>Carrito de compras</a>
            </div>
            
            <div class="ubicacion">
                <a href="./inicioUsuarios.jsp"><i class="fas fa-map-marker-alt fa-lg"></i>Cafeterías</a>
            </div>
    
            <div class="opciones-usuario">
                
                <img src="../img/perfil-ejemplo.jpg" alt="imagen de perfil del usuario actual">
            </div>
        </nav>
        <h1>Añadir Producto al Carrito</h1>
            <table>
                <form method="POST" action="../Pedidos">
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
