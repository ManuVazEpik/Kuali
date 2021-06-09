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
    <link rel="stylesheet" href="../css/administrarUsuarios.css">
    <title>Administrador | KUALI</title>
    </head>
    <body>
        <div class="contenedor-dashboard">
            <div class="menu-lateral">
                <img src="../img/logos/Logo_blanco.png" alt="Logo Kuali en color blanco">
                
                <div class="opciones-cafeteria">
                    <a class="active" href="./administrarUsuarios.jsp">
                        <i class="fas fa-mug-hot fa-2x">
                            <h1 class="titulo-terciario">Administrador Usuarios</h1>
                        </i>
                    </a>
                    <a href="./administrarCafeterias.jsp">
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
            
                <div class="usuarios">
                    <h3 class="titulo-secundario">Usuarios</h3>
                    <%
                    Usuario u = new Usuario();
                    ArrayList<Usuario> listaUsu=u.getUsuarios();
                    
                    %>
                    <table>
                        <thead>
                            <th class="titulo-terciario borderI">Id_usu</th>
                            <th class="titulo-terciario">Nombre_usu</th>
                            <th class="titulo-terciario">Appat_usu</th>
                            <th class="titulo-terciario">Apmat_usu</th>
                            <th class="titulo-terciario">Email</th>
                            <th class="titulo-terciario">Contraseña</th>
                            <th class="titulo-terciario">Telefono</th>
                            <th class="titulo-terciario borderF">Eliminar</th>
                        </thead>
                    <%
                        for(Usuario c:listaUsu){
                    %>
                    <tr>
                        <td class="texto"><%=c.getId_usu()%></td>
                        <td class="texto"><%=c.getNom_usu()%></td>
                        <td class="texto"><%=c.getAppat_usu()%></td>
                        <td class="texto"><%=c.getApmat_usu()%></td>
                        <td class="texto"><%=c.getEmail_usu()%></td>
                        <td class="texto"><%=c.getPass_usu()%></td>
                        <td class="texto"><%=c.getTel_usu()%></td>
                        <td class="texto"><form action="../EliminarUsu" method="POST">
                            <input type="hidden" name="id" value="<%=c.getId_usu()%>"/>
                            <input type="hidden" name="tipo" value="1"/>
                            <input type="submit" value="Eliminar"/>
                        </form></td>
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
