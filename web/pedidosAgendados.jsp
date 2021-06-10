<%@page import="Clases.Minuto"%>
<%@page import="Clases.Hora"%>
<%@page import="Clases.Usuario"%>
<%@page import="Clases.Cafeteria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.DetallePedido"%>
<%@page import="Clases.Pedido"%>
<%@page import="Clases.Productos"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String idUS = "";
HttpSession sessionOk = request.getSession();

if(sessionOk.getAttribute("usuario")==null){
    response.sendRedirect("../error.jsp?admrs=2");
}else{

    idUS = (String)session.getAttribute("id");    
    Cafeteria opcaf= new Cafeteria();
    Pedido opP = new Pedido();
    boolean caftener = opcaf.comprobarCafExiste(Integer.parseInt(idUS));
    
    if(caftener==true){
        String id_cafS=request.getParameter("admrs");
        
        int id_caf=0;
        if (id_cafS==null) {
            response.sendRedirect("dueno/verCafeterias.jsp");
        }else{
            id_caf=Integer.parseInt(id_cafS);
        }
        Pedido.checkoutPendientes(id_caf, false);
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/externals/normalize.css">
        <link rel="stylesheet" href="css/pedidosAgendados.css">
        <script data-ad-client="ca-pub-1261964740268428" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        
        <title>Pedidos Agendados | KUALI</title>
        
        <script>
            function aviso(){
            <%
                String confS = request.getParameter("kik");
                if(confS !=null)  {
                    int conf = Integer.parseInt(confS);
                    if (conf==1) {
            %>
                    alert("Se ha cancelado");
            <%  
                    }else if(conf==2){
            %>
                    alert("No se ha cancelado");
            <%
                    }
                }
            %>
            }
        </script>
    </head>
    <body onload="aviso()">
    <div class="contenedor-principal">
        <nav class="menu">
            <div class="logo">
                <a href="../usuario/inicioUsuarios.jsp"><img src="img/logos/Logo_negro.png" alt="Logotipo de KUALI color blanco"></a>
            </div>
            
            <div class="ubicacion">
                <a href="./dueno/verCafeterias.jsp"><i class="fas fa-map-marker-alt fa-lg"></i>Administrar Cafeterias</a>
            </div>
    
            <div class="pedidos-agendados">
                <a href="./usuario/ajustesUsuarios.jsp"><i class="fas fa-calendar-alt fa-lg"></i>Perfil</a>
            </div>
    
            <div class="opciones-usuario">
                <div class="caja_busqueda">
                    <input class="card-filter" type="search" id='buscar-en-usuarios' placeholder="Buscar ...">
                    
                    <a class="boton_buscar">
                        <i class="fas fa-search"></i>
                    </a>
                </div>
                
                <img src="img/perfil-ejemplo.jpg" alt="imagen de perfil del usuario actual">
            </div>
        </nav>
        <h1 align="center">Pedidos Agendados</h1>
        
        <%
        DetallePedido odp = new DetallePedido();
        Pedido op = new Pedido();
        ArrayList<Pedido> listap= op.getPedidosCaf(id_caf);
        
        //ArrayList<DetallePedido> listadp = odp.getDetallePedidoCaf(id_caf);
        //for(DetallePedido dp:listadp){
        int contador=0;
        for(Pedido p:listap){
            
            boolean finalizar= opP.comprobarFinalizacion(p.getId_ped());
            
            if(contador!=p.getId_ped()){
                ArrayList<DetallePedido> listadp=odp.getDetallePedidoCaf(p.getId_ped());
                Usuario ou= new Usuario();
                Usuario u = ou.getUsuarioById(p.getId_usu());
                Hora oh=new Hora();
                Hora h= oh.getHoraById(p.getId_hora());
                Minuto om=new Minuto();
                Minuto m=om.getMinutoById(p.getId_min());
        %>
        <div class="pedidos">
            <div class="contenedor-pedido">
                
                    <%
                        for(DetallePedido dp: listadp){
                            Productos oprod = new Productos();
                            Productos prod = oprod.getProductoById(dp.getId_prod());
                    %>
                <div class="pedido">
                    <p class="titulo-cuarto"><%=dp.getCant_detPed()%> <%=prod.getNom_prod()%></p>
                    <i class="fas fa-angle-down fa-lg"></i>
                </div>
                    <%
                        }
                    %>
                
                <div class="descripcion">
                    <p class="texto">Nombre del Cliente: <%=u.getNom_usu()%> <%=u.getAppat_usu()%> <%=u.getApmat_usu()%></p>
                    <p class="texto">Fecha: <%=p.getFecha_ped()%></p>
                    <p class="texto">Hora: <%=h.getHora()%>:<%=m.getMinuto()%></p>
                    <p class="texto">Costo Total: <%=p.getTot_ped()%></p>
                    <form action="CancelarPedido" method="POST" >
                    <input type="hidden" name="id_pedido" value="<%=p.getId_ped()%>"/>
                    <button type="submit" onclick="return confirmacion()"><i class="fas fa-times"></i> Cancelar pedido</button>
                    </form>
            <%
                if(finalizar==true){
            %>
                    <form action="FinalizarPedido" method="POST" >
                    <input type="hidden" name="id_pedido" value="<%=p.getId_ped()%>"/>
                    <input type="submit" value="Finalizar Pedido"/>
                    </form>
                </div>
            </div>
        </div>
                    <%
                        }else{
                    %>
                </div>
            </div>
        </div>
            <%
                }
            }
            contador=p.getId_ped();
        }
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
    <script type="module" src="js/pedidosAgendados.js"></script>    
    <script src="js/Cancelacion.js"></script>
    </body>
</html>
<%
    }else{
        Pedido.checkoutPendientes(Integer.parseInt(idUS), true);
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/externals/normalize.css">
        <link rel="stylesheet" href="css/pedidosAgendados.css">
        <title>Pedidos Agendados | KUALI</title>
    <script>
            function aviso(){
            <%
                String confS = request.getParameter("kik");
                if(confS !=null)  {
                    int conf = Integer.parseInt(confS);
                    if (conf==1) {
            %>
                    alert("Se ha cancelado");
            <%  
                    }else if(conf==2){
            %>
                    alert("No se ha cancelado");
            <%
                    }
                }
            %>
            }
        </script>
    </head>
    <body onload="aviso()">
        <div class="contenedor-principal">
        <nav class="menu">
            <div class="logo">
                <a href="./index.html"><img src="img/logos/Logo_negro.png" alt="Logotipo de KUALI color blanco"></a>
            </div>
            
            <div class="ubicacion">
                <a href="./usuario/carritoCompras.jsp"><i class="fas fa-map-marker-alt fa-lg"></i>Carrito de compras</a>
            </div>
    
            <div class="pedidos-agendados">
                <a href="./pedidosAgendados.jsp"><i class="fas fa-calendar-alt fa-lg"></i>Pedidos pendientes</a>
            </div>
            
            <div class="pedidos-agendados">
                <a href="./usuario/ajustesUsuarios.jsp"><i class="fas fa-calendar-alt fa-lg"></i>Perfil</a>
            </div>
    
            <div class="opciones-usuario">
                <div class="caja_busqueda">
                    <input class="card-filter" type="search" id='buscar-en-usuarios' placeholder="Buscar ...">
                    
                    <a class="boton_buscar">
                        <i class="fas fa-search"></i>
                    </a>
                </div>
                
                <img src="img/perfil-ejemplo.jpg" alt="imagen de perfil del usuario actual">
            </div>
        </nav>
        <h1 align="center">Pedidos Agendados</h1>
        
        <%
        DetallePedido odp = new DetallePedido();
        Pedido op = new Pedido();
        ArrayList<Pedido> listap= op.getPedidosClie(Integer.parseInt(idUS));
        
        int contador=0;
        for(Pedido p:listap){
        
            if(contador!=p.getId_ped()){
                ArrayList<DetallePedido> listadp=odp.getDetallePedidoCaf(p.getId_ped());
                Cafeteria oc= new Cafeteria();
                
                Cafeteria c = oc.getCafeteriaByIdCaf(p.getId_caf());
                Hora oh=new Hora();
                Hora h= oh.getHoraById(p.getId_hora());
                Minuto om=new Minuto();
                Minuto m=om.getMinutoById(p.getId_min());
        %>
        <div class="pedidos">
        
            <div class="contenedor-pedido">
                <div class="pedido">
                    <%
                        for(DetallePedido dp: listadp){
                            Productos oprod = new Productos();
                            Productos prod = oprod.getProductoById(dp.getId_prod());
                    %>
                    <p class="titulo-cuarto"><%=dp.getCant_detPed()%> <%=prod.getNom_prod()%> 
                        $ <%=dp.getSub_detPed()%></p>
                    <i class="fas fa-angle-down fa-lg"></i>
                    <%
                        }
                    %>
                </div>
                <div class="descripcion">
                    <p class="texto">Nombre de la Cafeteria: <%=c.getNom_caf()%> </p>
                    <p class="texto">Fecha: <%=p.getFecha_ped()%></p>
                    <p class="texto">Hora: <%=h.getHora()%>:<%=m.getMinuto()%></p>
                    <p class="texto">Costo Total: <%=p.getTot_ped()%></p>
                    <form action="CancelarPedido" method="POST" >
                    <input type="hidden" name="id_pedido" value="<%=p.getId_ped()%>"/>
                    <button type="submit" onclick="return confirmacion()"><i class="fas fa-times"></i> Cancelar pedido</button>
                    </form>
                </div>
            </div>
        </div>
        
            <%
            }
            contador=p.getId_ped();
        }
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
    <script type="module" src="js/pedidosAgendados.js"></script>
        <script src="js/Cancelacion.js"></script>
    </body>
</html>

<%
    }
}
%>