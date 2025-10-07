<%@page import="java.util.List"%>
<%@page import="model.UsuarioPojo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Boolean mostrarModalEditar = (Boolean) request.getAttribute("mostrarModalEditar");
    Boolean mostrarModalAgregar = (Boolean) request.getAttribute("mostrarModalAgregar");
    UsuarioPojo uEditar = (UsuarioPojo) request.getAttribute("usuarioEditar");
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
            <h2 class="mb-4 text-center"> Lista de Usuarios </h2>
            <div class="mb-3 text-end">
                <a href="PaginaMenuAdministradores.jsp" class="btn">Regresar a Menu Adminstradores</a>
            </div>
            <!-- Botón para mostrar modal Agregar -->
            <div class="mb-3 text-end">
                <a href="ServletUsuario?accion=mostrarAgregar" class="btn btn-success">Agregar Usuario</a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Teléfono</th>
                            <th>Correo</th>
                            <th>Contraseña</th>
                            <th>Fecha Registro</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<UsuarioPojo> listaUsuarios = (List<UsuarioPojo>) request.getAttribute("usuarioListar");
                            if (listaUsuarios != null && !listaUsuarios.isEmpty()) {
                                for (UsuarioPojo u : listaUsuarios) {
                        %>
                        <tr>
                            <td><%= u.getIdUsuario()%></td>
                            <td><%= u.getNombreUsuario()%></td>
                            <td><%= u.getApellidoUsuario()%></td>
                            <td><%= u.getTelefono()%></td>
                            <td><%= u.getCorreo()%></td>
                            <td><%= u.getContrasena()%></td>
                            <td><%= u.getFechaRegistro() != null ? u.getFechaRegistro() : ""%></td>
                            <td>
                                <a href="ServletUsuario?accion=editar&id=<%= u.getIdUsuario()%>" class="btn btn-warning btn-sm">Editar</a>
                                <a href="ServletUsuario?accion=eliminar&id=<%= u.getIdUsuario()%>" 
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('¿Desea eliminar este usuario?')">Eliminar</a>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr><td colspan="8" class="text-center">No hay usuarios registrados.</td></tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Modal Editar -->
        <% if (mostrarModalEditar != null && mostrarModalEditar) {%>
        <div class="modal-simulado" style="display:block;">
            <div class="modal-contenido">
                <h4>Editar Usuario</h4>
                <form action="ServletUsuario" method="post">
                    <input type="hidden" name="accion" value="actualizar">
                    <input type="hidden" name="id" value="<%= uEditar.getIdUsuario()%>">
                    <div class="mb-3"><label class="form-label">Nombre</label>
                        <input type="text" name="nombreUsuario" class="form-control" value="<%= uEditar.getNombreUsuario()%>" required></div>
                    <div class="mb-3"><label class="form-label">Apellido</label>
                        <input type="text" name="apellidoUsuario" class="form-control" value="<%= uEditar.getApellidoUsuario()%>" required></div>
                    <div class="mb-3"><label class="form-label">Teléfono</label>
                        <input type="text" name="telefono" class="form-control" value="<%= uEditar.getTelefono()%>"></div>
                    <div class="mb-3"><label class="form-label">Correo</label>
                        <input type="email" name="correo" class="form-control" value="<%= uEditar.getCorreo()%>" required></div>
                    <div class="mb-3"><label class="form-label">Contraseña</label>
                        <input type="text" name="contrasena" class="form-control" value="<%= uEditar.getContrasena()%>" required></div>
                    <div class="text-end">
                        <a href="ServletUsuario?accion=listar" class="btn btn-secondary">Cancelar</a>
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
                <h4>Agregar Usuario</h4>
                <form action="ServletUsuario" method="post">
                    <input type="hidden" name="accion" value="agregar">
                    <div class="mb-3"><label class="form-label">Nombre</label>
                        <input type="text" name="nombreUsuario" class="form-control" required></div>
                    <div class="mb-3"><label class="form-label">Apellido</label>
                        <input type="text" name="apellidoUsuario" class="form-control" required></div>
                    <div class="mb-3"><label class="form-label">Teléfono</label>
                        <input type="text" name="telefono" class="form-control"></div>
                    <div class="mb-3"><label class="form-label">Correo</label>
                        <input type="email" name="correo" class="form-control" required></div>
                    <div class="mb-3"><label class="form-label">Contraseña</label>
                        <input type="text" name="contrasena" class="form-control" required></div>
                    <div class="text-end">
                        <a href="ServletUsuario?accion=listar" class="btn btn-secondary">Cancelar</a>
                        <button type="submit" class="btn btn-success">Agregar</button>
                    </div>
                </form>
            </div>
        </div>
        <% }%>

    </body>
</html>
