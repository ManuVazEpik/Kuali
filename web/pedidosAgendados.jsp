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
%>
        <jsp:forward page="index.html">
            <jsp:param name="error" value="Es obligatorio identificarse"/>
        </jsp:forward>
<%
}else{

    String usuario = (String)sessionOk.getAttribute("usuario");
    idUS = (String)session.getAttribute("id");    
    Cafeteria opcaf= new Cafeteria();
    Pedido opP = new Pedido();
    boolean caftener = opcaf.comprobarCafExiste(Integer.parseInt(idUS));
    if(caftener==true){
    
    
    Cafeteria caf= opcaf.getCafeteriaByIdCaf(Integer.parseInt(idUS));
    int id_caf=caf.getId_caf();
    Pedido.checkoutPendientes(id_caf, false);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PedidosPendientes</title>
    </head>
    <body>
        <h1>Pedidos Pendientes</h1>
        <%
        DetallePedido odp = new DetallePedido();
        Pedido op = new Pedido();
        ArrayList<Pedido> listap= op.getPedidosCaf(id_caf);
        System.out.println(id_caf);
        System.out.println("Lista?"+listap.size());
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
        <a href="ModificarCafeteria.jsp">Regresar</a>
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
        <title>Pedidos Próximos</title>
    </head>
    <body>
        <h1>Pedidos Próximos</h1>
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
        <a href="index.jsp">Regresar</a>
    </body>
</html>

<%
    }
}
%>