<%@page import="java.util.List"%>
<%@page import="model.CurriculumPojo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Boolean mostrarModalEditar = (Boolean) request.getAttribute("mostrarModalEditar");
    Boolean mostrarModalAgregar = (Boolean) request.getAttribute("mostrarModalAgregar");
    CurriculumPojo cEditar = (CurriculumPojo) request.getAttribute("curriculumEditar");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Curriculums</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .modal-simulado {
            display: none;
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0,0,0,0.5);
            z-index: 1000;
        }
        .modal-contenido {
            background: white;
            margin: 5% auto;
            padding: 20px;
            width: 60%;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4 text-center">Lista de Curriculums</h2>

    <!-- Botón para mostrar modal Agregar -->
    <div class="mb-3 text-end">
        <a href="ServletCurriculum?accion=mostrarAgregar" class="btn btn-success">Agregar Curriculum</a>
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover align-middle">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>ID Usuario</th>
                    <th>Años Experiencia</th>
                    <th>Estudios Obtenidos</th>
                    <th>Lugar Estudios</th>
                    <th>Referencia 1</th>
                    <th>Referencia 2</th>
                    <th>Tipo Trabajo</th>
                    <th>Habilidades</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<CurriculumPojo> lista = (List<CurriculumPojo>) request.getAttribute("curriculumsListar");
                    if (lista != null && !lista.isEmpty()) {
                        for (CurriculumPojo c : lista) {
                %>
                <tr>
                    <td><%= c.getIdCurriculum() %></td>
                    <td><%= c.getIdUsuario() %></td>
                    <td><%= c.getAñosExperiencia() %></td>
                    <td><%= c.getEstudiosObtenidos() %></td>
                    <td><%= c.getLugarEstudios() %></td>
                    <td><%= c.getNumeroReferencia1() %></td>
                    <td><%= c.getNumeroReferencia2() %></td>
                    <td><%= c.getTipoTrabajoBusca() %></td>
                    <td><%= c.getHabilidades() %></td>
                    <td>
                        <a href="ServletCurriculum?accion=editar&id=<%= c.getIdCurriculum() %>" class="btn btn-warning btn-sm">Editar</a>
                        <a href="ServletCurriculum?accion=eliminar&id=<%= c.getIdCurriculum() %>" 
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('¿Desea eliminar este curriculum?')">Eliminar</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr><td colspan="10" class="text-center">No hay curriculums registrados.</td></tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal Editar -->
<% if (mostrarModalEditar != null && mostrarModalEditar) { %>
<div class="modal-simulado" style="display:block;">
    <div class="modal-contenido">
        <h4>Editar Curriculum</h4>
        <form action="ServletCurriculum" method="post">
            <input type="hidden" name="accion" value="actualizar">
            <input type="hidden" name="id" value="<%= cEditar.getIdCurriculum() %>">

            <div class="mb-3"><label class="form-label">ID Usuario</label>
                <input type="number" name="idUsuario" class="form-control" value="<%= cEditar.getIdUsuario() %>" required></div>

            <div class="mb-3"><label class="form-label">Años Experiencia</label>
                <input type="text" name="añosExperiencia" class="form-control" value="<%= cEditar.getAñosExperiencia() %>"></div>

            <div class="mb-3"><label class="form-label">Estudios Obtenidos</label>
                <input type="text" name="estudiosObtenidos" class="form-control" value="<%= cEditar.getEstudiosObtenidos() %>"></div>

            <div class="mb-3"><label class="form-label">Lugar Estudios</label>
                <input type="text" name="lugarEstudios" class="form-control" value="<%= cEditar.getLugarEstudios() %>"></div>

            <div class="mb-3"><label class="form-label">Referencia 1</label>
                <input type="text" name="numeroReferencia1" class="form-control" value="<%= cEditar.getNumeroReferencia1() %>"></div>

            <div class="mb-3"><label class="form-label">Referencia 2</label>
                <input type="text" name="numeroReferencia2" class="form-control" value="<%= cEditar.getNumeroReferencia2() %>"></div>

            <div class="mb-3"><label class="form-label">Tipo Trabajo</label>
                <input type="text" name="tipoTrabajoBusca" class="form-control" value="<%= cEditar.getTipoTrabajoBusca() %>"></div>

            <div class="mb-3"><label class="form-label">Habilidades</label>
                <input type="text" name="habilidades" class="form-control" value="<%= cEditar.getHabilidades() %>"></div>

            <div class="text-end">
                <a href="ServletCurriculum?accion=listar" class="btn btn-secondary">Cancelar</a>
                <button type="submit" class="btn btn-primary">Guardar Cambios</button>
            </div>
        </form>
    </div>
</div>
<% } %>

<!-- Modal Agregar -->
<% if (mostrarModalAgregar != null && mostrarModalAgregar) { %>
<div class="modal-simulado" style="display:block;">
    <div class="modal-contenido">
        <h4>Agregar Curriculum</h4>
        <form action="ServletCurriculum" method="post">
            <input type="hidden" name="accion" value="agregar">

            <div class="mb-3"><label class="form-label">ID Usuario</label>
                <input type="number" name="idUsuario" class="form-control" required></div>

            <div class="mb-3"><label class="form-label">Años Experiencia</label>
                <input type="text" name="añosExperiencia" class="form-control"></div>

            <div class="mb-3"><label class="form-label">Estudios Obtenidos</label>
                <input type="text" name="estudiosObtenidos" class="form-control"></div>

            <div class="mb-3"><label class="form-label">Lugar Estudios</label>
                <input type="text" name="lugarEstudios" class="form-control"></div>

            <div class="mb-3"><label class="form-label">Referencia 1</label>
                <input type="text" name="numeroReferencia1" class="form-control"></div>

            <div class="mb-3"><label class="form-label">Referencia 2</label>
                <input type="text" name="numeroReferencia2" class="form-control"></div>

            <div class="mb-3"><label class="form-label">Tipo Trabajo</label>
                <input type="text" name="tipoTrabajoBusca" class="form-control"></div>

            <div class="mb-3"><label class="form-label">Habilidades</label>
                <input type="text" name="habilidades" class="form-control"></div>

            <div class="text-end">
                <a href="ServletCurriculum?accion=listar" class="btn btn-secondary">Cancelar</a>
                <button type="submit" class="btn btn-success">Agregar</button>
            </div>
        </form>
    </div>
</div>
<% } %>

</body>
</html>
