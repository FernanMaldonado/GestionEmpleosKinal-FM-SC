<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Portal de Empresas - Gestión de Empresas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>

            body {

                font-family: "Segoe UI", Arial, sans-serif;

                background-color: #f3f2ef;

                margin: 0;

            }

            .navbar {

                display: flex;

                justify-content: space-between;

                align-items: center;

                background-color: #fff;

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

                cursor: pointer;

            }

            .nav-links a:hover {

                color: #0a66c2;

            }

            .main-content {

                text-align: center;

                margin-top: 100px;

                padding: 0 20px;

            }

            .btn {

                display: inline-block;

                margin-top: 30px;

                padding: 12px 25px;

                background-color: #0a66c2;

                color: white;

                font-weight: 600;

                border-radius: 6px;

                text-decoration: none;

                transition: 0.3s;

            }

            .btn:hover {

                background-color: #004182;

            }

            .card-container {

                display: flex;

                flex-wrap: wrap;

                justify-content: center;

                gap: 20px;

                margin-top: 50px;

            }

            .card {

                background: white;

                border-radius: 10px;

                padding: 20px;

                width: 250px;

                box-shadow: 0 4px 12px rgba(0,0,0,0.1);

                text-align: center;

                transition: 0.3s;

                cursor: pointer;

            }

            .card:hover {

                transform: translateY(-5px);

            }

            .card h3 {

                color: #0a66c2;

                margin-bottom: 10px;

            }

            .card p {

                color: #555;

                font-size: 14px;

            }

            @media(max-width:768px){

                .card-container {

                    flex-direction: column;

                    align-items: center;

                }

            }
        </style>
    </head>
    <body>

        <nav class="navbar">
            <a href="PaginaMenuEmpresas.jsp" class="logo">JobLink - Empresas</a>
            <div class="nav-links">
                <a href="PaginaMenuEmpresas.jsp">Inicio</a>
                <a data-bs-toggle="modal" data-bs-target="#cuentaModal">Cuenta</a>
                <a href="ServletEmpresa?accion=mostrarAgregar" data-bs-toggle="modal" data-bs-target="#modalAgregarEmpresa">Agregar Empresa</a>
            </div>
        </nav>

        <div class="main-content">
            <h1>Bienvenido a JobLink para Empresas</h1>
            <p>Gestiona tus empresas y vacantes de manera eficiente.</p>
            <a href="ServletVacantes?accion=oportunidades" class="btn">Ver Oportunidades</a>

            <div class="card-container">
                <c:choose>
                    <c:when test="${not empty empresaListar}">
                        <c:forEach var="e" items="${empresaListar}">
                            <div class="card" data-bs-toggle="modal" data-bs-target="#modalEditarEmpresa">
                                <h3>Editar Empresa</h3>
                                <p><strong>Nombre:</strong> ${e.nombreEmpresa}</p>
                                <p><strong>Correo:</strong> ${e.correoEmpresa}</p>
                                <p><strong>Teléfono:</strong> ${e.telefonoEmpresa}</p>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="card" data-bs-toggle="modal" data-bs-target="#modalAgregarEmpresa">
                            <h3>Agregar Empresa</h3>
                            <p>Registra una nueva empresa</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Modal Agregar Empresa -->
        <div class="modal fade" id="modalAgregarEmpresa" tabindex="-1" aria-labelledby="modalAgregarLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <form action="ServletEmpresa" method="post">
                        <input type="hidden" name="accion" value="agregarEmpresa">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalAgregarLabel">Agregar Empresa</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Nombre de la Empresa</label>
                                    <input type="text" name="nombreEmpresa" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Correo de la Empresa</label>
                                    <input type="email" name="correoEmpresa" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Teléfono</label>
                                    <input type="text" name="telefonoEmpresa" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Dirección</label>
                                    <input type="text" name="direccion" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Contraseña</label>
                                    <input type="password" name="contrasena" class="form-control" required>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-success">Guardar Empresa</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Modal Editar Empresa -->
        <div class="modal fade" id="modalEditarEmpresa" tabindex="-1" aria-labelledby="modalEditarLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <c:forEach var="e" items="${empresaListar}">
                        <form action="ServletEmpresa" method="post">
                            <input type="hidden" name="accion" value="actualizar">
                            <input type="hidden" name="id" value="${e.idEmpresa}">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modalEditarLabel">Editar Empresa</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                            </div>
                            <div class="modal-body">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Nombre de la Empresa</label>
                                        <input type="text" name="nombreEmpresa" class="form-control" value="${e.nombreEmpresa}" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Correo de la Empresa</label>
                                        <input type="email" name="correoEmpresa" class="form-control" value="${e.correoEmpresa}" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Teléfono</label>
                                        <input type="text" name="telefonoEmpresa" class="form-control" value="${e.telefonoEmpresa}" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Dirección</label>
                                        <input type="text" name="direccion" class="form-control" value="${e.direccion}" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Contraseña</label>
                                        <input type="password" name="contrasena" class="form-control" value="${e.contrasena}" required>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary">Actualizar Empresa</button>
                            </div>
                        </form>
                    </c:forEach>
                </div>
            </div>
        </div>
        
          <!-- Modal Cuenta -->
        <div class="modal fade" id="cuentaModal" tabindex="-1" aria-labelledby="cuentaModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="cuentaModalLabel">Mi Cuenta</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body">
                        <p><strong>Nombre:</strong> ${sessionScope.empresa.nombreEmpresa}}</p>
                        <p><strong>Teléfono:</strong> ${sessionScope.empresa.telefonoEmpresa}</p>
                        <p><strong>Correo:</strong> ${sessionScope.empresa.correoEmpresa}</p>
                    </div>
                    <div class="modal-footer">
                        <a href="principal.jsp" class="btn btn-primary">Cerrar Sesión</a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
