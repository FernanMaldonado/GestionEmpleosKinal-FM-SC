<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Portal de Empleos - Usuario</title>
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
            <a href="PaginaMenuUsuarios.jsp" class="logo">JobLink</a>
            <div class="nav-links">
                <a href="PaginaMenuUsuarios.jsp">Inicio</a>
                <a data-bs-toggle="modal" data-bs-target="#cuentaModal">Cuenta</a>
                <a href="#" data-bs-toggle="modal" data-bs-target="#modalSolicitudes">Solicitudes</a>
            </div>
        </nav>

        <div class="main-content">
            <h1>Bienvenido a JobLink</h1>
            <p>Conecta con tu próximo empleo, administra tu cuenta y revisa tus solicitudes.</p>
            <a href="buscarEmpleo.jsp" class="btn">Buscar Empleo</a>

            <div class="card-container">
                <c:choose>
                    <c:when test="${not empty curriculumsListar}">
                        <c:forEach var="c" items="${curriculumsListar}">
                            <div class="card" data-bs-toggle="modal" data-bs-target="#modalEditarCurriculum">
                                <h3>Ver / Editar Curriculum</h3>
                                <p><strong>Estudios:</strong> ${c.estudiosObtenidos}</p>
                                <p><strong>Experiencia:</strong> ${c.añosExperiencia}</p>
                                <p><strong>Habilidades:</strong> ${c.habilidades}</p>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="card" data-bs-toggle="modal" data-bs-target="#modalAgregarCurriculum">
                            <h3>Curriculum</h3>
                            <p>Agrega tu curriculum</p>
                        </div>
                    </c:otherwise>
                </c:choose>

                <!-- Barra de navegación -->
                <div class="nav-links">
                    <a href="#" data-bs-toggle="modal" data-bs-target="#modalSolicitudes">Solicitudes</a>
                </div>


                <a href="ServletVacantes?accion=oportunidades">
                    <div class="card">
                        <h3>Oportunidades Laborales</h3>
                        <p>Descubre empleos recomendados según tu perfil.</p>
                    </div>
                </a>
            </div>
        </div>

        <!-- Modal Agregar Curriculum -->
        <div class="modal fade" id="modalAgregarCurriculum" tabindex="-1" aria-labelledby="modalAgregarLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <form action="ServletCurriculum?accion=agregar" method="post">
                        <input type="hidden" name="accion" value="agregar">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalAgregarLabel">Agregar Curriculum</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Años de Experiencia</label>
                                    <input type="text" name="añosExperiencia" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Estudios Obtenidos</label>
                                    <input type="text" name="estudiosObtenidos" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Lugar de Estudios</label>
                                    <input type="text" name="lugarEstudios" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Referencia 1</label>
                                    <input type="text" name="numeroReferencia1" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Referencia 2</label>
                                    <input type="text" name="numeroReferencia2" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Tipo de Trabajo que Busca</label>
                                    <input type="text" name="tipoTrabajoBusca" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Habilidades</label>
                                    <input type="text" name="habilidades" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-success">Guardar Curriculum</button>
                        </div>
                    </form>
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
                        <p><strong>Nombre:</strong> ${sessionScope.usuario.nombreUsuario} ${sessionScope.usuario.apellidoUsuario}</p>
                        <p><strong>Teléfono:</strong> ${sessionScope.usuario.telefono}</p>
                        <p><strong>Correo:</strong> ${sessionScope.usuario.correo}</p>
                    </div>
                    <div class="modal-footer">
                        <a href="principal.jsp" class="btn btn-primary">Cerrar Sesión</a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Solicitudes -->
        <div class="modal fade" id="modalSolicitudes" tabindex="-1" aria-labelledby="modalSolicitudesLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalSolicitudesLabel">Mis Solicitudes</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Aquí se van a mostrar las solicitudes -->
                        <c:choose>
                            <c:when test="${not empty solicitudesList}">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Vacante</th>
                                            <th>Fecha Solicitud</th>
                                            <th>Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="solicitud" items="${solicitudesList}">
                                            <tr>
                                                <td>${solicitud.nombreVacante}</td>
                                                <td>${solicitud.fechaSolicitud}</td>
                                                <td>${solicitud.estadoSolicitud}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <p>No tienes solicitudes realizadas aún.</p>
                            </c:otherwise>
                        </c:choose>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
