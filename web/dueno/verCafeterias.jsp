<%@page import="Clases.Pedido"%>
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

    Cafeteria operC=new Cafeteria();
    if (u.getPerm_usu()==3){

        ArrayList<Cafeteria> listacaf = Cafeteria.getCafeteriaById(id_usu);
        ArrayList<Cafeteria> listaaviso = Pedido.pedidosEn15Min(id_usu);
%>
<!DOCTYPE html>
<html lang="es">
    <script>
        function avisar(){
            console.log("Se hace?");
            <%
                for (Cafeteria c:listaaviso){
                    
            %>
                alert("Tiene un pedido pronto de la cafeteria: <%=c.getNom_caf()%>")
            <%
                }
            %>
        }
    </script>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../img/logos/granoCafe.png" type="image/x-icon" rel="shortcut icon" />
    <link rel="stylesheet" href="../css/externals/normalize.css">
    <link rel="stylesheet" href="../css/verCafeteria.css">
    <script data-ad-client="ca-pub-1261964740268428" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <title>Dashboard | KUALI</title>
</head>
<body onload="avisar()">
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
                        <h2 class="titulo-terciario">Cerrrar Sesión</h2>
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

            <div class="cafeterias">
                
                <%
                for (Cafeteria caf : listacaf) {
                    int autorizacion=operC.comprobarAutorizacion(id_usu);
                %>
                <div class="cafeteria">
                    <h1 class="titulo-terciario"><%=caf.getNom_caf()%></h1>
                    <!-- <p class="texto"><%=caf.getDir_caf()%></p> -->
                    
                <%
                    if (autorizacion==1) {
                %>
                    <div class="estado">
                        <p class="texto">Estatus: Activo <i class="fas fa-circle"></i></p>
                    </div>

                    <img src="<%=caf.getFot_caf()%>" alt="Logo Cafetería">

                    <div class="opciones-cafeteria">
                        <form action="./operacionProductos.jsp" method="POST">
                            <input type="hidden" name="admrs" value="<%=caf.getId_caf()%>"/>
                            <input type="submit" value="Menú"/>
                        </form>
                        <form action="../pedidosAgendados.jsp" method="POST">
                            <input type="hidden" name="admrs" value="<%=caf.getId_caf()%>"/>
                            <input type="submit" value="Pedidos"/>
                    </div>
                    </form>
                <%  }else if(autorizacion==2){%>
                    <div class="estado">
                        <p class="texto">Estatus: Pendiente <i class="fas fa-circle pendiente"></i></p>
                    </div>
                <%  }else if(autorizacion==3){%>
                    <div class="estado">
                        <p class="texto">Estatus: Inactivo <i class="fas fa-circle inactivo"></i></p>
                    </div>
                <%  }   %>
                </div>
                <%
                }
                %>
            </div>
        </div>
    </div>

    <!-- SCRIPTS -->
    <script type="module" src="../js/dashboard.js"></script>
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