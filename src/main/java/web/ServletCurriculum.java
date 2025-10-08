package web;

import dao.CurriculumDao;
import model.CurriculumPojo;
import model.UsuarioPojo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletCurriculum", urlPatterns = {"/ServletCurriculum"})
public class ServletCurriculum extends HttpServlet {

    private final CurriculumDao daoCurriculum = new CurriculumDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession sesion = req.getSession(false);
        UsuarioPojo usuario = (UsuarioPojo) sesion.getAttribute("usuario");

        if (usuario == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String accion = req.getParameter("accion");
        if (accion == null) accion = "listar";

        switch (accion) {
            case "listar":
                listarCurriculumsPorUsuario(req, resp, usuario.getIdUsuario());
                break;
            case "editar":
                mostrarFormEditar(req, resp, usuario.getIdUsuario());
                break;
            case "eliminar":
                eliminar(req, resp, usuario.getIdUsuario());
                break;
            case "mostrarAgregar":
                req.setAttribute("mostrarModalAgregar", true);
                listarCurriculumsPorUsuario(req, resp, usuario.getIdUsuario());
                break;
            default:
                listarCurriculumsPorUsuario(req, resp, usuario.getIdUsuario());
                break;
        }
    }

    private void listarCurriculumsPorUsuario(HttpServletRequest req, HttpServletResponse resp, int idUsuario)
            throws ServletException, IOException {
        List<CurriculumPojo> lista = daoCurriculum.listarPorUsuario(idUsuario);
        req.setAttribute("curriculumsListar", lista);
        req.getRequestDispatcher("curriculum.jsp").forward(req, resp);
    }

    private void mostrarFormEditar(HttpServletRequest req, HttpServletResponse resp, int idUsuario)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        CurriculumPojo curriculum = daoCurriculum.buscarPorId(id);

        if (curriculum == null || curriculum.getIdUsuario() != idUsuario) {
            resp.sendRedirect("PaginaMenuUsuarios.jsp");
            return;
        }

        req.setAttribute("curriculumEditar", curriculum);
        req.setAttribute("mostrarModalEditar", true);
        listarCurriculumsPorUsuario(req, resp, idUsuario);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession sesion = req.getSession(false);
        UsuarioPojo usuario = (UsuarioPojo) sesion.getAttribute("usuario");
        if (usuario == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String accion = req.getParameter("accion");
        switch (accion) {
            case "agregar":
                agregar(req, resp, usuario);
                break;
            case "actualizar":
                actualizar(req, resp, usuario);
                break;
        }
    }

    private void agregar(HttpServletRequest req, HttpServletResponse resp, UsuarioPojo usuario)
            throws IOException {
        try {
            CurriculumPojo c = new CurriculumPojo();
            c.setIdUsuario(usuario.getIdUsuario());
            c.setAñosExperiencia(req.getParameter("añosExperiencia"));
            c.setEstudiosObtenidos(req.getParameter("estudiosObtenidos"));
            c.setLugarEstudios(req.getParameter("lugarEstudios"));
            c.setNumeroReferencia1(req.getParameter("numeroReferencia1"));
            c.setNumeroReferencia2(req.getParameter("numeroReferencia2"));
            c.setTipoTrabajoBusca(req.getParameter("tipoTrabajoBusca"));
            c.setHabilidades(req.getParameter("habilidades"));

            daoCurriculum.agregar(c);
            resp.sendRedirect("PaginaMenuUsuarios.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("PaginaMenuUsuarios.jsp");
        }
    }

    private void actualizar(HttpServletRequest req, HttpServletResponse resp, UsuarioPojo usuario)
            throws IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            CurriculumPojo c = daoCurriculum.buscarPorId(id);
            if (c == null || c.getIdUsuario() != usuario.getIdUsuario()) {
                resp.sendRedirect("principalUsuario.jsp");
                return;
            }

            c.setAñosExperiencia(req.getParameter("añosExperiencia"));
            c.setEstudiosObtenidos(req.getParameter("estudiosObtenidos"));
            c.setLugarEstudios(req.getParameter("lugarEstudios"));
            c.setNumeroReferencia1(req.getParameter("numeroReferencia1"));
            c.setNumeroReferencia2(req.getParameter("numeroReferencia2"));
            c.setTipoTrabajoBusca(req.getParameter("tipoTrabajoBusca"));
            c.setHabilidades(req.getParameter("habilidades"));

            daoCurriculum.actualizar(c);
            resp.sendRedirect("PaginaMenuUsuarios.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("PaginaMenuUsuarios.jsp");
        }
    }

    private void eliminar(HttpServletRequest req, HttpServletResponse resp, int idUsuario)
            throws IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            CurriculumPojo c = daoCurriculum.buscarPorId(id);
            if (c != null && c.getIdUsuario() == idUsuario) {
                daoCurriculum.eliminar(id);
            }
            resp.sendRedirect("PaginaMenuUsuarios.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("PaginaMenuUsuarios.jsp");
        }
    }
}
