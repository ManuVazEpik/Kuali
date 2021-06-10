<%-- 
    Document   : registroCafeterias
    Created on : 5/06/2021, 02:03:34 AM
    Author     : bocal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Cafeteria"%>
<%@page import="Clases.Usuario"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page session="true" %>

<%
String idUS = "";
String usuario="";
HttpSession sessionOk = request.getSession();
if(sessionOk.getAttribute("id")==null){
    response.sendRedirect("../error.jsp?admrs=2"); 
}else{
    usuario = (String)sessionOk.getAttribute("usuario");
    idUS = (String)session.getAttribute("id");

    int id_usu=Integer.parseInt(idUS);
    Usuario opc = new Usuario();
    Usuario u=opc.getUsuarioById(id_usu);
    if (u.getPerm_usu()==3){
        ArrayList<Cafeteria> listacaf = Cafeteria.getCafeteriaById(id_usu);
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../img/logos/granoCafe.png" type="image/x-icon" rel="shortcut icon" />
    <link rel="stylesheet" href="../css/externals/normalize.css">
    <script data-ad-client="ca-pub-1261964740268428" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <link rel="stylesheet" href="../css/registroCafeterias.css">
    <title>Dashboard | KUALI</title>
</head>
<body>
    <div class="contenedor-dashboard">
        <div class="menu-lateral">
            <img src="../img/logos/Logo_blanco.png" alt="Logo Kuali en color blanco">
            
            <div class="opciones-cafeteria">
                <a href="./verCafeterias.jsp">
                    <i class="fas fa-mug-hot fa-2x">
                        <h1 class="titulo-terciario">Ver Cafeterías</h1>
                    </i>
                </a>
                <a class="active"href="./registroCafeterias.jsp">
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
                    <a href="../pedidosAgendados.jsp"><i class="fas fa-calendar-alt fa-lg"></i>Mis Pedidos Agendados</a>
                </div>

                <div class="enlace">
                    <a href="../usuario/ajustesUsuarios.jsp"><i class="fas fa-user-cog fa-lg"></i>Perfil</a>
                </div>
                
                <div class="opciones-usuario">         
                    <img src="../img/dueno-perfil.png" alt="imagen de perfil del usuario actual">
                </div>
            </div>

            <div class="nueva-cafeteria">
                <h2 class="titulo-principal">Registrar una cafetería</h2>

                <form action="../RegistrarCaf" method="POST">
                    <a class="texto" href="https://postimages.org" target="_blank">Haz click aquí para subir la foto de tu cafeteria</a>
                    
                    <div class="directLink">
                        <p class="texto">Copia y pega tu enlace de DirectLink aquí</p>
                        <input type="text" name="fot_caf" autocomplete="off" placeholder="Link de DirectLink"><br>
                    </div>

                    <input type='hidden' name="id_usuC" value='<%=id_usu%>'/>
                    <input type="text" name="nom_caf" placeholder="Nombre de la cafetería"/><br>
                    <input type="text" name="calle_caf" placeholder="Calle del local"><br>
                    <input type="text" name="col_caf" placeholder="Colonia del local"><br>
                    <input type="text" name="num_caf" placeholder="Numero de tu local"><br>
                    <input onclick="return validar()" type="submit" value='Registrar cafetería'/>
                
                </form>
            </div>
        </div>
    <!-- SCRIPTS -->
    <script src="https://kit.fontawesome.com/59bcf5d722.js" crossorigin="anonymous"></script>
    <script src="../js/validarRegistroCafeteria.js"></script>
</body>
</html>

<!-- <%
    }else if(u.getPerm_usu()==2){
        response.sendRedirect("../usuario/inicioUsuarios.jsp");
    }else if(u.getPerm_usu()==1){
        response.sendRedirect("../administradorGeneral/administrarUsuarios.jsp");
    }else{
        response.sendRedirect("../index.html");
    }

}
%> -->