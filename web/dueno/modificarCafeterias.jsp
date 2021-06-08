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
    String tipo="";

    Cafeteria operC=new Cafeteria();
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
    <link rel="stylesheet" href="../css/modificarCafeterias.css">
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
                <a href="./registroCafeterias.jsp">
                    <i class="fas fa-mug-hot fa-2x">
                        <h1 class="titulo-terciario">Registrar Cafetería</h1>
                    </i>
                </a>
                <a class="active" href="./modificarCafeterias.jsp">
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
                

                <div >
                    <a href="../pedidosAgendados.jsp"><i class="fas fa-calendar-alt fa-lg"></i>Mis Pedidos Agendados</a>
                </div>

                <div >
                    <a href="../usuario/ajustesUsuarios.jsp"><i class="fas fa-map-marker-alt fa-lg"></i>Perfil</a>
                </div>
                
                
            </div>

            <!-- AQUI EMPIEZA TU CÓDIGO URIEL -->  
            
            <div class="cafeterias">
                <%
            for (Cafeteria caf : listacaf) {
                int autorizacion=operC.comprobarAutorizacion(id_usu);
            %>
                <div class="cafeteria">
                    <h1 class="titulo-terciario"><%=caf.getNom_caf()%></h1>
                <%
                    if (autorizacion==1) {
                %>
                    <p class="texto">Estatus: Activo <i class="fas fa-circle"></i></p>
                    <form action="./operacionCafeteria.jsp" method="POST">
                        <input type="hidden" name="admrs" value="<%=caf.getId_caf()%>"/>
                        <input type="submit" value="Modificar"/>
                    </form>
                <%  }else if(autorizacion==2){%>
                    <p class="texto">Estatus: Pendiente <i class="fas fa-circle"></i></p>
                <%  }else if(autorizacion==3){%>
                    <p class="texto">Estatus: Inactivo <i class="fas fa-circle"></i></p>
                <%  }   %>
                </div>
            <%
            }
            %>

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