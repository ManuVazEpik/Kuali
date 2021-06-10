<%@page import="Clases.Usuario"%>
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
    response.sendRedirect("../error.jsp?admrs=2"); 
}else if("0".equals(sessionOk.getAttribute("autorizacion"))){
    response.sendRedirect("../dueno/verCafeterias.jsp");
}else{
    usuario = (String)sessionOk.getAttribute("usuario");
    idUS = (String)session.getAttribute("id");
    int id_usu=Integer.parseInt(idUS);
    int id_caf=Integer.parseInt(request.getParameter("admrs").trim());
    Cafeteria opc = new Cafeteria();
    Cafeteria c=opc.getCafeteriaByIdCaf(id_caf);
    
    Usuario opu = new Usuario();
    Usuario u=opu.getUsuarioById(id_usu);
    
    if (u.getPerm_usu()==3){
%>
<!DOCTYPE html>
<html lang="es">
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../img/logos/granoCafe.png" type="image/x-icon" rel="shortcut icon" />
    <script data-ad-client="ca-pub-1261964740268428" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <link rel="stylesheet" href="../css/externals/normalize.css">
    <link rel="stylesheet" href="../css/operacionProductos.css">
    <title>Menú | KUALI</title>
    </head>
    <body>
    <div class="contenedor-dashboard">
        <div class="menu-lateral">
            <img src="../img/logos/Logo_blanco.png" alt="Logo Kuali en color blanco">
            
            <div class="opciones-cafeteria">
                <a class="active" href="./verCafeterias.jsp">
                    <i class="fas fa-mug-hot fa-2x">
                        <h1 class="titulo-terciario">Ver Cafeterías</h1>
                    </i>
                </a>
                <a href="./registroCafeterias.jsp">
                    <i class="fas fa-mug-hot fa-2x">
                        <h1 class="titulo-terciario">Registrar Cafetería</h1>
                    </i>
                </a>
                <a href="./modificarCafeterias.jsp">
                    <i class="fas fa-pencil-alt fa-2x">
                        <h2 class="titulo-terciario">Modificar Cafeterías</h2>
                    </i>
                </a>
                <a href="./eliminarCafeterias.jsp">
                    <i class="fas fa-trash fa-2x">
                        <h2 class="titulo-terciario">Eliminar Cafeterías</h2>
                    </i>
                </a>
                <a href="../CerrarSesion">
                    <i class="fas fa-door-open fa-2x">
                        <h2 class="titulo-terciario">Cerrar Sesión</h2>
                    </i>
                </a>
            </div>
        </div>

        <div class="contenido">
            <div class="menu-administrador">
                <div class="enlace primero">
                    <a href="../pedidosAgendados.jsp"><i class="fas fa-calendar-alt fa-lg"></i>Pedidos Solicitados</a>
                </div>

                <div class="enlace">
                    <a href="../usuario/ajustesUsuarios.jsp"><i class="fas fa-user-cog fa-lg"></i>Perfil</a>
                </div>
                    
                <div class="opciones-usuario">         
                    <img src="../img/dueno-perfil.png" alt="imagen de perfil del usuario actual">
                </div>
            </div>

            <div class="nuevo-producto">
                <h2 class="titulo-secundario">Nuevo Producto</h2>

                <form name="formRegistroProducto" action="../RegistrarPro" method="POST">
                    <a href="https://postimages.org" target="_blank">Accede a la siguiente página para subir la foto de tu producto</a>
                    <input class="texto campo" type="text" name="fot_prod" placeholder="Coloca aquí tu link de DirectLink">
                    
                    <input class="texto campo" type="hidden" name="id_caf"value="<%=c.getId_caf()%>"/>
                    
                    <input class="texto campo" type="text" name="nom_prod"  placeholder="Nombre del prodcuto"/>
                    <input class="texto campo" type="text" name="desc_prod" placeholder="Descripción del producto"/>
                    <input class="texto campo" type="text" name="pre_prod" placeholder="Precio del producto"/>

                    <input onclick="return validar()" type="submit" value="Aceptar"/>
                </form>
            </div>
                

            <div class="table-header">
                <h1 class="titulo-secundario">Mis prodcutos</h1>
                <p class="texto">¡ Hey ! Aquí puedes ver los productos de tu cafetería.</p>
            </div> 

            <table>
                <th>Nombre</th>
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
                        <td><%=p.getNom_prod()%></td>
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

                        <td>
                            <form action="modificarProducto.jsp" method="POST">
                                <input type="hidden" name="id_pro" value="<%=p.getId_prod()%>"/>
                                <input type="hidden" name="id_caf" value="<%=c.getId_caf()%>"/>
                                <input type="submit" value="Aceptar"/>
                            </form>
                        </td>

                        <td>
                            <form action="../EliminarPro" method="POST">
                                <input type="hidden" name="id_prod" value="<%=p.getId_prod()%>"/>
                                <input type='hidden' name='id' value='<%=c.getId_caf()%>'/>
                                <input type="submit" value="Aceptar"/>
                            </form>
                        </td>
                    </tr>
            <%
                }
            %>
            </table>
        </div>
    </div>

        <!-- SCRIPTS -->
    <script src="https://kit.fontawesome.com/59bcf5d722.js" crossorigin="anonymous"></script>
    <script src="../js/validarRegistroProducto.js"></script>
    </body>
</html>
<%
    }else if(u.getPerm_usu()==2){
        response.sendRedirect("../usuario/inicioUsuarios.jsp");
    }else if(u.getPerm_usu()==1){
        response.sendRedirect("../administradorGeneral/administrarUsuarios.jsp");
    }else{
        response.sendRedirect("../index.html");
    }

}
%>