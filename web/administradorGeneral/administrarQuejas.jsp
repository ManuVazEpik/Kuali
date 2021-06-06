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
%>
<jsp:forward page="../IniciarSesion.jsp">
<jsp:param name="error" value="Es obligatorio identificarse"/>
</jsp:forward>
<%
} else if("2".equals(priv) || "3".equals(priv)){
    response.sendRedirect("../usuario/ajustesUsuarios.jsp");
} else {
    usuario = (String)sesionOk.getAttribute("usuario");
}
%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/externals/normalize.css">
    <link rel="stylesheet" href="../css/verCafeteria.css">
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
        </div>
        <h2>Quejas</h2>
        <table>
            <th>ID</th>
            <th>Nombre</th>
            <th>Correo</th>
            <th>Telefono</th>
            <th>Queja o sugerencia</th>
            <th>Satisfacción</th>
            <th></th>
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
            <td><%=q.getId_que()%></td>
            <td><%=q.getNom_que()%></td>
            <td><%=q.getEmail_que()%></td>
            <td><%=q.getTel_que()%></td>
            <td><%=q.getQueja()%></td>
            <td><%=satisfaccionS%></td>
            <td>
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
        <!-- SCRIPTS -->
    <script src="https://kit.fontawesome.com/59bcf5d722.js" crossorigin="anonymous"></script>
    </body>
</html>
