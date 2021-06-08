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

    String usuario = (String)sessionOk.getAttribute("usuario");
    idUS = (String)session.getAttribute("id");    
    Cafeteria opcaf= new Cafeteria();
    Pedido opP = new Pedido();
    boolean caftener = opcaf.comprobarCafExiste(Integer.parseInt(idUS));
    
    if(caftener==true){
        Cafeteria caf= opcaf.getCafeteriaByIdCaf(Integer.parseInt(idUS));
        caf.getId_caf();
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedidos Pendientes</title>
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
        
        <a href="./dueno/verCafeterias.jsp"><i class="fas fa-calendar-alt fa-lg"></i>Administrar Cafeterias</a>
        <a href="./usuario/ajustesUsuarios.jsp"><i class="fas fa-map-marker-alt fa-lg"></i>Perfil</a>
        <h1>Pedidos Pendientes</h1>
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
        <label>Nombre del Cliente: <%=u.getNom_usu()%> <%=u.getAppat_usu()%> <%=u.getApmat_usu()%></label><br>
        <label>Fecha: <%=p.getFecha_ped()%></label><br>
        <label>Hora: <%=h.getHora()%>:<%=m.getMinuto()%></label><br>
        <label>Costo Total: <%=p.getTot_ped()%></label><br><br>
        
        <%
            for(DetallePedido dp: listadp){
                Productos oprod = new Productos();
                Productos prod = oprod.getProductoById(dp.getId_prod());
        %>
        <label style="margin-right: 2rem;">Producto: <%=prod.getNom_prod()%></label><label>Cantidad: <%=dp.getCant_detPed()%></label>
        <br>
        <%
            }
        %>
        <br>
        <form action="CancelarPedido" method="POST" >
        <input type="hidden" name="id_pedido" value="<%=p.getId_ped()%>"/>
        <input type="submit" value="Cancelar Pedido"/>
        </form>
        <br>
        <%
            if(finalizar==true){
        %>
        <br>
        <form action="FinalizarPedido" method="POST" >
        <input type="hidden" name="id_pedido" value="<%=p.getId_ped()%>"/>
        <input type="submit" value="Finalizar Pedido"/>
        </form>
        <br>
        <br><br>
        <%
            }else{
        %>
        <br><br>
        <%
            }
            }
            contador=p.getId_ped();
        }

        %>
        
    </body>
</html>
<%
    }else{
        Pedido.checkoutPendientes(Integer.parseInt(idUS), true);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedidos Agendados</title>
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
        
            <a href="./index.html"><img src="../img/logos/Logo_negro.png" alt="Logotipo de KUALI color blanco"></a>
            <a href="./usuario/carritoCompras.jsp"><i class="fas fa-map-marker-alt fa-lg"></i>Carrito de compras</a>
            <a href="./pedidosAgendados.html"><i class="fas fa-calendar-alt fa-lg"></i>Mis Pedidos Agendados</a>
            <a href="./usuario/ajustesUsuarios.jsp"><i class="fas fa-map-marker-alt fa-lg"></i>Perfil</a>
        <h1>Pedidos Agendos</h1>
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
                System.out.println(c.getNom_caf());
                Hora oh=new Hora();
                Hora h= oh.getHoraById(p.getId_hora());
                Minuto om=new Minuto();
                Minuto m=om.getMinutoById(p.getId_min());
        %>
        <label>Nombre de la cafeteria: <%=c.getNom_caf()%></label><br>
        <label>Fecha: <%=p.getFecha_ped()%></label><br>
        <label>Hora: <%=h.getHora()%>:<%=m.getMinuto()%></label><br>
        <label>Costo Total: <%=p.getTot_ped()%></label><br><br>
        
        <%
            for(DetallePedido dp: listadp){
                Productos oprod = new Productos();
                Productos prod = oprod.getProductoById(dp.getId_prod());
        %>
        <label style="margin-right: 2rem;">Producto: <%=prod.getNom_prod()%></label>
        <label style="margin-right: 2rem;">Cantidad: <%=dp.getCant_detPed()%></label>
        <label>SubTotal: <%=dp.getSub_detPed()%></label>
        <br>
        <%
            }
        %>
        <br>
        <form action="CancelarPedido" method="POST" >
        <input type="hidden" name="id_pedido" value="<%=p.getId_ped()%>"/>
        <input type="submit" value="Cancelar Pedido"/>
        </form>
        <br><br><br>
        <%
            }
            contador=p.getId_ped();
        }
        %>
        
    </body>
</html>

<%
    }
}
%>