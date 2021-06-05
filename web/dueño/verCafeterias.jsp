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
    String tipo="";

    Cafeteria operC=new Cafeteria();
    boolean caftener=operC.comprobarCafExiste(id_usu);
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
                
                <a href="../usuario/inicioUsuarios.jsp">
                    <i class="fas fa-door-open fa-2x">
                        <h2 class="titulo-terciario">Regresar</h2>
                    </i>
                </a>
            </div>
        </div>

        <div class="contenido">
            <div class="menu-administrador">
                <div class="caja_busqueda">
                    <input class="card-filter" type="search" id='buscar-en-usuarios' placeholder="Buscar ...">
                    
                    <a class="boton_buscar">
                        <i class="fas fa-search"></i>
                    </a>
                </div>
                <img src="../img/perfil-ejemplo.jpg" alt="imagen de perfil del administrador">
            </div>
            <table>
                <th>Nombre</th>
                <th>Dirección</th>
                <th>Productos</th>
            <%
            for (Cafeteria caf : listacaf) {
                int autorizacion=operC.comprobarAutorizacion(id_usu);
                if (autorizacion==1) {
                %>
                <tr>
                    <td><%=caf.getNom_caf()%></td>
                    <td><%=caf.getDir_caf()%></td>
                    <td>
                        <form action="../ModificarCafeteria.jsp" method="POST">
                            <input type="hidden" name="admrs" value="<%=caf.getId_caf()%>"/>
                            <input type="submit" value="Ir"/>
                        </form>
                        <%--
                        <form action="../operacionProductos" method="POST">
                            <input type="hidden" name="admrs" value="<%=caf.getId_caf()%>"/>
                        <input type="submit" value="Ir"/>
                        </form>
                        --%>
                    </td>
                </tr>
            <%  }else if(autorizacion==2){%>
                <tr>
                    <td><%=caf.getNom_caf()%></td>
                    <td>
                        Sigue en proceso de autorización
                    </td>
                </tr>
            <%  }else if(autorizacion==3){%>
                <tr>
                    <td><%=caf.getNom_caf()%></td>
                    <td>
                        
                        <form action="../EliminarCaf" method="POST">
                            <input type="hidden" name="id" value='<%=caf.getId_caf()%>'/>
                            <input type="submit" value="Eliminar"/>
                        </form>
                    </td>
                </tr>
            <%  }   %>
            </table>
            <%
            }
            %>
            <!-- AQUI EMPIEZA TU CÓDIGO URIEL XD -->
                        
        </div>
    </div>

    <!-- SCRIPTS -->
    <script type="module" src="../../js/dashboard.js"></script>
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