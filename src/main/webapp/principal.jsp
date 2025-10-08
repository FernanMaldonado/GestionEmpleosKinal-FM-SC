<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Portal de Empleos</title>
    <style>
        /* ----- Estilos generales ----- */
        body {
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background-color: #f3f2ef;
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

        /* Logo tipo “isla” */
        .logo {
            font-size: 1.5em;
            font-weight: bold;
            color: #0a66c2;
            text-decoration: none;
        }

        /* Menú de opciones */
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

        /* ----- Contenido principal ----- */
        .main-content {
            text-align: center;
            margin-top: 100px;
        }

        .main-content h1 {
            color: #0a66c2;
            font-size: 2.5em;
        }

        .main-content p {
            color: #555;
            font-size: 1.2em;
            margin-top: 10px;
        }

        /* ----- Botón principal ----- */
        .btn {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 25px;
            background-color: #0a66c2;
            color: white;
            font-weight: 600;
            border-radius: 6px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #004182;
        }
    </style>
</head>
<body>

    <!-- Barra superior -->
    <nav class="navbar">
        <a href="#" class="logo">JobLink</a>
        <div class="nav-links">
            <a href="buscarEmpleo.jsp">Buscar Empleo</a>
            <a href="registro.jsp">Registrarce</a>
            <a href="login.jsp">Login</a>
        </div>
    </nav>

    <!-- Contenido principal -->
    <div class="main-content">
        <h1>Conecta con tu próximo empleo</h1>
        <p>Encuentra oportunidades laborales y crea conexiones profesionales.</p>
        <a href="buscarEmpleo.jsp" class="btn">Comenzar</a>
    </div>

</body>
</html>
