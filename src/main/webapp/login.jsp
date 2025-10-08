<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Login | JobLink</title>
        <style>
            body {
                margin: 0;
                font-family: "Segoe UI", Arial, sans-serif;
                background-color: #f3f2ef;
            }

            /* ----- Barra superior (igual que principal.jsp) ----- */
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

            /* ----- Contenedor del formulario ----- */
            .login-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 80vh;
            }

            .login-box {
                background-color: #fff;
                padding: 40px 50px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
                width: 350px;
                text-align: center;
            }

            .login-box h2 {
                margin-bottom: 25px;
                color: #0a66c2;
            }

            /* Campos */
            .form-group {
                text-align: left;
                margin-bottom: 20px;
            }

            label {
                display: block;
                font-weight: 600;
                color: #333;
                margin-bottom: 5px;
            }

            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 10px;
                border-radius: 6px;
                border: 1px solid #ccc;
                font-size: 14px;
                box-sizing: border-box;
            }

            /* Botón */
            .btn {
                width: 100%;
                background-color: #0a66c2;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 6px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .btn:hover {
                background-color: #004182;
            }

            /* Enlace extra */
            .register-link {
                margin-top: 15px;
                font-size: 14px;
            }

            .register-link a {
                color: #0a66c2;
                text-decoration: none;
            }

            .register-link a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>

        <% if (request.getParameter("error") != null) { %>
        <p style="color:red;">Usuario o contraseña incorrectos</p>
        <% }%>


        <!-- Barra superior -->
        <nav class="navbar">
            <a href="principal.jsp" class="logo">JobLink</a>
            <div class="nav-links">
                <a href="principal.jsp">Inicio</a>
                <a href="registro.jsp">Registrar Empresa</a>
                <a href="login.jsp">Login</a>
            </div>
        </nav>

        <!-- Formulario de login -->
        <div class="login-container">
            <div class="login-box">
                <h2>Iniciar Sesión</h2>
                <form action="ServletLogin" method="post">
                    <div class="form-group">
                        <label for="usuario">Usuario</label>
                        <input type="text" id="usuario" name="usuario" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Contraseña</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <button type="submit" class="btn">Entrar</button>
                </form>
                <div class="register-link">
                    ¿No tienes cuenta? <a href="registro.jsp">Regístrate aquí</a>
                </div>
            </div>
        </div>

    </body>
</html>
