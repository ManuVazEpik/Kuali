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
   
%>
    <jsp:forward page="../index.html">
        <jsp:param name="error" value="Es obligatorio identificarse"/>
    </jsp:forward>}
<%   
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
    <link rel="stylesheet" href="../css/externals/normalize.css">
    <link rel="stylesheet" href="../css/verCafeteria.css">
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
                <a href="../usuario/inicioUsuarios.jsp">
                    <i class="fas fa-door-open fa-2x">
                        <h2 class="titulo-terciario">Regresar</h2>
                    </i>
                </a>
            </div>
        </div>
        <div class="contenido">
            <div class="menu-administrador">
                
                

                <div >
                    <a href="../pedidosAgendados.jsp"><i class="fas fa-calendar-alt fa-lg"></i>Mis Pedidos Agendados</a>
                </div>

                <div >
                    <a href="../usuario/ajustesUsuarios.jsp"><i class="fas fa-map-marker-alt fa-lg"></i>Perfil</a>
                </div>
                
                
            </div>
            <h2>Registrar una cafeteria</h2>
            <form action="../RegistrarCaf" method="POST">
                <a href="https://postimages.org" target="_blank">Accede a la siguiente página para subir la foto de tu cafeteria</a>.
                <p>Copia el url que dice DirectLink y pégalo en el siguiente campo de texto</p>
                <input type="text" name="fot_caf"><br>
                <input type='hidden' name="id_usuC" value='<%=id_usu%>'/>
                Ingresa el nombre de tu cafeteria<input type="text" name="nom_caf"/><br>
                Ingresa la calle de tu local<input type="text" name="calle_caf"><br>
                Ingresa la colonia de tu local<input type="text" name="col_caf"><br>
                Ingresa el numero de tu local<input type="text" name="num_caf"><br>
                <input type="submit" value='Aceptar'/>
            </form>
        </div>
    <!-- SCRIPTS -->
    <script src="https://kit.fontawesome.com/59bcf5d722.js" crossorigin="anonymous"></script>
</body>
</html>

<%
    }else{
%>        
    <jsp:forward page="../index.html">
        <jsp:param name="error" value="Es obligatorio identificarse"/>
    </jsp:forward>}
<%
    }
}
%>