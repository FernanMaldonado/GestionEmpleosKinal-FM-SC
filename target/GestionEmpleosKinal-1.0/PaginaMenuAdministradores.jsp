<%-- 
    Document   : index
    Created on : 21 jul 2025, 19:37:53
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" href="https://www.funko.com/on/demandware.static/Sites-FunkoUS-Site/-/default/dwdf4d4162/images/favicons/funko-favicon-96x96.png" />
        <link rel="stylesheet" href="style/inicio.css?<%= System.currentTimeMillis()%>">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">


        <title>Gestion Empleos</title>
    </head>

    <body>
        <div class="buttone-container">
            <a href="ServletUsuario?accion=listar"><button class="buttone">Usuarios</button></a>
            <a href="ServletAdministrador?accion=listar"><button class="buttone">Administradores</button></a>
            <a href="ServletEmpresa?accion=listar"><button class="buttone">Empresas</button></a>
            <a href="ServletRecibos?accion=listar"><button class="buttone">Curriculum</button></a>
            <a href="ServletCompras?accion=listar"><button class="buttone">Vacantes</button></a>
        </div>

        <div id="contenedorModalCompras"></div>

   
        <!-- Pie de página / Información general -->
        <footer class="footer2">
            <div class="footer-contenido2">
                <p>&copy; 2025 Fundacion Kinal. Todos los derechos reservados.</p>
                <p>Contacto: +502 0000-0000 | Tel: +502 1234-5678</p>
                <p>Dirección: Ciudad de Guatemala, Guatemala</p>
            </div>
        </footer>

    </body>
</html>