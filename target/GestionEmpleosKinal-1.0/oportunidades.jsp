<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Oportunidades de Vacante</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: "Segoe UI", Arial, sans-serif;
                background-color: #f3f2ef;
                margin: 0;
            }
            h1 {
                color: #0a66c2;
                margin-bottom: 30px;
                text-align: center;
            }
            .card {
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
                transition: transform 0.3s;
            }
            .card:hover {
                transform: translateY(-5px);
            }
            .card-footer {
                background-color: #f8f9fa;
            }
            @media(max-width:768px){
                .col-md-4 {
                    margin-bottom: 20px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container my-5">
            <h1>Oportunidades de Vacante</h1>
            <div class="row">
                <!-- Recorremos cada vacante -->
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
                                <!-- Botón para enviar solicitud -->
                                <form action="EnviarSolicitudServlet" method="post">
                                    <input type="hidden" name="idVacante" value="${vacante.idVacante}">
                                    <button type="submit" class="btn btn-primary">Enviar Solicitud</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
