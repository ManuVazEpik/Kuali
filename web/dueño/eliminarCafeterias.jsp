<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/externals/normalize.css">
    <link rel="stylesheet" href="../css/eliminarCafeterias.css">
    <title>Dashboard | KUALI</title>
</head>
<body>
    <div class="contenedor-dashboard">
        <div class="menu-lateral">
            <img src="../img/logos/Logo_blanco.png" alt="Logo Kuali en color blanco">
            
            <div class="opciones-cafeteria">
            <a href="./verCafeterias.html">
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
                <a class="active" href="./eliminarCafeterias.jsp">
                    <i class="fas fa-trash fa-2x">
                        <h2 class="titulo-terciario">Eliminar Cafeterías</h2>
                    </i>
                </a>
                
                <a href="../usuario/inicioUsuarios.jsp">
                    <i class="fas fa-door-open fa-2x">
                        <h2 class="titulo-terciario">Regresar</h2>
                    </i>
                </a>
            </div>
        </div>

        <div class="contenido">
            <div class="menu-administrador">
                <div class="caja_busqueda">
                    <input class="card-filter" type="search" id='buscar-en-usuarios' placeholder="Buscar ...">
                    
                    <a class="boton_buscar">
                        <i class="fas fa-search"></i>
                    </a>
                </div>
                
                <img src="../img/perfil-ejemplo.jpg" alt="imagen de perfil del administrador">    
            </div>

            <!-- AQUI EMPIEZA TU CÓDIGO URIEL -->
            <div class="cafeterias">
                <div class="cafeteria">
                    <h1 class="titulo-terciario">Cafetería</h1>
                    <p class="texto">Estatus: Activo <i class="fas fa-circle"></i></p>
                    <a href=""><i class="fas fa-trash-alt fa-x"></i> Eliminar</a>
                </div>
                
                <div class="cafeteria">
                    <h1 class="titulo-terciario">Cafetería</h1>
                    <p class="texto">Estatus: Activo <i class="fas fa-circle"></i></p>
                    <a href=""><i class="fas fa-trash-alt fa-x"></i> Editar</a>
                </div>

                <div class="cafeteria">
                    <h1 class="titulo-terciario">Cafetería</h1>
                    <p class="texto">Estatus: Activo <i class="fas fa-circle"></i></p>
                    <a href=""><i class="fas fa-trash-alt fa-x"></i> Editar</a>
                </div>

                <div class="cafeteria">
                    <h1 class="titulo-terciario">Cafetería</h1>
                    <p class="texto">Estatus: Activo <i class="fas fa-circle"></i></p>
                    <a href=""><i class="fas fa-trash-alt fa-x"></i> Editar</a>
                </div>

            </div>
        </div>
    </div>

    <!-- SCRIPTS -->
    <script type="module" src="../../js/dashboard.js"></script>
    <script src="https://kit.fontawesome.com/59bcf5d722.js" crossorigin="anonymous"></script>
</body>
</html>
