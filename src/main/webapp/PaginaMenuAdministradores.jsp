<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" href="https://www.funko.com/on/demandware.static/Sites-FunkoUS-Site/-/default/dwdf4d4162/images/favicons/funko-favicon-96x96.png" />
        <link rel="stylesheet" href="style/inicio.css?<%= System.currentTimeMillis()%>">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                margin: 0;
                font-family: "Segoe UI", Arial, sans-serif;
                background-color: #f3f2ef;
            }

            /* ----- Barra superior ----- */
            .navbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: #ffffff;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                padding: 10px 30px;
                position: sticky;
                top: 0;
                z-index: 100;
            }

            .logo {
                font-size: 1.5em;
                font-weight: bold;
                color: #0a66c2;
                text-decoration: none;
            }

            .nav-links {
                display: flex;
                gap: 30px;
            }

            .nav-links a {
                text-decoration: none;
                color: #333;
                font-weight: 500;
                transition: color 0.3s;
            }

            .nav-links a:hover {
                color: #0a66c2;
            }

            /* ----- Contenedor de botones ----- */
            .buttone-container {
                display: flex;
                justify-content: center;
                margin-top: 40px;
                gap: 20px;
            }

            .buttone {
                padding: 10px 20px;
                background-color: #0a66c2;
                color: white;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
            }

            .buttone:hover {
                background-color: #004182;
            }

            /* ----- Modal ----- */
            .modal-content {
                border-radius: 10px;
            }

            .modal-header {
                background-color: #0a66c2;
                color: white;
                border-bottom: 2px solid #0a66c2;
            }

            .modal-body {
                font-size: 16px;
            }

            /* Pie de página */
            footer {
                background-color: #0a66c2;
                color: white;
                text-align: center;
                padding: 20px;
            }

            footer p {
                margin: 5px 0;
            }

        </style>

        <title>Gestion Empleos</title>
    </head>

    <body>

        <!-- Barra superior -->
        <nav class="navbar">
            <a href="principal.jsp" class="logo">JobLink</a>
            <div class="nav-links">
                <a href="principal.jsp">Inicio</a>
                <a data-bs-toggle="modal" data-bs-target="#cuentaModal">Cuenta</a>
            </div>
        </nav>

        <!-- Contenedor de botones -->
        <div class="buttone-container">
            <a href="ServletUsuario?accion=listar"><button class="buttone">Usuarios</button></a>
            <a href="ServletAdministrador?accion=listar"><button class="buttone">Administradores</button></a>
            <a href="ServletEmpresa?accion=listar"><button class="buttone">Empresas</button></a>
            <a href="ServletCurriculum?accion=listar"><button class="buttone">Curriculum</button></a>
            <a href="ServletVacantes?accion=listar"><button class="buttone">Vacantes</button></a>
        </div>

        <!-- Modal de Cuenta -->
        <div class="modal fade" id="cuentaModal" tabindex="-1" aria-labelledby="cuentaModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="cuentaModalLabel">Mi Cuenta</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body">
                        <p><strong>Nombre:</strong> ${sessionScope.admin.nombreAdministrador}</p>
                        <p><strong>Teléfono:</strong> ${sessionScope.admin.telefono}</p>
                        <p><strong>Correo:</strong> ${sessionScope.admin.correo}</p>
                    </div>
                    <div class="modal-footer">
                        <a href="principal.jsp" class="btn btn-primary">Cerrar Sesión</a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS & Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
    </body>
</html>
