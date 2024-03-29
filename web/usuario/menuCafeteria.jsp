<%@page import="Clases.Cafeteria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clases.Productos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page session="true" %>
<%
String idUS = "";
String usuario="";
HttpSession sessionOk = request.getSession();

boolean ex=true;
if(sessionOk.getAttribute("usuario")==null){
    response.sendRedirect("../error.jsp?admrs=2");  
}else{
    usuario = (String)sessionOk.getAttribute("usuario");
    idUS = (String)session.getAttribute("id");
    int id_caf=0;
    
    try{

        id_caf = Integer.parseInt(request.getParameter("qwer"));

    }catch(Exception e){
        System.out.println("Error " + e);
        response.sendRedirect("../error.jsp");
    }
    
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/externals/normalize.css">
    <link rel="stylesheet" href="../css/menuCafeteria.css">
    <script data-ad-client="ca-pub-1261964740268428" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <title>Menú | KUALI</title>
    </head>
    <body>
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

        <div class="header">
            <!-- <img src="../img/logos-cafeterias/logo cafeteria test.jpg" alt="Logo cafeteria"> -->
        </div>
        <%
        try{
            ArrayList<Productos> lp = Productos.getProductosDisCaf(id_caf);
            Cafeteria opc = new Cafeteria();
            Cafeteria c = opc.getCafeteriaByIdCaf(id_caf);
        %>
            <div class="menu-cafeteria">
                <h1 class="titulo-principal"><%=c.getNom_caf()%></h1>
                <p class="titulo-terciario"><%=c.getDir_caf()%></p>
                <div class="grid-menu">
        <%
            for (Productos prod: lp) {
        %>                        
                    <div class="producto">
                        <div class="imagen-producto">
                            <img src="<%=prod.getFot_prod()%>" alt="Imagen del cafe de moka">
                        </div>

                        <div class="descripcion">
                            <p class="texto nombre"><%=prod.getNom_prod()%></p>
                            <p class="texto"><%= prod.getDesc_prod()%></p>
                            <p class="texto"><%=prod.getPre_prod()%></p>
                            <form action="anadirPedido.jsp" method="POST">
                                <input type="hidden" name="admrs" value="<%=prod.getId_prod()%>"/>
                                <input type="hidden" name="ewewe" value="<%=id_caf%>"/>
                                <button type="submit"><i class="fas fa-shopping-cart"></i> Agregar al carrito</button>
                            </form>
                        </div>
                    </div>
        <%
            }
        }catch(Exception e){
            System.out.println("Error" + e);
            response.sendRedirect("../error.jsp");
        }
        %>
                </div>
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
                <a href="./avisoPrivacidad.html">Política de privacidad</a>
                <a href="./terminosyCondiciones.html">Terminos y Condiciones</a>
            </div>
        </div>
    </footer>
    <!-- SCRIPTS -->
    <script src="https://kit.fontawesome.com/59bcf5d722.js" crossorigin="anonymous"></script>            
    </body>
</html>
<%
}
%>
