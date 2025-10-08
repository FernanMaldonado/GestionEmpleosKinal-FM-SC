package web;

import dao.VacantesDao;
import dao.EmpresasDao;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.EmpresasPojo;
import model.VacantesPojo;

/**
 * 
 */
@WebServlet(name = "ServletVacantes", urlPatterns = {"/ServletVacantes"})
public class ServletVacantes extends HttpServlet {

    private final VacantesDao daoVacantes = new VacantesDao();
    private final EmpresasDao daoEmpresas = new EmpresasDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String accion = req.getParameter("accion");
        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {
            case "listar":
                listarVacantes(req, resp);
                break;
            case "editar":
                mostrarFormEditar(req, resp);
                break;
            case "eliminar":
                eliminar(req, resp);
                break;
            case "mostrarAgregar":
                req.setAttribute("mostrarModalAgregar", true);
                listarVacantes(req, resp);
                break;
            default:
                listarVacantes(req, resp);
                break;
        }
    }

    private void mostrarFormEditar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        VacantesPojo vacante = daoVacantes.buscarPorId(id);

        req.setAttribute("vacanteEditar", vacante);
        req.setAttribute("mostrarModalEditar", true);

        listarVacantes(req, resp); // recarga lista y abre modal editar
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

    private void listarVacantes(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<VacantesPojo> lista = daoVacantes.listarVacantes();
        List<EmpresasPojo> empresas = daoEmpresas.listarEmpresas(); // para combo en formulario

        req.setAttribute("vacantesListar", lista);
        req.setAttribute("empresasListar", empresas);
        req.getRequestDispatcher("vacantes.jsp").forward(req, resp);
    }

    private void agregar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            VacantesPojo v = new VacantesPojo();

            int idEmpresa = Integer.parseInt(req.getParameter("idEmpresa"));
            EmpresasPojo empresa = daoEmpresas.buscarPorId(idEmpresa);

            v.setEmpresa(empresa);
            v.setSueldo(new BigDecimal(req.getParameter("sueldo")));
            v.setEstudiosRequeridos(req.getParameter("estudiosRequeridos"));
            v.setAñosExperienciaRequeridos(req.getParameter("añosExperienciaRequeridos"));
            v.setTrabajoVacante(req.getParameter("trabajoVacante"));
            v.setHabilidadesRequeridas(req.getParameter("habilidadesRequeridas"));
            v.setDireccionEntrevista(req.getParameter("direccionEntrevista"));

            daoVacantes.agregar(v);
            resp.sendRedirect("ServletVacantes?accion=listar");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Error al agregar la vacante: " + e.getMessage());
            listarVacantes(req, resp);
        }
    }

    private void actualizar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            VacantesPojo v = daoVacantes.buscarPorId(id);

            if (v == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Vacante no encontrada");
                return;
            }

            int idEmpresa = Integer.parseInt(req.getParameter("idEmpresa"));
            EmpresasPojo empresa = daoEmpresas.buscarPorId(idEmpresa);

            v.setEmpresa(empresa);
            v.setSueldo(new BigDecimal(req.getParameter("sueldo")));
            v.setEstudiosRequeridos(req.getParameter("estudiosRequeridos"));
            v.setAñosExperienciaRequeridos(req.getParameter("añosExperienciaRequeridos"));
            v.setTrabajoVacante(req.getParameter("trabajoVacante"));
            v.setHabilidadesRequeridas(req.getParameter("habilidadesRequeridas"));
            v.setDireccionEntrevista(req.getParameter("direccionEntrevista"));

            daoVacantes.actualizar(v);
            resp.sendRedirect("ServletVacantes?accion=listar");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Error al actualizar la vacante: " + e.getMessage());
            listarVacantes(req, resp);
        }
    }

    private void eliminar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            daoVacantes.eliminar(id);
            resp.sendRedirect("ServletVacantes?accion=listar");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Error al eliminar la vacante: " + e.getMessage());
            listarVacantes(req, resp);
        }
    }
}
