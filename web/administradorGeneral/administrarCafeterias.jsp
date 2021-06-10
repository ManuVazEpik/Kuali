<%@page import="Clases.Queja"%>
<%@page import="Clases.Cafeteria"%>
<%@page import="Clases.Usuario"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String usuario = "";
HttpSession sesionOk = request.getSession();
String priv=(String)sesionOk.getAttribute("privilegio");
if (sesionOk.getAttribute("usuario") == null ) {
    
    response.sendRedirect("../error.jsp?admrs=2");
} else if("2".equals(priv)){
    
    response.sendRedirect("../usuario/inicioUsuarios.jsp");
} else if("3".equals(priv)){
    
    response.sendRedirect("../dueno/verCafeterias.jsp");
} else {
    usuario = (String)sesionOk.getAttribute("usuario");
}
%>
<!DOCTYPE html>
<html lang="es">
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../img/logos/granoCafe.png" type="image/x-icon" rel="shortcut icon" />
    <link rel="stylesheet" href="../css/externals/normalize.css">
    <link rel="stylesheet" href="../css/administrarCafeteria.css">
    <title>Administrador | KUALI</title>
    </head>
    <body>
        <div class="contenedor-dashboard">
        <div class="menu-lateral">
            <img src="../img/logos/Logo_blanco.png" alt="Logo Kuali en color blanco">
            
            <div class="opciones-cafeteria">
                <a href="./administrarUsuarios.jsp">
                    <i class="fas fa-mug-hot fa-2x">
                        <h1 class="titulo-terciario">Administrador Usuarios</h1>
                    </i>
                </a>
                <a class="active" href="./administrarCafeterias.jsp">
                    <i class="fas fa-mug-hot fa-2x">
                        <h1 class="titulo-terciario">Administrar Cafeterías</h1>
                    </i>
                </a>
                <a href="./administrarQuejas.jsp">
                    <i class="fas fa-pencil-alt fa-2x">
                        <h2 class="titulo-terciario">Administrar Quejas</h2>
                    </i>
                </a>
                <a href="../CerrarSesion">
                    <i class="fas fa-door-open fa-2x">
                        <h2 class="titulo-terciario">Cerrar Sesion</h2>
                    </i>
                </a>
            </div>
        </div>
        <div class="contenido">
            <div class="menu-administrador">
                <div></div>
                <img src="../img/administrador-perfil.png" alt="imagen de perfil del administrador">
            </div>

            <div class="cafeterias-por-autorizar">
                <h3 class="titulo-secundario">Cafeterias por autorizar</h3>
                <%
                Cafeteria operC=new Cafeteria();
                ArrayList<Cafeteria> listaNoAut=operC.getCafeteriasPendientes();
                %>
                <table>
                    <thead>
                        <tr>
                            <th class="titulo-cuarto borderI">ID de Cafetería</th>
                            <th class="titulo-cuarto">Nombre</th>
                            <th class="titulo-cuarto">Direccion</th>
                            <th class="titulo-cuarto">ID de Usuario</th>
                            <th class="titulo-cuarto">Autorizar</th>
                            <th class="titulo-cuarto borderF">Rechazar</th>
                        </tr>
                    </thead>
                <%
                    for(Cafeteria c:listaNoAut){
                %>
                    <tr>
                        <td class="texto"><%=c.getId_caf()%></td>
                        <td class="texto"><%=c.getNom_caf()%></td>
                        <td class="texto"><%=c.getDir_caf()%></td>
                        <td class="texto"><%=c.getId_usu()%></td>
                        <td class="texto"><form action="../Autorizar" method="POST">
                            <input type="hidden" name="id_usu" value="<%=c.getId_caf()%>"/>
                            <input type="hidden" name="tipo" value="1"/>
                            <input type="submit" value="Aceptar" class="aceptar"/>
                        </form></td>
                        <td class="texto"><form action="../Autorizar" method="POST">
                            <input type="hidden" name="id_usu" value="<%=c.getId_caf()%>"/>
                            <input type="hidden" name="tipo" value="2"/>
                            <input type="submit" value="Rechazar" class="rechazar"/>
                            </form></td>
                    </tr>
                <%
                    }
                %>
                </table>
            </div>
        
            <div class="cafeterias-autorizadas">
                <h3 class="titulo-secundario">Cafeterias Autorizadas</h3>
                <%
                ArrayList<Cafeteria> listaAut=operC.getCafeteriasAutorizadas();
                %>
                <table>
                    <thead>
                        <th class="titulo-cuarto borderI">ID de cafetería</th>
                        <th class="titulo-cuarto">Nombre</th>
                        <th class="titulo-cuarto">Direccion</th>
                        <th class="titulo-cuarto borderF">Opciones</th>
                    </thead>
                <%
                    for(Cafeteria c:listaAut){
                %>
                    <tr>
                        <td class="texto"><%=c.getId_caf()%></td>
                        <td class="texto"><%=c.getNom_caf()%></td>
                        <td class="texto"><%=c.getDir_caf()%></td>
                        <td>
                            <form action="../EliminarCaf" method="POST">
                                <input type="hidden" name="id" value="<%=c.getId_caf()%>"/>
                                <input type="hidden" name="tipo" value="3"/>
                                <input type="submit" value="Eliminar" class="rechazar"/>
                            </form>
                            <%
                                if(c.getDest_caf()==false){
                            %>
                            <form action="../Destacada" method="POST">
                                <input type="hidden" name="id" value="<%=c.getId_caf()%>"/>
                                <input type="submit" value="Autorizar Destacada" class="rechazar"/>
                                </form>
                            <%
                                }else{
                            %>
                            <form action="../NoDestacada" method="POST">
                                <input type="hidden" name="id" value="<%=c.getId_caf()%>"/>
                                <input type="submit" value="Quitar Destacada" class="rechazar"/>
                            </form>
                            <%
                                }
                            %>
                        </td>
                    </tr>
                <%
                    }
                %>
                </table>
            </div>
        </div>

        </div>
        <!-- SCRIPTS -->
    <script src="https://kit.fontawesome.com/59bcf5d722.js" crossorigin="anonymous"></script>
    </body>
</html>
