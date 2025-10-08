<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Oportunidades de Vacante</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            /* Estilos para los modales */
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
        </style>
    </head>
    <body>

        <div class="container my-5">
            <h1 class="text-center">Oportunidades de Vacante</h1>
            <div class="row">
                <c:forEach var="vacante" items="${vacantesListar}">
                    <div class="col-md-4 mb-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <h5 class="card-title">${vacante.trabajoVacante}</h5>
                                <p class="card-text"><strong>Empresa:</strong> ${vacante.empresa.nombreEmpresa}</p>
                                <p class="card-text"><strong>Sueldo:</strong> Q${vacante.sueldo}</p>
                                <p class="card-text"><strong>Estudios requeridos:</strong> ${vacante.estudiosRequeridos}</p>
                                <p class="card-text"><strong>Años de experiencia:</strong> ${vacante.añosExperienciaRequeridos}</p>
                                <p class="card-text"><strong>Habilidades:</strong> ${vacante.habilidadesRequeridas}</p>
                                <p class="card-text"><strong>Dirección de entrevista:</strong> ${vacante.direccionEntrevista}</p>
                            </div>
                            <div class="card-footer text-center">
                                <!-- Formulario para enviar la solicitud con AJAX -->
                                <form id="formSolicitud-${vacante.idVacante}" class="formSolicitud" method="post">
                                    <input type="hidden" name="idVacante" value="${vacante.idVacante}">
                                    <button type="submit" class="btn btn-primary">Enviar Solicitud</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Modal de Éxito -->
        <div class="modal fade" id="modalExito" tabindex="-1" aria-labelledby="modalExitoLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalExitoLabel">¡Éxito!</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Tu solicitud ha sido enviada correctamente.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal de Error -->
        <div class="modal fade" id="modalError" tabindex="-1" aria-labelledby="modalErrorLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalErrorLabel">Error</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>No se pudo enviar tu solicitud. Inténtalo nuevamente más tarde.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- JavaScript para manejar el formulario con AJAX -->
        <script>
            $(document).ready(function() {
                // Enviar solicitud mediante AJAX
                $('.formSolicitud').on('submit', function(e) {
                    e.preventDefault(); // Prevenir el envío normal del formulario

                    var form = $(this);
                    var formData = form.serialize(); // Obtener los datos del formulario

                    $.ajax({
                        url: 'EnviarSolicitudServlet',
                        type: 'POST',
                        data: formData,
                        success: function(response) {
                            if (response.success) {
                                // Mostrar modal de éxito
                                $('#modalExito').modal('show');
                            } else {
                                // Mostrar modal de error
                                $('#modalError').modal('show');
                            }
                        },
                        error: function() {
                            // Si ocurre un error en la petición
                            $('#modalError').modal('show');
                        }
                    });
                });
            });
        </script>

    </body>
</html>
