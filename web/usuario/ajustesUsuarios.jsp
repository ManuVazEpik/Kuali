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
    response.sendRedirect("../error.jsp?admrs=2");  
}else{
    usuario = (String)sessionOk.getAttribute("usuario");
    idUS = (String)session.getAttribute("id");

    int id_usu=Integer.parseInt(idUS);
    Usuario opc = new Usuario();
    Usuario u=opc.getUsuarioById(id_usu);
    String tipo="";
    
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../img/logos/granoCafe.png" type="image/x-icon" rel="shortcut icon" />
    <link rel="stylesheet" href="../css/externals/normalize.css">
    <link rel="stylesheet" href="../css/ajustesUsuarios.css">
    <script data-ad-client="ca-pub-1261964740268428" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <title>Ajustes | KUALI</title>
</head>
<body>
    <div class="contenedor-principal">
        <%
        if(u.getPerm_usu()==3){
        %>
        <nav class="menu">
           <div class="logo">
                <a href="./inicioUsuarios.jsp"><img src="../img/logos/Logo_negro.png" alt="Logotipo de KUALI color blanco"></a>
            </div>
            
            <div class="ubicacion">
                <a href="../dueno/verCafeterias.jsp"><i class="fas fa-mug-hot fa-lg"></i>Cafeterias</a>
            </div>
            
            <div class="pedidos-agendados">
                <a href="../pedidosAgendados.jsp"><i class="fas fa-calendar-alt fa-lg"></i>Mis Pedidos Agendados</a>
            </div>
            
            <div class="opciones-usuario">
                <a href="inicioUsuarios.jsp"><img src="../img/administrador-perfil.png" alt="imagen de perfil del usuario actual"></a>
            </div>
        </nav>
        <%
            }else{
        %>
        <nav class="menu">
           <div class="logo">
                <a href="./inicioUsuarios.jsp"><img src="../img/logos/Logo_negro.png" alt="Logotipo de KUALI color blanco"></a>
            </div>

            <div class="ubicacion">
                <a href="./carritoCompras.jsp"><i class="fas fa-shopping-cart fa-lg"></i>Carrito de compras</a>
            </div>
            
            <div class="pedidos-agendados">
                <a href="../pedidosAgendados.jsp"><i class="fas fa-calendar-alt fa-lg"></i>Mis Pedidos Agendados</a>
            </div>
            
            <div class="ubicacion">
                <a href="./inicioUsuarios.jsp"><i class="fas fa-store-alt fa-lg"></i>Cafeterías</a>
            </div>
    
            <div class="opciones-usuario">
                <a href="inicioUsuarios.jsp"><img src="../img/perfil-ejemplo.jpg" alt="imagen de perfil del usuario actual"></a>
            </div>
        </nav>
        <%
            }
        %>
        <div class="perfil">
            <div class="mis-datos">
                <h1 class="titulo-principal">Mis Datos</h1>

                <div class="datos-actuales">
                    <p class="texto"><span>completo:</span> <%=u.getNom_usu()+" "+u.getAppat_usu()+" "+u.getApmat_usu()%></p>
                    <p class="texto"><span>Telefono:</span> <%=u.getTel_usu()%></p>
                    <p class="texto"><span>Email:</span> <%=u.getEmail_usu()%></p>
                    <p class="texto"><span>Password:</span> <%=u.getPass_usu()%></p>
                </div>
            </div>
            
            <div class="under">
                <div class="modificar-datos">
                    <h2 class="titulo-secundario">Modificar</h2>

                    <form action='../ActualizarUsu' method='POST' name='formulario1'>
                        <input type='hidden' name='id_usu' value='<%=id_usu%>'/>
                        
                        <div class="nombre">
                            <p class="texto">Nombre: </p>
                            <input class="campo" type='text' name='nom_usu' value='<%=u.getNom_usu()%>'/>
                        </div>
                        
                        <div class="apellido-p">
                            <p class="texto">Apellido paterno: </p>
                            <input class="campo" type='text' name='appat_usu' value='<%=u.getAppat_usu()%>'/>
                        </div>
                        
                        <div class="apellido-m">
                            <p class="texto">Apellido materno: </p>
                            <input class="campo" type='text' name='apmat_usu' value='<%=u.getApmat_usu()%>'/>
                        </div>
                        
                        <div class="telefono">
                            <p class="texto">Telefono: </p>
                            <input class="campo" type='text' name='tel_usu' value='<%=u.getTel_usu()%>'/>
                        </div>
                        
                        <input type="submit" value="Aceptar"/>
                    </form>
                </div>
        
               <div class="eliminar-datos">
                    <h2 class="titulo-secundario">Eliminar Perfil</h2>
                    <form action='../EliminarUsu' method='POST'>
                        <input type='hidden' name='id' value='<%=id_usu%>'/>
                        <input type='hidden' name='tipo' value='<%=u.getPerm_usu()%>'/>
                        <input onclick="return confirmacion2()" type="submit" value="Eliminar"/>
                    </form>
               </div>
            </div>
        </div>
    </div>
    
    <footer>
        <div class="presentacion-kuali">
            <h3>KUALI</h3>
            <p>El único sistema de servicio instantáneo y reservaciones en la CDMX.</p>
        </div>

        <div class="redes-sociales">

        </div>

        <div class="derechos">
            <p>© 2021 Axolo Software. Todos los derechos reservados.</p>
            <div class="enlacer">
                <a href="../avisoPrivacidad.html">Política de privacidad</a>
                <a href="../terminosyCondiciones.html">Terminos y Condiciones</a>
            </div>
        </div>
    </footer>

    <!-- SCRIPTS -->
    <script src="https://kit.fontawesome.com/59bcf5d722.js" crossorigin="anonymous"></script>
    <script src="../js/Cancelacion.js"></script>
</body>
</html>
<%
}
%>