package web;

import dao.CurriculumDao;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.CurriculumPojo;

/**
 * 
 */
@WebServlet(name = "ServletCurriculum", urlPatterns = {"/ServletCurriculum"})
public class ServletCurriculum extends HttpServlet {

    private final CurriculumDao daoCurriculum = new CurriculumDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String accion = req.getParameter("accion");
        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {
            case "listar":
                listarCurriculums(req, resp);
                break;
            case "editar":
                mostrarFormEditar(req, resp);
                break;
            case "eliminar":
                eliminar(req, resp);
                break;
            case "mostrarAgregar":
                req.setAttribute("mostrarModalAgregar", true);
                listarCurriculums(req, resp);
                break;
            default:
                listarCurriculums(req, resp);
                break;
        }
    }

    private void mostrarFormEditar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        CurriculumPojo curriculum = daoCurriculum.buscarPorId(id);

        req.setAttribute("curriculumEditar", curriculum);
        req.setAttribute("mostrarModalEditar", true);

        listarCurriculums(req, resp); // recarga lista y abre modal editar
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String accion = req.getParameter("accion");

        if ("agregar".equals(accion)) {
            agregar(req, resp);
        } else if ("actualizar".equals(accion)) {
            actualizar(req, resp);
        }
    }

    private void listarCurriculums(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<CurriculumPojo> lista = daoCurriculum.listarCurriculums();
        req.setAttribute("curriculumsListar", lista);
        req.getRequestDispatcher("curriculums.jsp").forward(req, resp);
    }

    private void agregar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            CurriculumPojo c = new CurriculumPojo();

            c.setIdUsuario(Integer.parseInt(req.getParameter("idUsuario")));
            c.setAñosExperiencia(req.getParameter("añosExperiencia"));
            c.setEstudiosObtenidos(req.getParameter("estudiosObtenidos"));
            c.setLugarEstudios(req.getParameter("lugarEstudios"));
            c.setNumeroReferencia1(req.getParameter("numeroReferencia1"));
            c.setNumeroReferencia2(req.getParameter("numeroReferencia2"));
            c.setTipoTrabajoBusca(req.getParameter("tipoTrabajoBusca"));
            c.setHabilidades(req.getParameter("habilidades"));

            daoCurriculum.agregar(c);
            resp.sendRedirect("ServletCurriculum?accion=listar");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Error al agregar curriculum: " + e.getMessage());
            listarCurriculums(req, resp);
        }
    }

    private void actualizar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            CurriculumPojo c = daoCurriculum.buscarPorId(id);

            if (c == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Curriculum no encontrado");
                return;
            }

            c.setIdUsuario(Integer.parseInt(req.getParameter("idUsuario")));
            c.setAñosExperiencia(req.getParameter("añosExperiencia"));
            c.setEstudiosObtenidos(req.getParameter("estudiosObtenidos"));
            c.setLugarEstudios(req.getParameter("lugarEstudios"));
            c.setNumeroReferencia1(req.getParameter("numeroReferencia1"));
            c.setNumeroReferencia2(req.getParameter("numeroReferencia2"));
            c.setTipoTrabajoBusca(req.getParameter("tipoTrabajoBusca"));
            c.setHabilidades(req.getParameter("habilidades"));

            daoCurriculum.actualizar(c);
            resp.sendRedirect("ServletCurriculum?accion=listar");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Error al actualizar curriculum: " + e.getMessage());
            listarCurriculums(req, resp);
        }
    }

    private void eliminar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            daoCurriculum.eliminar(id);
            resp.sendRedirect("ServletCurriculum?accion=listar");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Error al eliminar curriculum: " + e.getMessage());
            listarCurriculums(req, resp);
        }
    }
}
