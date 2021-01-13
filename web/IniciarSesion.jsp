<%-- 
    Document   : IniciarSesion
    Created on : 10/12/2020, 11:34:21 AM
    Author     : bocal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
        <link rel="stylesheet" href="css/reginisesion.css">
        <link rel="stylesheet" href="css/style.css">
        <script data-ad-client="ca-pub-1261964740268428" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <title>Iniciar Sesión</title>
    </head>
    <body>
        <header>
            <div class="letras">
            <h1>Instant Lunch</h1>
            <h2>¿Que comeras hoy?</h2>
        </div>
        </header>
        <form class="formulario" action="IniciarSesion" method="POST">

            <h1>Inicie Sesión</h1>
            <div class="contenedor">



                <div class="input-contenedor">
                    <i class="fas fa-envelope icon"></i>
                    <input type="text" name="corU" placeholder="Correo Electronico">

                </div>

                <div class="input-contenedor">
                    <i class="fas fa-key icon"></i>
                    <input type="password" name="conU" placeholder="Contraseña">

                </div>
                <input type="submit" value="Iniciar Sesión" class="button">
                <p>Al registrarte, aceptas nuestras Condiciones de uso y Política de privacidad.</p>
                <p>¿No tienes una cuenta? <a class="link" href="RegistrarUsuario.html">Registrate </a></p>
            </div>
        </form>
    </body>
</html>
