<%@page import="java.time.*"%>
<%@page import="Clases.Productos"%>
<%@page import="Clases.DetallePedido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../img/logos/granoCafe.png" type="image/x-icon" rel="shortcut icon" />
    <link rel="stylesheet" href="../css/externals/normalize.css">
    <link rel="stylesheet" href="../css/carritoCompras.css">
    <title>Mi carrito | KUALI</title>
</head>
<body>
    <%
        String usuario = "";
        HttpSession sessionOk = request.getSession();
        if (sessionOk.getAttribute("id")== null){
            response.sendRedirect("../error.jsp?admrs=2"); 
        }else{
            usuario = (String)sessionOk.getAttribute("usuario");
        }
    %>
    <div class="contenedor-principal">
        <nav class="menu">
            <div class="logo">
                <a href="../index.html"><img src="../img/logos/Logo_negro.png" alt="Logotipo de KUALI color blanco"></a>
            </div>
            
            <div class="ubicacion">
                <a href="./inicioUsuarios.jsp"><i class="fas fa-store-alt fa-lg"></i>Cafeterías</a>
            </div>
            <%
                String id_cafS = request.getParameter("admrs");
                int id_caf = 0;
                if(id_cafS!=null){
                    id_caf = Integer.parseInt(id_cafS);
            %>
            
            <div class="ubicacion">
                <a href="./menuCafeteria.jsp?qwer=<%=id_caf%>"><i class="fas fa-mug-hot fa-lg"></i>Menú</a>
            </div>
            
            <%    
                }
            %>
            
            <div class="pedidos-agendados">
                <a href="../pedidosAgendados.jsp"><i class="fas fa-calendar-alt fa-lg"></i>Mis Pedidos Agendados</a>
            </div>
            
            <div class="ubicacion">
                <a href="./ajustesUsuarios.jsp"><i class="fas fa-user-cog fa-lg"></i>Perfil</a>
            </div>
    
            <div class="opciones-usuario">
                
                <img src="../img/perfil-ejemplo.jpg" alt="imagen de perfil del usuario actual">
            </div>
        </nav>
        
        <div class="carrito">
            <%
            ArrayList<DetallePedido> productos = session.getAttribute("carrito") == null ? null : (ArrayList) session.getAttribute("carrito") ;
                double total = 0;
                if (productos != null){
            %>
            <div class="table-header">
                <h1 class="titulo-principal">Mi Carrito</h1>
                <p class="texto">¡ Hey ! Aquí puedes ver tus productos listos para ordenar.</p>
            </div>   

            <table>
            <%for (DetallePedido a: productos) {
                Productos oprod = new Productos();
                Productos prod = oprod.getProductoById(a.getId_prod());
            %>
                <tr>
                    <td>
                        <img src="<%=prod.getFot_prod()%>">
                    </td>
                    <td>
                        <input type="text" name="nombre" value="<%=prod.getNom_prod()%>" autocomplete="off" size="2" readonly>
                    </td>
                    <td>
                        <input type="text" name="precio" value="<%=prod.getPre_prod()%>" autocomplete="off" size="2" readonly>
                    </td>
                    <td>
                        <div>
                            <input type="text" name="cantidad" value="<%=a.getCant_detPed()%>" autocomplete="off" size="2" readonly>
                        </div>
                    </td>
                    <td>
                        <input type="text" name="subtotal" value="<%=a.getSub_detPed()%>" autocomplete="off" size="2" readonly>
                        <%  total = total + a.getSub_detPed();
                        %>
                    </td>
                    <td>
                        <form action="../EliminarDelCarro" method="POST">
                            <% System.out.println(prod.getId_prod()); %>
                            <input type="hidden" value="<%=prod.getId_prod()%>" name="id_elm">
                            <input type="submit" value="X" class="cancelar">

                        </form>
                    </td>
                </tr>
            
            <br>
        <%} %>
            </table>

            <form class="ordenar" action="../Ordenar" method="POST">
                <div class="ordenar-header">
                    <h1 class="titulo-secundario">Agendar</h1>
                    <p class="texto">Por favor, índicanos la fecha y hora en la que llegarás a la cafetería.</p>
                </div>

                <div class="total">
                    <p class="texto">Total a pagar: </p>
                    <input type="text" name="total" value="<%= total%>" readonly=""><br>
                </div>
                
                <div class="fecha">
                    <p class="texto">Fecha</p>
                    <input type="date" name="fecha"/><br>
                </div>
               
                <div class="hora">
                    <p class="texto">Hora</p>
                    <select name='hora'>
                        <option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option>
                        <option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option>
                        <option>19</option><option>20</option>
                    </select>
                </div>
            
                <div class="minutos">
                    <p class="texto">Minutos</p>
                    <select name='minuto'>
                        <option>00</option>
                        <option>15</option>
                        <option>30</option>
                        <option>45</option>
                    </select>
                </div>

                <%--<input type="hidden" hidden="" name="fecha" value="<%date.toString();%>">--%>
                <input type="hidden" name="id_usu" value="<%= sessionOk.getAttribute("id") %>">
                <input type="hidden" name="id_caf" value="<%= id_caf %>">
                
                <div class="boton">
                    <input type="submit" value="Ordenar">
                </div>
            </form>

            <%
            }else{%>
            <h2 class="titulo-principal">No hay Articulos en el carro</h2> 
            <%}
            %>
            </div>
        </div>

    <footer>
        <div class="presentacion-kuali">
            <h3>KUALI</h3>
            <p>El único sistema de servicio instantáneo y reservaciones en la CDMX.</p>
        </div>

        <div class="derechos">
            <p>© 2021 Axolo Software. Todos los derechos reservados.</p>
            <div class="enlacer">
                <a href="./avisoPrivacidad.html">Política de privacidad</a>
                <a href="./terminosyCondiciones.html">Terminos y Condiciones</a>
            </div>
        </div>
    </footer>
    
    <!-- SCRIPTS -->
    <script src="https://kit.fontawesome.com/59bcf5d722.js" crossorigin="anonymous"></script>
</body>
</html>