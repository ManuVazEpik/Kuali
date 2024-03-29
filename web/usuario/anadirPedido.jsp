<%@page import="Clases.Cafeteria"%>
<%@page import="Clases.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Productos oprod = new Productos();
    
    Cafeteria caf = new Cafeteria();
    int id_prod=0;
    int id_caf=0;
    try{
        id_prod = Integer.parseInt(request.getParameter("admrs").trim());
        id_caf = Integer.parseInt(request.getParameter("ewewe").trim());
    }catch(Exception e){
        response.sendRedirect("../error.jsp");
    }
    Productos prod = oprod.getProductoById(id_prod);
%>
<html lang="es">
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../img/logos/granoCafe.png" type="image/x-icon" rel="shortcut icon" />
    <link rel="stylesheet" href="../css/externals/normalize.css">
    <link rel="stylesheet" href="../css/anadirpedido.css">
    <script data-ad-client="ca-pub-1261964740268428" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <title>Agregar Producto | KUALI</title>
    </head>
    <body>
    <% 
        String usuario = "";
        HttpSession sessionOk = request.getSession();
        if (sessionOk.getAttribute("usuario")== null) {
            response.sendRedirect("../error.jsp?admrs=2"); 
        }else{
            usuario = (String)sessionOk.getAttribute("usuario");
        }
    %>
    <div class="contenedor-principal">
        <nav class="menu">
            <div class="logo">
                <a href="./inicioUsuarios.jsp"><img src="../img/logos/Logo_negro.png" alt="Logotipo de KUALI color blanco"></a>
            </div>
            
            <div class="pedidos-agendados">
                <a href="../pedidosAgendados.jsp"><i class="fas fa-calendar-alt fa-lg"></i>Mis Pedidos Agendados</a>
            </div>

            <div class="ubicacion">
                <a href="./carritoCompras.jsp"><i class="fas fa-shopping-cart fa-lg"></i>Carrito de compras</a>
            </div>

            <div class="ubicacion">
                <a href="./ajustesUsuarios.jsp"><i class="fas fa-user-cog fa-lg"></i>Perfil</a>
            </div>

            <div class="opciones-usuario">         
                <a href="../IniciarSesion.html"><img src="../img/usuario-perfil.png" alt="imagen de perfil del usuario actual"></a>
            </div>
        </nav>

        <div class="agregar-pedido">
            <h1 class="titulo-principal">Añadir Producto al Carrito</h1>

            <table>
                <form method="POST" action="../Pedidos">
                    <tr>
                        <th rowspan="5"><img src="<%= prod.getFot_prod()%>" width="150px" height="150px"></th> 
                        <th><input hidden="" type="number" name="idtxt" value="<%= prod.getId_prod()%>" readonly="">
                        <input hidden="" type="number" name="id_caftxt" value="<%=id_caf%>" readonly=""></th>
                        </th>
                    </tr>
                    <tr>
                        <th class="texto">Nombre</th>
                        <th class="texto"><%= prod.getNom_prod()%>
                            <input type="hidden" name="nomtxt" value="<%= prod.getNom_prod()%>" readonly=""></th>
                    </tr>
                    <tr>
                        <th class="texto">Descripcion</th>
                        <th class="texto"><%= prod.getDesc_prod()%>
                            <input type="hidden" name="desctxt" value="<%= prod.getDesc_prod()%>" readonly=""></th>
                    </tr>
                    <tr>
                        <th class="texto">Precio</th>
                        <th class="texto">$<%= prod.getPre_prod()%>
                            <input type="hidden" name="preciotxt" value="<%= prod.getPre_prod()%>" readonly=""></th>
                    </tr>
                    <tr>
                        <th class="texto">Cantidad</th>
                        <th class="texto"><input type="number" value="1" min="1" max="5" name="cantidadtxt"></th>
                    </tr>
                    <tr class="boton">
                        <th></th><th colspan="3"><input type="submit" value="Añadir" name="btnAñadir"></th>
                    </tr>
                </form>
            </table>
        </div>
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
                <a href="../avisoPrivacidad.html">Política de privacidad</a>
                <a href="../terminosyCondiciones.html">Terminos y Condiciones</a>
            </div>
        </div>
    </footer>
    
    <!-- SCRIPTS -->
    <script src="https://kit.fontawesome.com/59bcf5d722.js" crossorigin="anonymous"></script>

    </body>
</html>
