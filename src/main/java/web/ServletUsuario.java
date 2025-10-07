package web;

import dao.UsuarioDao;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.UsuarioPojo;

@WebServlet(name = "ServletUsuario", urlPatterns = {"/ServletUsuario"})
public class ServletUsuario extends HttpServlet {

    private final UsuarioDao dao = new UsuarioDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String accion = req.getParameter("accion");
        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {
            case "listar":
                listarUsuarios(req, resp);
                break;
            case "editar":
                mostrarFormEditar(req, resp);
                break;
            case "eliminar":
                eliminar(req, resp);
                break;
            case "mostrarAgregar":
                req.setAttribute("mostrarModalAgregar", true);
                listarUsuarios(req, resp);
                break;
            default:
                listarUsuarios(req, resp);
                break;
        }
    }

    private void mostrarFormEditar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UsuarioPojo u = dao.buscarPorId(id);
        req.setAttribute("usuarioEditar", u);
        req.setAttribute("mostrarModalEditar", true);
        listarUsuarios(req, resp); // carga tabla y muestra modal
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

    private void listarUsuarios(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<UsuarioPojo> lista = dao.listarUsuarios();
        req.setAttribute("usuarioListar", lista);
        req.getRequestDispatcher("usuarios.jsp").forward(req, resp);
    }

    private void actualizar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        UsuarioPojo u = dao.buscarPorId(id);

        u.setNombreUsuario(req.getParameter("nombreUsuario"));
        u.setApellidoUsuario(req.getParameter("apellidoUsuario"));
        u.setTelefono(req.getParameter("telefono"));
        u.setCorreo(req.getParameter("correo"));
        u.setContrasena(req.getParameter("contrasena"));

        dao.actualizar(u);
        resp.sendRedirect("ServletUsuario?accion=listar");
    }

    private void eliminar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        dao.eliminar(id);
        resp.sendRedirect("ServletUsuario?accion=listar");
    }

    private void agregar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        UsuarioPojo u = new UsuarioPojo();
        u.setNombreUsuario(req.getParameter("nombreUsuario"));
        u.setApellidoUsuario(req.getParameter("apellidoUsuario"));
        u.setTelefono(req.getParameter("telefono"));
        u.setCorreo(req.getParameter("correo"));
        u.setContrasena(req.getParameter("contrasena"));
        u.setFechaRegistro(new java.sql.Date(System.currentTimeMillis()));

        dao.agregar(u);
        resp.sendRedirect("ServletUsuario?accion=listar");
    }
}
