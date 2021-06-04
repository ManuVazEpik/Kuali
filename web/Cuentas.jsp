<%-- 
    Document   : Cuentas
    Created on : 10/12/2020, 12:22:20 PM
    Author     : bocal
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Cafeteria"%>
<%@page import="Clases.Usuario"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
String idUS = "";
String usuario="";
HttpSession sessionOk = request.getSession();
System.out.println("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
if(sessionOk.getAttribute("id")==null){
   
%>
        <jsp:forward page="index.html">
            <jsp:param name="error" value="Es obligatorio identificarse"/>
        </jsp:forward>}
<%   
}else{
    usuario = (String)sessionOk.getAttribute("usuario");
    idUS = (String)session.getAttribute("id");

    int id_usu=Integer.parseInt(idUS);
    System.out.println(id_usu);
    Usuario opc = new Usuario();
    Usuario u=opc.getUsuarioById(id_usu);
    String tipo="";
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cuentas</title>
        <link rel="StyleSheet" href="css/style.css" type="text/css" MEDIA=screen>
        <script data-ad-client="ca-pub-1261964740268428" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    </head>
    <body class="hiden">
    <header>
        
        <nav id="nav" class="nav1">
            <div class="contenedor-nav">
                <div class="logo">
                    <img src="" alt="">
                </div>
                <div class="enlaces" id="enlaces">
                    <a href="index.jsp" id="enlace-" class="btn-header">Cafeterias</a>
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

    <h1>Datos</h1>
    <ul>
        <li>Nombre completo:<%=u.getNom_usu()+" "+u.getAppat_usu()+" "+u.getApmat_usu()%> <br></li>
        <li>Telefono: <%=u.getTel_usu()%></li>
        <li>Email: <%=u.getEmail_usu()%><br></li>
        <li>Password: <%=u.getPass_usu()%><br></li>
    </ul>
    
    <a href="CerrarSesion">Cerrar Sesion</a>
    <h2>Modificar</h2>
    <form action='ActualizarUsu' method='POST' name='formulario1'>
        <input type='hidden' name='id_usu' value='<%=id_usu%>'/>
    <ul>
        <li>Nombre: <input type='text' name='nom_usu' value='<%=u.getNom_usu()%>'/></li>
        <li>Apellido paterno: <input type='text' name='appat_usu' value='<%=u.getAppat_usu()%>'/></li>
        <li>Apellido materno: <input type='text' name='apmat_usu' value='<%=u.getApmat_usu()%>'/></li>
        <li>Telefono: <input type='text' name='tel_usu' value='<%=u.getTel_usu()%>'/></li>
        <input type="submit" value="Aceptar"/>
    </ul>
    </form>
    <h2>Eliminar</h2>
    <form action='EliminarUsu' method='POST'>
        <input type='hidden' name='id' value='<%=id_usu%>'/>
        <input type='hidden' name='tipo' value='<%=u.getPerm_usu()%>'/>
        <input type="submit" value="Eliminar"/>
    </form>
    <%
        Cafeteria operC=new Cafeteria();
    boolean caftener=operC.comprobarCafExiste(id_usu);
    if (u.getPerm_usu()==3 && caftener==true){
        ArrayList<Cafeteria> listacaf = Cafeteria.getCafeteriaById(id_usu);
        
    %>
            <br><br>
            <h2>Cafeterias Registradas</h2>
            <table>
                <th>Nombre</th>
                <th>Autorizacion</th>
                <%
                for (Cafeteria caf : listacaf) {
                    int autorizacion=operC.comprobarAutorizacion(id_usu);
                    if (autorizacion==1) {
                %>
                <tr>
                    <td><%=caf.getNom_caf()%></td>
                    <td>
                        <h3>Ingresa a los datos de tu cafeteria</h3>
                        <form action="ModificarCafeteria.jsp" method="POST">
                            <input type="hidden" name="admrs" value='<%=caf.getId_caf()%>'/>
                            <input type="submit" value="Ingresar"/>
                        </form>
                    </td>
                </tr>
            <%  }else if(autorizacion==2){%>
                <tr>
                    <td><%=caf.getNom_caf()%></td>
                    <td>
                        Sigue en proceso de autorización
                    </td>
                </tr>
            <%  }else if(autorizacion==3){%>
                <tr>
                    <td><%=caf.getNom_caf()%></td>
                    <td>
                        <h2>Su cafeteria ha sido rechazada</h2>
                        <form action="EliminarCaf" method="POST">
                            <input type="hidden" name="id" value='<%=caf.getId_caf()%>'/>
                            <input type="submit" value="Eliminar"/>
                        </form>
                    </td>
                </tr>
            <%  }   %>
            </table>
            <br><br>
            <h2>Registrar una cafeteria</h2>
            <form action="RegistrarCaf" method="POST">
                <a href="https://postimages.org" target="_blank">Accede a la siguiente página para subir la foto de tu cafeteria</a>.
                <p>Copia el url que dice DirectLink y pégalo en el siguiente campo de texto</p>
                <input type="text" name="fot_caf"><br>
                <input type='hidden' name="id_usuC" value='<%=id_usu%>'/>
                Ingresa el nombre de tu cafeteria<input type="text" name="nom_caf"/><br>
                Ingresa la calle de tu local<input type="text" name="calle_caf"><br>
                Ingresa la colonia de tu local<input type="text" name="col_caf"><br>
                Ingresa el numero de tu local<input type="text" name="num_caf"><br>
                <input type="submit" value='Aceptar'/>
            </form>
    <%  }
    }else if(u.getPerm_usu()==3){%>
    <h2>Registrar una cafeteria</h2>
    <form action="RegistrarCaf" method="POST">
        <a href="https://postimages.org" target="_blank">Accede a la siguiente página para subir la foto de tu cafeteria</a>.
        <p>Copia el url que dice DirectLink y pégalo en el siguiente campo de texto</p>
        <input type="text" name="fot_caf"><br>
        <input type='hidden' name="id_usuC" value='<%=id_usu%>'/>
        Ingresa el nombre de tu cafeteria<input type="text" name="nom_caf"/><br>
        Ingresa la calle de tu local<input type="text" name="calle_caf"><br>
        Ingresa la colonia de tu local<input type="text" name="col_caf"><br>
        Ingresa el numero de tu local<input type="text" name="num_caf"><br>
        <input type="submit" value='Aceptar'/>
    </form>
    <%
    }
    %>
    
    </body>
</html>
<%
}
%>
