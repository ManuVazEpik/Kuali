<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Error</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>
    <body>
        <% 
            String parametro=request.getParameter("admrs");
            if (parametro==null) {
        %>
        <div>Se ha presentado un error inesperado</div>
        <%
            }else{
                if (parametro.equals("1")) {
        %>
        <div>Correo o contraseña incorrectos<br><a href='IniciarSesion.html'>Regresar</a></div>
        <%
                }else if(parametro.equals("2")){
        %>
        <div>Es necesario identificarse<br><a href='index.html'>Regresar</a></div>
        <%
                }else if(parametro.equals("3")){
                    String id_caf=request.getParameter("ewewe");
        %>
        <div>Lo sentimos, la fecha elegida y hora elegidas ya están ocupadas. Por favor, escoja otro horario
            <br><a href='usuario/CarritoCompras.jsp?admrs=<%=id_caf%>'>Regresar</a>
        </div>
        <%
                }else if(parametro.equals("4")){
        %>
        <div>No se pueden hacer pedidos con productos de distintas cafeterias
            <br><a href='usuario/inicioUsuarios.jsp'>Regresar</a>
        </div>
        <%
                }
            }
        %>
    </body>
</html>
