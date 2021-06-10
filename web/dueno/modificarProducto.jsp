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
}else if(sessionOk.getAttribute("autorizacion")==null){
    response.sendRedirect("../error.jsp?admrs=2");
}else{
    usuario = (String)sessionOk.getAttribute("usuario");
    idUS = (String)session.getAttribute("id");
    int id_usu=Integer.parseInt(idUS);
    Cafeteria opc = new Cafeteria();
    int id_caf = Integer.parseInt(request.getParameter("id_caf").trim());
    Cafeteria c=opc.getCafeteriaByIdCaf(id_caf);
    
    String id_proS=request.getParameter("id_pro");
    int id_prod=Integer.parseInt(id_proS);
    Productos opP = new Productos();
    Productos p=opP.getProductoById(id_prod);
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
        <script data-ad-client="ca-pub-1261964740268428" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <link href="../img/logos/granoCafe.png" type="image/x-icon" rel="shortcut icon" />
        <link rel="stylesheet" href="../css/externals/normalize.css">
        <link rel="stylesheet" href="../css/modificarProducto.css">
        <title>Editar Producto | Kuali</title>
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

                <div class="modificar-producto">
                    <div class="titulo">
                        <a href='operacionProductos.jsp?admrs=<%=id_caf%>'><i class="fas fa-chevron-circle-left fa-3x"></i></a>
                        <h1 class="titulo-principal">Modificar Producto</h1>
                    </div>

                    <form name="formRegistroProducto" action="../ActualizarPro" method="POST">
                        <div class="nombre-producto">
                            <p class="texto">Nombre del producto</p>
                            <input class="texto campo" type="text" name="nom_prod" value="<%=p.getNom_prod()%>"/>
                        </div>
                        
                        <div class="descripcion">
                            <p class="texto">Descripcion del producto</p>
                            <input class="texto campo" type="text" name="desc_prod" value="<%=p.getDesc_prod()%>"/>
                        </div>
                        
                        <div class="precio">
                            <p class="texto">Precio del producto</p>
                            <input class="texto campo" type="text" name="pre_prod" value="<%=p.getPre_prod()%>">
                        </div>
                        
                        <a href="https://postimages.org" target="_blank">Haz click aquí para subir una nueva foto <i class="fas fa-mouse-pointer"></i></a>
                        
                        <div class="foto-producto">
                            <p class="texto">Link de la foto del producto</p>
                            <input class="texto campo" type="text" name="fot_prod" value="<%=p.getFot_prod()%>"/>
                        </div>
                        
                        <input type="hidden" name='id_prod' value="<%=p.getId_prod()%>">
                        <input type="hidden" name='id_caf' value="<%=c.getId_caf()%>">
                        <input onclick="return validar()" type="submit" value="Aceptar"/>
                    </form>
                </div>
            </div>
        </div>
    
        <!-- SCRIPTS -->
        <script src="https://kit.fontawesome.com/59bcf5d722.js" crossorigin="anonymous"></script>
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