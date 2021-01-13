<%-- 
    Document   : index.jsp
    Created on : 13/01/2021, 12:12:31 PM
    Author     : bocal
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Usuario"%>
<%@page import="Clases.Cafeteria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina principal</title>
    <link rel="StyleSheet" href="css/style.css" type="text/css" MEDIA=screen>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" >
        <link rel="stylesheet" href="css/reginisesion.css">
</head>
<%
    System.out.println("????????'''''''''''''''''''''");
    
    Cafeteria operc=new Cafeteria();
    ArrayList<Cafeteria> listacaf = operc.getCafeteriasAutorizadas();
    
    
%>    
<body class="hiddn">
    <header>
        
        <nav id="nav" class="nav1">
            <div class="contenedor-nav">
                <div class="logo">
                    <img src="" alt="">
                </div>
                <div class="enlaces" id="enlaces">
                    <a href="IniciarSesion.jsp" id="enlace-" class="btn-header">Inicio de sesión</a>
                    <a href="RegistrarUsuario.html" id="enlace-" class="btn-header">Registrarse</a>
                    <a href="Cuentas.jsp" id="enlace-" class="btn-header">Cuenta</a>
                </div>
                <div class="icono" id="open">
                    <span>&#9776</span>
                </div>
                
            </div>
        </nav>
        
        <div class="letras">
            <h1>Instant Lunch</h1>
            <h2>¿Que comeras hoy?</h2>
        </div>
    
    </header>

    <main>
        <section class="destacados" id="destacados">
            <h3>Cafeterias</h3>
            <p class="after">Las mejores opciones para tu paladar</p>
            <div class="card">
                <!-- Primer destacado, primera card -->
                <%
                    for(Cafeteria c:listacaf){
                %>        
                    
                <div class="content-card">
                    <div class="banner">
                        <img src="<%=c.getFot_caf()%>" alt="">
                    </div>
                    <div class="texto-card">
                        <h3><%=c.getNom_caf()%></h3>
                        <p><%=c.getDir_caf()%></p>
                        <a href="Cafeteria.jsp?id='<%=c.getId_caf()%>'">Visitar</a>
                    </div>
                </div>
                
                <%
                }
                %>
            </div>
        </section>
        
    </main>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="js/main.js"></script>

</body>
</html>