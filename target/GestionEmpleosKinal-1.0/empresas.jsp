<%@page import="java.util.List"%>
<%@page import="model.EmpresasPojo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Boolean mostrarModalEditar = (Boolean) request.getAttribute("mostrarModalEditar");
    Boolean mostrarModalAgregar = (Boolean) request.getAttribute("mostrarModalAgregar");
    EmpresasPojo uEditar = (EmpresasPojo) request.getAttribute("empresaEditar");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Lista de Usuarios</title>
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
                width: 50%;
                border-radius: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="mb-4 text-center">Lista de Empresas</h2>

            <!-- Botón para mostrar modal Agregar -->
            <div class="mb-3 text-end">
                <a href="ServletEmpresa?accion=mostrarAgregar" class="btn btn-success">Agregar Empresas</a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Direccion</th>
                            <th>Teléfono</th>
                            <th>Correo</th>
                            <th>Contraseña</th>
                            <th>Fecha Registro</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<EmpresasPojo> listaUsuarios = (List<EmpresasPojo>) request.getAttribute("empresaListar");
                            if (listaUsuarios != null && !listaUsuarios.isEmpty()) {
                                for (EmpresasPojo u : listaUsuarios) {
                        %>
                        <tr>
                            <td><%= u.getIdEmpresa()%></td>
                            <td><%= u.getNombreEmpresa()%></td>
                            <td><%= u.getDireccion()%></td>
                            <td><%= u.getTelefonoEmpresa()%></td>
                            <td><%= u.getCorreoEmpresa()%></td>
                            <td><%= u.getContrasena()%></td>
                            <td><%= u.getFechaRegistro() != null ? u.getFechaRegistro() : ""%></td>
                            <td>
                                <a href="ServletEmpresa?accion=editar&id=<%= u.getIdEmpresa()%>" class="btn btn-warning btn-sm">Editar</a>
                                <a href="ServletEmpresa?accion=eliminar&id=<%= u.getIdEmpresa()%>" 
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('¿Desea eliminar esta empresa?')">Eliminar</a>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr><td colspan="8" class="text-center">No hay empresas registradas.</td></tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Modal Editar -->
        <% if (mostrarModalEditar != null && mostrarModalEditar) {%>
        <div class="modal-simulado" style="display:block;">
            <div class="modal-contenido">
                <h4>Editar Empresa</h4>
                <form action="ServletEmpresa" method="post">
                    <input type="hidden" name="accion" value="actualizar">
                    <input type="hidden" name="id" value="<%= uEditar.getIdEmpresa()%>">
                    <div class="mb-3"><label class="form-label">Nombre</label>
                        <input type="text" name="nombreEmpresa" class="form-control" value="<%= uEditar.getNombreEmpresa()%>" required></div>
                    <div class="mb-3"><label class="form-label">Correo</label>
                        <input type="email" name="correoEmpresa" class="form-control" value="<%= uEditar.getCorreoEmpresa()%>" required></div>
                    <div class="mb-3"><label class="form-label">Teléfono</label>
                        <input type="text" name="telefonoEmpresa" class="form-control" value="<%= uEditar.getTelefonoEmpresa()%>"></div>
                    <div class="mb-3"><label class="form-label">Contraseña</label>
                        <input type="text" name="contrasena" class="form-control" value="<%= uEditar.getContrasena()%>" required></div>
                    <div class="mb-3"><label class="form-label">Apellido</label>
                            <input type="text" name="direccion" class="form-control" value="<%= uEditar.getDireccion()%>" required></div>
                    <div class="text-end">
                        <a href="ServletEmpresa?accion=listar" class="btn btn-secondary">Cancelar</a>
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
                <h4>Agregar Empresa</h4>
                <form action="ServletEmpresa" method="post">
                    <input type="hidden" name="accion" value="agregar">
                    <div class="mb-3"><label class="form-label">Nombre</label>
                        <input type="text" name="nombreEmpresa" class="form-control" required></div>
                    <div class="mb-3"><label class="form-label">Correo</label>
                        <input type="email" name="correoEmpresa" class="form-control" required></div>
                    <div class="mb-3"><label class="form-label">Teléfono</label>
                        <input type="text" name="telefonoEmpresa" class="form-control"></div>
                    <div class="mb-3"><label class="form-label">Contraseña</label>
                        <input type="text" name="contrasena" class="form-control" required></div>
                    <div class="mb-3"><label class="form-label">Direccion</label>
                        <input type="text" name="direccion" class="form-control" required></div>
                    <div class="text-end">
                        <a href="ServletEmpresa?accion=listar" class="btn btn-secondary">Cancelar</a>
                        <button type="submit" class="btn btn-success">Agregar</button>
                    </div>
                </form>
            </div>
        </div>
        <% }%>

    </body>
</html>
