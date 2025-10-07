<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Agregar Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/usuarios.css">
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h2 class="mb-4">Agregar Nuevo Usuario</h2>
            <form action="ServletUsuario" method="post">
                <input type="hidden" name="accion" value="agregar">

                <div class="mb-3">
                    <label for="nombreUsuario" class="form-label">Nombre:</label>
                    <input type="text" id="nombreUsuario" name="nombreUsuario" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="apellidoUsuario" class="form-label">Apellido:</label>
                    <input type="text" id="apellidoUsuario" name="apellidoUsuario" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="telefono" class="form-label">Teléfono:</label>
                    <input type="text" id="telefono" name="telefono" class="form-control">
                </div>

                <div class="mb-3">
                    <label for="correo" class="form-label">Correo:</label>
                    <input type="email" id="correo" name="correo" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="contrasena" class="form-label">Contraseña:</label>
                    <input type="password" id="contrasena" name="contrasena" class="form-control" required>
                </div>

                <button type="submit" class="btn btn-success">Guardar Usuario</button>
                <a href="ServletUsuario?accion=listar" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
