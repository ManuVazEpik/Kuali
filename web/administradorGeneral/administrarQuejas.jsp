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
    <link rel="stylesheet" href="../css/administrarQuejas.css">
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
                <a href="./administrarCafeterias.jsp">
                    <i class="fas fa-mug-hot fa-2x">
                        <h1 class="titulo-terciario">Administrar Cafeterías</h1>
                    </i>
                </a>
                <a class="active" href="./administrarQuejas.jsp">
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
                <div class="caja_busqueda">
                    <input class="card-filter" type="search" id='buscar-en-usuarios' placeholder="Buscar ...">
                    
                    <a class="boton_buscar">
                        <i class="fas fa-search"></i>
                    </a>
                </div>
                <img src="../img/perfil-ejemplo.jpg" alt="imagen de perfil del administrador">
            </div>

            <div class="quejas">
                <h2 class="titulo-secundario">Quejas</h2>
                <table>
                    <thead>
                        <th class="titulo-terciario borderI">ID</th>
                        <th class="titulo-terciario">Nombre</th>
                        <th class="titulo-terciario">Correo</th>
                        <th class="titulo-terciario">Telefono</th>
                        <th class="titulo-terciario">Queja o sugerencia</th>
                        <th class="titulo-terciario">Satisfacción</th>
                        <th class="titulo-terciario borderF">Concluir Queja</th>
                    </thead>
                <%
                    Queja opq = new Queja();
                    ArrayList <Queja> listaq= opq.getQuejas();
                    
                    String satisfaccionS="";
                    for(Queja q:listaq){
                        int satisfaccion = q.getSatisfaccion();
                        if (satisfaccion==3) {
                            satisfaccionS="Buena";
                        }else if (satisfaccion==2) {
                            satisfaccionS="Normal";
                        }else if (satisfaccion==1) {
                            satisfaccionS="Mala";
                        }else{
                            satisfaccionS="Occurio un error";
                        }
                %>
                    <tr>
                        <td class="texto"><%=q.getId_que()%></td>
                        <td class="texto"><%=q.getNom_que()%></td>
                        <td class="texto"><%=q.getEmail_que()%></td>
                        <td class="texto"><%=q.getTel_que()%></td>
                        <td class="texto"><%=q.getQueja()%></td>
                        <td class="texto"><%=satisfaccionS%></td>
                        <td class="texto">
                            <form action="../ConcluirQueja" method="POST">
                                <input type="hidden" name="id_que" value="<%=q.getId_que()%>"/>
                                <input type="submit" value="Concluir"/>
                            </form>
                        </td>
                    </tr>
                <%
                    }
                %>
                </table>
            </div>
       
            </div>
        </div>
        
        </div>
        <!-- SCRIPTS -->
    <script src="https://kit.fontawesome.com/59bcf5d722.js" crossorigin="anonymous"></script>
    </body>
</html>
