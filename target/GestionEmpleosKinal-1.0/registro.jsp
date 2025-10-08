<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String tipo = request.getParameter("tipo");
    if(tipo == null) tipo = "empresa"; // por defecto mostrar empresa
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Registro Usuario/Empresa | JobLink</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body, html {
    margin:0; padding:0; width:100%; height:100%;
    font-family: Arial, sans-serif;
    background:#f4f4f4;
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

/* ----- Container de registro ----- */
.container-login {
    width: 850px;
    max-width: 95%;
    height: 600px;
    display:flex;
    position:relative;
    overflow:hidden;
    border-radius:12px;
    box-shadow:0 0 20px rgba(0,0,0,0.2);
    margin: 30px auto;
}

/* Panels */
.panel {
    flex:1;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    color:#fff;
    padding:40px;
    text-align:center;
}
.panel-left { background:#007bff; }
.panel-right { background:#28a745; }

/* Botón encima de todo */
#toggleBtn {
    padding: 12px 25px;
    border:none;
    border-radius:50px;
    cursor:pointer;
    font-weight:bold;
    background:#333;
    color:#fff;
    position:absolute;
    bottom:20px;
    z-index:1000;
    transition: all 0.5s ease;
}
<%= "empresa".equals(tipo) ? "#toggleBtn { right:5%; }" : "#toggleBtn { left:5%; }" %>

/* Formulario */
.formulario-container {
    position:absolute;
    top:50%;
    width:40%;
    height:70%;
    transform: translateY(-50%);
    background:#e9f2ff;
    padding:20px 30px;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    border-radius:20px;
    box-shadow:0 0 20px rgba(0,0,0,0.2);
    transition: all 0.5s ease;
}
<%= "empresa".equals(tipo) ? ".formulario-container { left:5%; }" : ".formulario-container { right:5%; }" %>

.formulario-container form { width:100%; }
.formulario-container input { margin-bottom:10px; padding:6px 10px; border-radius:10px; border:1px solid #ccc; width:100%; }
.formulario-container button { width:100%; padding:10px; border-radius:50px; margin-bottom:10px; }
#loginLink { margin-top:10px; display:block; text-decoration:none; font-weight:bold; color:#0a66c2; text-align:center;}

/* Responsive */
@media(max-width:768px){
    .container-login { flex-direction:column; height:auto; }
    .formulario-container { width:90%; height:auto; position:relative; transform:none; margin:20px auto; left:auto; right:auto; }
    #toggleBtn { position:relative; left:auto; transform:none; margin:10px 0; }
}
</style>
</head>
<body>

<!-- Barra superior -->
<nav class="navbar">
    <a href="principal.jsp" class="logo">JobLink</a>
    <div class="nav-links">
        <a href="principal.jsp">Inicio</a>
        <a href="registro.jsp">Registrar Empresa</a>
        <a href="login.jsp">Login</a>
    </div>
</nav>

<!-- Contenedor de registro -->
<div class="container-login">

    <!-- Panel izquierdo -->
    <div class="panel panel-left">
        <h2><%= "empresa".equals(tipo) ? "Registrar Empresa" : "Registrar Usuario" %></h2>
        <p><%= "empresa".equals(tipo) ? "Complete los datos para registrar su empresa" : "Complete los datos para registrar su usuario" %></p>
    </div>

    <!-- Panel derecho -->
    <div class="panel panel-right">
        <h2>Formulario <%= "empresa".equals(tipo) ? "Empresa" : "Usuario" %></h2>
        <p>Rellene todos los campos requeridos</p>
    </div>

    <!-- Botón cambio formulario -->
    <form method="get" action="registro.jsp">
        <input type="hidden" name="tipo" value="<%= "empresa".equals(tipo) ? "usuario" : "empresa" %>">
        <button type="submit" id="toggleBtn">Deseo registrar <%= "empresa".equals(tipo) ? "un usuario" : "una empresa" %></button>
    </form>

    <!-- Formulario -->
    <div class="formulario-container">
        <form action="ServletRegistro" method="post">
            <input type="hidden" name="tipo" value="<%= tipo %>">
            <h3>Registrar <%= "empresa".equals(tipo) ? "Empresa" : "Usuario" %></h3>
            <% if("empresa".equals(tipo)) { %>
                <input type="text" name="nombreEmpresa" placeholder="Nombre de la Empresa" required>
                <input type="email" name="correoEmpresa" placeholder="Correo Empresa" required>
                <input type="text" name="telefonoEmpresa" placeholder="Teléfono Empresa" required>
                <input type="text" name="direccion" placeholder="Dirección" required>
                <input type="password" name="contrasena" placeholder="Contraseña" required>
            <% } else { %>
                <input type="text" name="nombreUsuario" placeholder="Nombre" required>
                <input type="text" name="apellidoUsuario" placeholder="Apellido" required>
                <input type="text" name="telefono" placeholder="Teléfono" required>
                <input type="email" name="correo" placeholder="Correo Electrónico" required>
                <input type="password" name="contrasena" placeholder="Contraseña" required>
            <% } %>
            <button type="submit">Registrar <%= "empresa".equals(tipo) ? "Empresa" : "Usuario" %></button>
            <a href="login.jsp" id="loginLink">¿Ya tengo cuenta? Login</a>
        </form>
    </div>

</div>

</body>
</html>
