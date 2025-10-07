package web;

import dao.AdministradoresDao;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.AdministradoresPojo;

@WebServlet(name = "ServletAdministrador", urlPatterns = {"/ServletAdministrador"})
public class ServletAdministrador extends HttpServlet {

    private final AdministradoresDao dao = new AdministradoresDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String accion = req.getParameter("accion");
        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {
            case "listar":
                listarAdministradores(req, resp);
                break;
            case "editar":
                mostrarFormEditar(req, resp);
                break;
            case "eliminar":
                eliminar(req, resp);
                break;
            case "mostrarAgregar":
                req.setAttribute("mostrarModalAgregar", true);
                listarAdministradores(req, resp); // carga tabla y muestra modal
                break;
            default:
                listarAdministradores(req, resp);
                break;
        }
    }

    private void mostrarFormEditar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        AdministradoresPojo u = dao.buscarPorId(id);
        req.setAttribute("administradorEditar", u);
        req.setAttribute("mostrarModalEditar", true);
        listarAdministradores(req, resp); 
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String accion = req.getParameter("accion");
        if ("actualizar".equals(accion)) {
            actualizar(req, resp);
        } else if ("agregar".equals(accion)) {
            agregar(req, resp);
        }
    }

    private void listarAdministradores(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<AdministradoresPojo> lista = dao.listarAdministradores();
        req.setAttribute("administradorListar", lista);
        req.getRequestDispatcher("administradores.jsp").forward(req, resp);
    }

    private void actualizar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        AdministradoresPojo u = dao.buscarPorId(id);

        u.setNombreAdministrador(req.getParameter("nombreAdministrador"));
        u.setTelefono(req.getParameter("telefonoEmpresa"));
        u.setCorreo(req.getParameter("correoEmpresa"));
        u.setContrasena(req.getParameter("contrasena"));

        dao.actualizar(u);
        resp.sendRedirect("ServletAdministrador?accion=listar");
    }

    private void eliminar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        dao.eliminar(id);
        resp.sendRedirect("ServletAdministrador?accion=listar");
    }

    private void agregar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        AdministradoresPojo u = new AdministradoresPojo();
        u.setNombreAdministrador(req.getParameter("nombreAdministrador"));
        u.setTelefono(req.getParameter("telefonoEmpresa"));
        u.setCorreo(req.getParameter("correoEmpresa"));
        u.setContrasena(req.getParameter("contrasena"));
        u.setFechaRegistro(new java.sql.Date(System.currentTimeMillis()));

        dao.agregar(u);
        resp.sendRedirect("ServletAdministrador?accion=listar");
    }
}
