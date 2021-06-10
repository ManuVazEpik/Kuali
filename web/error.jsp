<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../img/logos/granoCafe.png" type="image/x-icon" rel="shortcut icon" />
    <link rel="stylesheet" href="../css/externals/normalize.css">
    <link rel="stylesheet" href="../css/anadirpedido.css">
    <script data-ad-client="ca-pub-1261964740268428" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <title>Error | KUALI</title>
    </head>
    <body>
        <div class="contenedor-principal">
            <nav class="menu">
               <div class="logo">
                   <a href="index.html"><img src="img/logos/Logo_negro.png" alt="Logotipo de KUALI color blanco" width="300pt"></a>
               </div>
            </nav>
                 
        <% 
            String parametro=request.getParameter("admrs");
            if (parametro==null) {
        %>
        <h1>Se ha presentado un error inesperado</h1>
        <a href='index.html'>Regresar</a>
        <%
            }else{
                if (parametro.equals("1")) {
        %>
        <h1>Correo o contraseña incorrectos<br><a href='IniciarSesion.html'>Regresar</a></h1>
        <%
                }else if(parametro.equals("2")){
        %>
        <h1>Es necesario identificarse<br><a href='index.html'>Regresar</a></h1>
        <%
                }else if(parametro.equals("3")){
                    String id_caf=request.getParameter("ewewe");
        %>
        <h1>Lo sentimos, la fecha elegida y hora elegidas ya están ocupadas. Por favor, escoja otro horario</h1>
            <a href='usuario/carritoCompras.jsp?admrs=<%=id_caf%>'>Regresar</a>
        
        <%
                }else if(parametro.equals("4")){
        %>
        <h1>No se pueden hacer pedidos con productos de distintas cafeterias</h1>
            <a href='usuario/inicioUsuarios.jsp'>Regresar</a>
        <%
                }
            }
        %>
        </div>
    </body>
</html>
