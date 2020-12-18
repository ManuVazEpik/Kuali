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
        <title>Iniciar Sesión</title>
    </head>
    <body>
        <form action="IniciarSesion" method="POST">
            <label>Correo: <input type="text" name="corU"/></label><br>
            <label>Contraseña <input type="text" name="conU"/></label><br>
            <input type="submit" value="Aceptar"/>
            
        </form>
    </body>
</html>
