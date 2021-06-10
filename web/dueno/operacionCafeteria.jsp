<%@page import="Clases.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Cafeteria" %>
<%@ page session="true" %>
<%
String idUS = "";
String usuario="";
HttpSession sessionOk = request.getSession();

if(sessionOk.getAttribute("usuario")==null){
    response.sendRedirect("../error.jsp?admrs=2"); 
}else if("0".equals(sessionOk.getAttribute("autorizacion"))){
    response.sendRedirect("../dueno/verCafeterias.jsp");
}else{

    usuario = (String)sessionOk.getAttribute("usuario");
    idUS = (String)session.getAttribute("id");

    int id_usu=Integer.parseInt(idUS);
    int id_caf=Integer.parseInt(request.getParameter("admrs").trim());
    Cafeteria opc = new Cafeteria();
    Cafeteria c=opc.getCafeteriaByIdCaf(id_caf);
    
    Usuario opu = new Usuario();
    Usuario u=opu.getUsuarioById(id_usu);
    
    if (u.getPerm_usu()==3){
%>
<!DOCTYPE>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script data-ad-client="ca-pub-1261964740268428" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <link href="../img/logos/granoCafe.png" type="image/x-icon" rel="shortcut icon" />
        <link rel="stylesheet" href="../css/externals/normalize.css">
        <link rel="stylesheet" href="../css/operacionCafeteria.css">
        <title>Modificar Cafeteria | KUALI</title>
    </head>
    <body>
        <div class="contenedor-dashboard">
            <div class="menu-lateral">
                <img src="../img/logos/Logo_blanco.png" alt="Logo Kuali en color blanco">
                
                <div class="opciones-cafeteria">
                    <a class="active" href="./verCafeterias.jsp">
                        <i class="fas fa-mug-hot fa-2x">
                            <h1 class="titulo-terciario">Ver Cafeterías</h1>
                        </i>
                    </a>
                    <a href="./registroCafeterias.jsp">
                        <i class="fas fa-mug-hot fa-2x">
                            <h1 class="titulo-terciario">Registrar Cafetería</h1>
                        </i>
                    </a>
                    <a href="./modificarCafeterias.jsp">
                        <i class="fas fa-pencil-alt fa-2x">
                            <h2 class="titulo-terciario">Modificar Cafeterías</h2>
                        </i>
                    </a>
                    <a href="./eliminarCafeterias.jsp">
                        <i class="fas fa-trash fa-2x">
                            <h2 class="titulo-terciario">Eliminar Cafeterías</h2>
                        </i>
                    </a>
                    <a href="../CerrarSesion">
                        <i class="fas fa-door-open fa-2x">
                            <h2 class="titulo-terciario">Cerrar Sesión</h2>
                        </i>
                    </a>
                </div>
            </div>

            <div class="contenido">
                <div class="modificar-cafeteria">
                    <div class="titulo">
                        <a href='modificarCafeterias.js'><i class="fas fa-chevron-circle-left fa-3x"></i></a>
                        <h1 class="titulo-principal">Modificar Cafetetería</h1>
                    </div>

                    <form name='formModificarCafeteria' action='../ActualizarCaf' method='POST' name='formModificarCafeteria'>
                        <input type='hidden' name='id_caf' value='<%=c.getId_caf()%>'/>
                        
                        <a class="texto" href="https://postimages.org" target="_blank">Accede a la siguiente página para subir la foto de tu cafeteria</a>.
                        
                        <div class="foto-producto">
                            <p class="texto">Copia el url que dice DirectLink y pégalo en el siguiente campo de texto</p>
                            <input class="texto campo" type="text" name="fot_caf" value="<%=c.getFot_caf()%>">
                        </div>
                        
                        <div class="nombre-cafeteria">
                            <p>Nombre Local</p> 
                            <input class="texto campo" type='text' name='nom_caf' value='<%=c.getNom_caf()%>'/>
                        </div>
                        
                        <div class="direccion">
                            <p>Direccion de la cafeteria</p> 
                            <input class="texto campo" type='text' name='dir_caf' value='<%=c.getDir_caf()%>'/>
                        </div>
                        
                        <input onclick="return validar()"type="submit" value="Aceptar"/>
                    </form>
                </div>
            </div>
        </div>

        <!-- SCRIPTS -->
        <script src="https://kit.fontawesome.com/59bcf5d722.js" crossorigin="anonymous"></script>
        <script src="../js/validarModificarCafeteria.js"></script>
    </body>
</html>
<%
    }else if(u.getPerm_usu()==2){
        response.sendRedirect("../usuario/inicioUsuarios.jsp");
    }else if(u.getPerm_usu()==1){
        response.sendRedirect("../administradorGeneral/administrarUsuarios.jsp");
    }else{
        response.sendRedirect("../index.html");
    }

}
%>