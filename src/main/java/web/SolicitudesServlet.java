package web;

import dao.SolicitudDao;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.SolicitudPojo;
import model.UsuarioPojo;

@WebServlet("/PaginaSolicitudes")
public class SolicitudesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);  // Verifica si la sesión está activa
        if (session == null) {
            response.sendRedirect("login.jsp"); // Redirige a login si no hay sesión
            return;
        }

        UsuarioPojo usuario = (UsuarioPojo) session.getAttribute("usuario");  // Obtiene el usuario de la sesión
        if (usuario == null) {
            response.sendRedirect("login.jsp");  // Redirige a login si no hay usuario en la sesión
            return;
        }

        // Obtén las solicitudes del usuario desde la base de datos
        SolicitudDao solicitudDao = new SolicitudDao();
        List<SolicitudPojo> solicitudesList = solicitudDao.obtenerSolicitudesPorUsuario(usuario.getIdUsuario());

        // Pasa la lista de solicitudes al JSP
        request.setAttribute("solicitudesList", solicitudesList);

        // Redirige al JSP donde mostrarás las solicitudes
        request.getRequestDispatcher("PaginaMenuUsuarios.jsp").forward(request, response);
    }
}
