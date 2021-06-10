<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Cafeteria"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../img/logos/granoCafe.png" type="image/x-icon" rel="shortcut icon" />
    <link rel="stylesheet" href="../css/externals/normalize.css">
    <link rel="stylesheet" href="../css/inicioUsuarios.css">
    <script data-ad-client="ca-pub-1261964740268428" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <title>Inicio | KUALI</title>
</head>
<%
    Cafeteria operc=new Cafeteria();
    ArrayList<Cafeteria> listacaf = operc.getCafeteriasAutorizadas();
%>    
<body>
    <div class="contenedor-principal">
        <nav class="menu">
                <div class="logo">
                    <a href="../index.html"><img src="../img/logos/Logo_negro.png" alt="Logotipo de KUALI color blanco"></a>
                </div>

                <div class="ubicacion">
                    <a href="./carritoCompras.jsp"><i class="fas fa-shopping-cart fa-lg"></i>Carrito de compras</a>
                </div>

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
    
        <div class="contenedor-promociones">
            <div class="encabezado">
                <h2 class="titulo-terciario">Promociones</h2>
                <p>Aprovecha ahora los descuentos que tenemos para ti.</p>

                <div class="contenedor-grid">
                    <div class="contenedor-producto">
                        <div class="imagen">
                            <img src="../img/Productos/brownie.jpg" class="imagen" alt="Primer Café">
                            <p class="texto-promocion">Solo $40.00 MXM</p>
                        </div>

                        <div class="descripcion">
                            <div class="producto">
                                <p class="texto-producto">Brownie de chocolate | Mokafe</p>
                                <hr />
                                <p class="texto-etiquetas">Brownie | Chocolate | Promociones | Postre</p>
                            </div>
                            <div class="boton">
                                <a href="">¡ Lo quiero !</a>
                            </div>

                        </div>
                    </div>
                    
                    <div class="contenedor-producto">
                        <div class="imagen">
                            <img src="../img/productos/sandwichJamon.jpg" class="imagen" alt="Primer Café">
                            <p class="texto-promocion">Solo $70.00 MXM</p>
                        </div>

                        <div class="descripcion">
                            <div class="producto">
                                <p class="texto-producto">Sandwich de Jamon | Europa</p>
                                <hr />
                                <p class="texto-etiquetas">Sandwich | Jamon | Promociones </p>
                            </div>
                            <div class="boton">
                                <a href="">¡ Lo quiero !</a>
                            </div>

                        </div>
                    </div>
                    
                    <div class="contenedor-producto">
                        <div class="imagen">
                            <img src="../img/productos/tazaChocolate.jpg" class="imagen" alt="Primer Café">
                            <p class="texto-promocion">Solo $55.00 MXM</p>
                        </div>

                        <div class="descripcion">
                            <div class="producto">
                                <p class="texto-producto">Taza de chocolate | Los amigos</p>
                                <hr />
                                <p class="texto-etiquetas">Chocolate | Bebida | Promociones</p>
                            </div>
                            <div class="boton">
                                <a href="">¡ Lo quiero !</a>
                            </div>

                        </div>
                    </div>
                    
                    <div class="contenedor-producto">
                        <div class="imagen">
                            <img src="../img/productos/pastelChocolate.jpg" class="imagen" alt="Primer Café"> 
                            <p class="texto-promocion">Solo $50.00 MXM</p>
                        </div>

                        <div class="descripcion">
                            <div class="producto">
                                <p class="texto-producto">Paster de chocolate | Lee</p>
                                <hr />
                                <p class="texto-etiquetas">Chocolate | Pastel | Promociones | Postre</p>
                            </div>
                            <div class="boton">
                                <a href="">¡ Lo quiero !</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="contenedor-favoritos">
            <div class="encabezado">
                <h2 class="titulo-terciario">Bebidas Especiales</h2>
                <p>Las ideales para esos momentos especiales.</p>
            </div>

            <div class="contenedor-grid">
                <div class="contenedor-producto">
                    <div class="imagen">
                        <img src="../img/productos/cafeAmericano.jpg" class="imagen" alt="Primer Café"> -->
                        <p class="texto-promocion">Solo $50.00 MXM</p>
                    </div>

                    <div class="descripcion">
                        <div class="producto">
                            <p class="texto-producto">Cafe Americano | Lee</p>
                            <hr />
                            <p class="texto-etiquetas">Americano | Café | Especial | Bebida</p>
                        </div>
                        <div class="boton">
                            <a href="">¡ Lo quiero !</a>
                        </div>

                    </div>
                </div>
                
                <div class="contenedor-producto">
                    <div class="imagen">
                        <img src="../img/productos/cafeCapuchino.jpg" class="imagen" alt="Primer Café"> -->
                        <p class="texto-promocion">Solo $45.00 MXM</p>
                    </div>

                    <div class="descripcion">
                        <div class="producto">
                            <p class="texto-producto">Cafe Capuchino | Mokafe</p>
                            <hr />
                            <p class="texto-etiquetas">Capuchino | Café | Especial | Moka</p>
                        </div>
                        <div class="boton">
                            <a href="">¡ Lo quiero !</a>
                        </div>

                    </div>
                </div>
                
                <div class="contenedor-producto">
                    <div class="imagen">
                        <img src="../img/productos/cafeExpreso.jpg" class="imagen" alt="Primer Café">
                        <p class="texto-promocion">Solo $50.00 MXM</p>
                    </div>

                    <div class="descripcion">
                        <div class="producto">
                            <p class="texto-producto">Cafe Expreso | Los amigos</p>
                            <hr />
                            <p class="texto-etiquetas">Expreso | Los amigos | Especial | Café</p>
                        </div>
                        <div class="boton">
                            <a href="">¡ Lo quiero !</a>
                        </div>

                    </div>
                </div>
                
                <div class="contenedor-producto">
                    <div class="imagen">
                        <img src="../img/productos/cafeLatte.jpg" class="imagen" alt="Primer Café"> -->
                        <p class="texto-promocion">Solo $55.00 MXM</p>
                    </div>

                    <div class="descripcion">
                        <div class="producto">
                            <p class="texto-producto">Cafe Latte | Europa</p>
                            <hr />
                            <p class="texto-etiquetas">Latte | Café | Especial | Europa</p>
                        </div>
                        <div class="boton">
                            <a href="">¡ Lo quiero !</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    
        <div class="contenedor-destacados">
            <div class="encabezado">
                <h2 class="titulo-terciario">Productos Destacadas</h2>
                <p>Conoce nuestros destacados, seguro te ancantarán.</p>
            </div>

            <div class="contenedor-grid">
                <div class="contenedor-producto">
                    <div class="imagen">
                        <img src="../img/productos/sandwichPollo.jpg" class="imagen" alt="Primer Café"> -->
                        <p class="texto-promocion">Solo $80.00 MXM</p>
                    </div>

                    <div class="descripcion">
                        <div class="producto">
                            <p class="texto-producto">Sandwich de Pollo | Los amigos</p>
                            <hr />
                            <p class="texto-etiquetas">Sandwich | Destacado | Pollo</p>
                        </div>
                        <div class="boton">
                            <a href="">¡ Lo quiero !</a>
                        </div>

                    </div>
                </div>
                
                <div class="contenedor-producto">
                    <div class="imagen">
                        <img src="../img/productos/croissant.jpg" class="imagen" alt="Primer Café"> -->
                        <p class="texto-promocion">Solo $40.00 MXM</p>
                    </div>

                    <div class="descripcion">
                        <div class="producto">
                            <p class="texto-producto">Croissant relleno | Lee</p>
                            <hr />
                            <p class="texto-etiquetas">Croissant | Pan | Destacado | Chocolate</p>
                        </div>
                        <div class="boton">
                            <a href="">¡ Lo quiero !</a>
                        </div>

                    </div>
                </div>
                
                <div class="contenedor-producto">
                    <div class="imagen">
                        <img src="../img/productos/frappeChocolate.jpg" class="imagen" alt="Primer Café"> -->
                        <p class="texto-promocion">Solo $55.00 MXM</p>
                    </div>

                    <div class="descripcion">
                        <div class="producto">
                            <p class="texto-producto">Frappe de Chocolate | Europa</p>
                            <hr />
                            <p class="texto-etiquetas">Frappe | Bebida | Destacado | Chocolate</p>
                        </div>
                        <div class="boton">
                            <a href="">¡ Lo quiero !</a>
                        </div>

                    </div>
                </div>
                
                <div class="contenedor-producto">
                    <div class="imagen">
                        <img src="../img/productos/molletes.jpg" class="imagen" alt="Primer Café"> -->
                        <p class="texto-promocion">Solo $70.00 MXM</p>
                    </div>

                    <div class="descripcion">
                        <div class="producto">
                            <p class="texto-producto">Molletes | Mokafe</p>
                            <hr />
                            <p class="texto-etiquetas">Molletes | Comida | Destacado </p>
                        </div>
                        <div class="boton">
                            <a href="">¡ Lo quiero !</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    
        <hr class="divisor" />
    
        <div class="menus-cafeterias">
            <div class="encabezado">
                <h2 class="titulo-terciario">Cafeterías</h2>
                <p>Aprovecha ahora los descuentos que tenemos para ti.</p>
                
                <div class="contenedor-cafeterias">
                    <i class="fas fa-chevron-left fa-2x"></i>

                    <div class="cafeterias">
                        <%
                        for(Cafeteria c:listacaf){
                        %>        
                        <div class="cafeteria">
                            <img src="<%=c.getFot_caf()%>" alt="Logo Cafeteria">

                            <a href="menuCafeteria.jsp?qwer=<%=c.getId_caf()%>">Ver men�</a>

                        <%
                        }
                        %>
                    </div>

                    <i class="fas fa-chevron-right fa-2x"></i>
                </div>
            </div>

            
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
                <a href="../avisoPrivacidad.html">Política de privacidad</a>
                <a href="../terminosyCondiciones.html">Terminos y Condiciones</a>
            </div>
        </div>
    </footer>
    
    <!-- SCRIPTS -->
    <script src="https://kit.fontawesome.com/59bcf5d722.js" crossorigin="anonymous"></script>
</body>
</html>