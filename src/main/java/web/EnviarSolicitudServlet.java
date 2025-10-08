package web;

import dao.SolicitudDao;
import model.SolicitudPojo;
import model.UsuarioPojo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet("/EnviarSolicitudServlet")
public class EnviarSolicitudServlet extends HttpServlet {

    private final SolicitudDao solicitudesUsuarioDao = new SolicitudDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        UsuarioPojo usuario = (UsuarioPojo) session.getAttribute("usuario");

        // Verificar que el usuario esté logueado
        if (usuario == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        try {
            // Obtener el ID de la vacante desde el formulario
            int idVacante = Integer.parseInt(req.getParameter("idVacante"));

            // Crear un objeto de solicitud
            SolicitudPojo solicitud = new SolicitudPojo();
            solicitud.setIdUsuario(usuario.getIdUsuario());   // El ID del usuario logueado
            solicitud.setIdVacante(idVacante);                 // El ID de la vacante
            solicitud.setFechaSolicitud(Date.valueOf(LocalDate.now())); // Fecha actual
            solicitud.setEstadoSolicitud("pendiente");        // Estado inicial "pendiente"

            // Agregar la solicitud a la base de datos
            solicitudesUsuarioDao.agregar(solicitud);

            // Responder con un mensaje de éxito en formato JSON
            resp.setContentType("application/json");
            PrintWriter out = resp.getWriter();
            out.write("{\"success\": true}");
            out.flush();
        } catch (Exception e) {
            // En caso de error, responder con un mensaje de error en formato JSON
            resp.setContentType("application/json");
            PrintWriter out = resp.getWriter();
            out.write("{\"success\": false}");
            out.flush();
            e.printStackTrace();
        }
    }
}
