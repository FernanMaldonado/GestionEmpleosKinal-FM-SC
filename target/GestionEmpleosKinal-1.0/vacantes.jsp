<%@page import="java.util.List"%>
<%@page import="model.VacantesPojo"%>
<%@page import="model.EmpresasPojo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Boolean mostrarModalEditar = (Boolean) request.getAttribute("mostrarModalEditar");
    Boolean mostrarModalAgregar = (Boolean) request.getAttribute("mostrarModalAgregar");
    VacantesPojo vEditar = (VacantesPojo) request.getAttribute("vacanteEditar");
    List<EmpresasPojo> empresasListar = (List<EmpresasPojo>) request.getAttribute("empresasListar");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Lista de Vacantes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .modal-simulado {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
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
            <h2 class="mb-4 text-center">Lista de Vacantes</h2>
            <div class="mb-3 text-end">
                <a href="PaginaMenuAdministradores.jsp" class="btn">Regresar a Menu Adminstradores</a>
            </div>
            <!-- Botón para mostrar modal Agregar -->
            <div class="mb-3 text-end">
                <a href="ServletVacantes?accion=mostrarAgregar" class="btn btn-success">Agregar Vacante</a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Empresa</th>
                            <th>Sueldo</th>
                            <th>Estudios Requeridos</th>
                            <th>Años Experiencia</th>
                            <th>Trabajo Vacante</th>
                            <th>Habilidades</th>
                            <th>Dirección Entrevista</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<VacantesPojo> lista = (List<VacantesPojo>) request.getAttribute("vacantesListar");
                            if (lista != null && !lista.isEmpty()) {
                                for (VacantesPojo v : lista) {
                        %>
                        <tr>
                            <td><%= v.getIdVacante()%></td>
                            <td><%= v.getEmpresa() != null ? v.getEmpresa().getNombreEmpresa() : ""%></td>
                            <td><%= v.getSueldo()%></td>
                            <td><%= v.getEstudiosRequeridos()%></td>
                            <td><%= v.getAñosExperienciaRequeridos()%></td>
                            <td><%= v.getTrabajoVacante()%></td>
                            <td><%= v.getHabilidadesRequeridas()%></td>
                            <td><%= v.getDireccionEntrevista()%></td>
                            <td>
                                <a href="ServletVacantes?accion=editar&id=<%= v.getIdVacante()%>" class="btn btn-warning btn-sm">Editar</a>
                                <a href="ServletVacantes?accion=eliminar&id=<%= v.getIdVacante()%>" 
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('¿Desea eliminar esta vacante?')">Eliminar</a>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr><td colspan="9" class="text-center">No hay vacantes registradas.</td></tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Modal Editar -->
        <% if (mostrarModalEditar != null && mostrarModalEditar) {%>
        <div class="modal-simulado" style="display:block;">
            <div class="modal-contenido">
                <h4>Editar Vacante</h4>
                <form action="ServletVacantes" method="post">
                    <input type="hidden" name="accion" value="actualizar">
                    <input type="hidden" name="id" value="<%= vEditar.getIdVacante()%>">

                    <div class="mb-3"><label class="form-label">Empresa</label>
                        <select name="idEmpresa" class="form-select" required>
                            <%
                                for (EmpresasPojo e : empresasListar) {
                                    String selected = (vEditar.getEmpresa() != null && vEditar.getEmpresa().getIdEmpresa() == e.getIdEmpresa()) ? "selected" : "";
                            %>
                            <option value="<%= e.getIdEmpresa()%>" <%= selected%>><%= e.getNombreEmpresa()%></option>
                            <% }%>
                        </select>
                    </div>

                    <div class="mb-3"><label class="form-label">Sueldo</label>
                        <input type="number" step="0.01" name="sueldo" class="form-control" value="<%= vEditar.getSueldo()%>" required></div>

                    <div class="mb-3"><label class="form-label">Estudios Requeridos</label>
                        <input type="text" name="estudiosRequeridos" class="form-control" value="<%= vEditar.getEstudiosRequeridos()%>"></div>

                    <div class="mb-3"><label class="form-label">Años Experiencia</label>
                        <input type="text" name="añosExperienciaRequeridos" class="form-control" value="<%= vEditar.getAñosExperienciaRequeridos()%>"></div>

                    <div class="mb-3"><label class="form-label">Trabajo Vacante</label>
                        <input type="text" name="trabajoVacante" class="form-control" value="<%= vEditar.getTrabajoVacante()%>"></div>

                    <div class="mb-3"><label class="form-label">Habilidades</label>
                        <input type="text" name="habilidadesRequeridas" class="form-control" value="<%= vEditar.getHabilidadesRequeridas()%>"></div>

                    <div class="mb-3"><label class="form-label">Dirección Entrevista</label>
                        <input type="text" name="direccionEntrevista" class="form-control" value="<%= vEditar.getDireccionEntrevista()%>"></div>

                    <div class="text-end">
                        <a href="ServletVacantes?accion=listar" class="btn btn-secondary">Cancelar</a>
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
                <h4>Agregar Vacante</h4>
                <form action="ServletVacantes" method="post">
                    <input type="hidden" name="accion" value="agregar">

                    <div class="mb-3"><label class="form-label">Empresa</label>
                        <select name="idEmpresa" class="form-select" required>
                            <%
                                for (EmpresasPojo e : empresasListar) {
                            %>
                            <option value="<%= e.getIdEmpresa()%>"><%= e.getNombreEmpresa()%></option>
                            <% } %>
                        </select>
                    </div>

                    <div class="mb-3"><label class="form-label">Sueldo</label>
                        <input type="number" step="0.01" name="sueldo" class="form-control" required></div>

                    <div class="mb-3"><label class="form-label">Estudios Requeridos</label>
                        <input type="text" name="estudiosRequeridos" class="form-control"></div>

                    <div class="mb-3"><label class="form-label">Años Experiencia</label>
                        <input type="text" name="añosExperienciaRequeridos" class="form-control"></div>

                    <div class="mb-3"><label class="form-label">Trabajo Vacante</label>
                        <input type="text" name="trabajoVacante" class="form-control"></div>

                    <div class="mb-3"><label class="form-label">Habilidades</label>
                        <input type="text" name="habilidadesRequeridas" class="form-control"></div>

                    <div class="mb-3"><label class="form-label">Dirección Entrevista</label>
                        <input type="text" name="direccionEntrevista" class="form-control"></div>

                    <div class="text-end">
                        <a href="ServletVacantes?accion=listar" class="btn btn-secondary">Cancelar</a>
                        <button type="submit" class="btn btn-success">Agregar</button>
                    </div>
                </form>
            </div>
        </div>
        <% }%>

    </body>
</html>