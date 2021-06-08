<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Cafeteria" %>
<%@ page session="true" %>
<%
String idUS = "";
String usuario="";
HttpSession sessionOk = request.getSession();
if(sessionOk.getAttribute("usuario")==null){
%>
    <jsp:forward page="index.html">
        <jsp:param name="error" value="Es obligatorio identificarse"/>
    </jsp:forward>
<%   
}else if("0".equals(sessionOk.getAttribute("autorizacion"))){
%>
    <jsp:forward page="verCafeterias.jsp">
        <jsp:param name="error" value="Es obligatorio identificarse"/>
    </jsp:forward>
<%
}else{
    usuario = (String)sessionOk.getAttribute("usuario");
    idUS = (String)session.getAttribute("id");
    int idU=Integer.parseInt(idUS);
    int id_caf=Integer.parseInt(request.getParameter("admrs").trim());
    Cafeteria opc = new Cafeteria();
    Cafeteria c=opc.getCafeteriaByIdCaf(id_caf);
%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../img/logos/granoCafe.png" type="image/x-icon" rel="shortcut icon" />
    <link rel="stylesheet" href="../css/externals/normalize.css">
    <link rel="stylesheet" href="../css/ajustesUsuarios.css">
    <title>Menú | KUALI</title>
    </head>
    <body>
    <div class="contenedor-principal">
        <nav class="menu">
            <div class="logo">
                <a href="../index.html"><img src="../img/logos/Logo_negro.png" alt="Logotipo de KUALI color blanco"></a>
            </div>
            
            <div class="ubicacion">
                <a href="./verCafeterias.jsp"><i class="fas fa-map-marker-alt fa-lg"></i>Cafeterias</a>
            </div>
            
            <div class="pedidos-agendados">
                <a href="../pedidosAgendados.jsp"><i class="fas fa-calendar-alt fa-lg"></i>Mis Pedidos Agendados</a>
            </div>
            
            <div class="ubicacion">
                <a href="../usuario/ajustesUsuarios.jsp"><i class="fas fa-map-marker-alt fa-lg"></i>Perfil</a>
            </div>
        </nav>
            <h2>Registrar producto nuevo</h2>
            <form action="RegistrarPro" method="POST">
                <a href="https://postimages.org" target="_blank">Accede a la siguiente página para subir la foto de tu producto</a>.
                <p>Copia el url que dice DirectLink y pégalo en el siguiente campo de texto</p>
                <input type="text" name="fot_prod"><br>
                <input type="hidden" name="id_caf"value="<%=c.getId_caf()%>"/>
                Ingresa el nombre del producto<input type="text" name="nom_prod"/><br>
                Ingresa la descripcion del producto<input type="text" name="desc_prod"/><br>
                Ingresa el precio del producto<input type="text" name="pre_prod"/><br>
                <input type="submit" value="Aceptar"/>
            </form>
                <br>
            <h2>Producto cafeteria</h2>
            <table>
                <th>Id_producto</th>
                <th>Nombre</th>
                <th>Descripcion</th>
                <th>Precio</th>
                <th>Img</th>
                <th>Disponibilidad</th>
                <th>Modificar</th>
                <th>Eliminar</th>
                <%
                Productos opP = new Productos();
                ArrayList<Productos> listap=opP.getProductosCaf(c.getId_caf());

                for(Productos p:listap){

            %>
                    <tr>
                        <td><%=p.getId_prod()%></td>
                        <td><%=p.getNom_prod()%></td>
                        <td><%=p.getDesc_prod()%></td>
                        <td><%=p.getPre_prod()%></td>
                        <td><img src="<%=p.getFot_prod()%>"></td>
                        <td>
                            <form action="../Disponibilidad" method="POST">
                            <input type="hidden" value="<%=p.getId_prod()%>" name="id_prod"/>
                            <input type="hidden" value="<%=c.getId_caf()%>" name="admrs"/>
                        <%if(p.getDisp_prod()==true){%>
                        <p>Disponible</p>
                        <input type="hidden" value="Disponible" name="dis_prod"/>
                        <input type="submit" value="Cambiar a no disponible"/>
                        <%}else{%>
                        <p>No Disponible</p>
                        <input type="hidden" value="NoDisponible" name="dis_prod"/>
                        <input type="submit" value="Cambiar a disponible"/>
                        <%}%>
                            </form>
                        </td>
                        <td><form action="modificarProducto.jsp" method="POST">
                            <input type="hidden" name="id_pro" value="<%=p.getId_prod()%>"/>
                            <input type="hidden" name="id_caf" value="<%=c.getId_caf()%>"/>
                            <input type="submit" value="Aceptar"/>
                        </form></td>
                        <td><form action="../EliminarPro" method="POST">
                            <input type="hidden" name="id_prod" value="<%=p.getId_prod()%>"/>
                            <input type='hidden' name='id' value='<%=c.getId_caf()%>'/>
                            <input type="submit" value="Aceptar"/>
                            </form></td>
                    </tr>
            <%
                }
            %>
            </table>
        </div>
        <!-- SCRIPTS -->
    <script src="https://kit.fontawesome.com/59bcf5d722.js" crossorigin="anonymous"></script>
    </body>
</html>
<%
    }
%>