<%-- 
    Document   : Cuentas
    Created on : 10/12/2020, 12:22:20 PM
    Author     : bocal
--%>
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

if(sessionOk.getAttribute("usuario")==null){
   
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
    if(u.getPerm_usu()==2){
        tipo="cliente";
    }
    Cafeteria operC=new Cafeteria();
    boolean caftener=operC.comprobarCafExiste(id_usu);
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cuentas</title>
    </head>
    <body>

    <h1>Datos</h1>
    <ul>
        <li>Nombre completo:<%=u.getNom_usu()+" "+u.getAppat_usu()+" "+u.getApmat_usu()%> <br></li>
        <li>Telefono: <%=u.getTel_usu()%></li>
        <li>Email_usu <%=u.getEmail_usu()%><br></li>
        <li>Pass_usu: <%=u.getPass_usu()%><br></li>
    </ul>
    
    <a href="CerrarSesion">Cerrar Sesion</a>
    <h2>Modificar</h2>
    <form action='ActualizarUsu' method='POST' name='formulario1'>
        <input type='hidden' name='id_usu' value='<%=id_usu%>'/>
        <input type='hidden' name='tipo' value='2'/>
    
    <ul>
        <li>Nombre: <input type='text' name='nomU' value='<%=u.getNom_usu()%>'/></li>
        <li>Apellido paterno: <input type='text' name='appatU' value='<%=u.getAppat_usu()%>'/></li>
        <li>Apellido materno: <input type='text' name='apmatU' value='<%=u.getApmat_usu()%>'/></li>
        <li>Telefono: <input type='text' name='telU' value='<%=u.getTel_usu()%>'/></li>
        <input type="submit" value="Aceptar"/>
    </ul>
    </form>
    <h2>Eliminar</h2>
    <form action='EliminarUsu' method='POST'>
        <input type='hidden' name='id' value='<%=id_usu%>'/>
        <input type='hidden' name='per_usu' value='<%=u.getPerm_usu()%>'/>
        <input type="submit" value="Eliminar"/>
    </form>
    <%
    if (caftener==true){
        int autorizacion=operC.comprobarAutorizacion(id_usu);
        if (autorizacion==1) {%>
        <h2>Ingresa a los datos de tu cafeteria</h2>
        <form action="ModificarCafeteria.jsp">
            <input type="hidden" name="id_usu" value='<%=id_usu%>'/>
            <input type="submit" value="Ingresar"/>
        </form>
    <%
        }else if(autorizacion==2){%>
        <h2>Su cafeteria sigue en proceso de autorizacion</h2>
    <%  }else if(autorizacion==3){%>
        <h2>La solicitud de su cafeteria ha sido rechazada</h2>
    <%  }
    }else{%>
    <h2>Registrar una cafeteria</h2>
    <form enctype="multipart/form-data" action="RegistrarCaf" method="POST">
        <input type='hidden' name="id_usuC" value='<%=id_usu%>'/>
        Ingresa el nombre de tu cafeteria<input type="text" name="nom_caf"/><br>
        Ingresa una foto de tu local<input type="file" name="fot_caf"><br>
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
