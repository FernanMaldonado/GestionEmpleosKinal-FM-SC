package web;

import dao.EmpresasDao;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.EmpresasPojo;

@WebServlet(name = "ServletEmpresa", urlPatterns = {"/ServletEmpresa"})
public class ServletEmpresa extends HttpServlet {

    private final EmpresasDao dao = new EmpresasDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String accion = req.getParameter("accion");
        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {
            case "listar":
                listarEmpresas(req, resp);
                break;
            case "editar":
                mostrarFormEditar(req, resp);
                break;
            case "eliminar":
                eliminar(req, resp);
                break;
            case "mostrarAgregar":
                req.setAttribute("mostrarModalAgregar", true);
                listarEmpresas(req, resp); // carga tabla y muestra modal
                break;
            default:
                listarEmpresas(req, resp);
                break;
        }
    }

    private void mostrarFormEditar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        EmpresasPojo u = dao.buscarPorId(id);
        req.setAttribute("empresaEditar", u);
        req.setAttribute("mostrarModalEditar", true);
        listarEmpresas(req, resp); // carga tabla y muestra modal
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String accion = req.getParameter("accion");
        if ("actualizar".equals(accion)) {
            actualizar(req, resp);
        } else if ("agregar".equals(accion)) {
            agregar(req, resp);
        } else if ("agregarEmpresa".equals(accion)) {
            agregarEmpresa(req, resp);
        }
    }

    private void listarEmpresas(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<EmpresasPojo> lista = dao.listarEmpresas();
        req.setAttribute("empresaListar", lista);
        req.getRequestDispatcher("empresas.jsp").forward(req, resp);
    }

    private void actualizar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        EmpresasPojo u = dao.buscarPorId(id);

        u.setNombreEmpresa(req.getParameter("nombreEmpresa"));
        u.setCorreoEmpresa(req.getParameter("correoEmpresa"));
        u.setTelefonoEmpresa(req.getParameter("telefonoEmpresa"));
        u.setContrasena(req.getParameter("contrasena"));
        u.setDireccion(req.getParameter("direccion"));

        dao.actualizar(u);
        resp.sendRedirect("ServletEmpresa?accion=listar");
    }

    private void eliminar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        dao.eliminar(id);
        resp.sendRedirect("ServletEmpresa?accion=listar");
    }

    private void agregar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        EmpresasPojo u = new EmpresasPojo();
        u.setNombreEmpresa(req.getParameter("nombreEmpresa"));
        u.setCorreoEmpresa(req.getParameter("correoEmpresa"));
        u.setTelefonoEmpresa(req.getParameter("telefonoEmpresa"));
        u.setContrasena(req.getParameter("contrasena"));
        u.setDireccion(req.getParameter("direccion"));
        u.setFechaRegistro(new java.sql.Date(System.currentTimeMillis()));

        dao.agregar(u);
        resp.sendRedirect("ServletEmpresa?accion=listar");
    }
    
    private void agregarEmpresa(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        EmpresasPojo u = new EmpresasPojo();
        u.setNombreEmpresa(req.getParameter("nombreEmpresa"));
        u.setCorreoEmpresa(req.getParameter("correoEmpresa"));
        u.setTelefonoEmpresa(req.getParameter("telefonoEmpresa"));
        u.setContrasena(req.getParameter("contrasena"));
        u.setDireccion(req.getParameter("direccion"));
        u.setFechaRegistro(new java.sql.Date(System.currentTimeMillis()));

        dao.agregar(u);
        resp.sendRedirect("PaginaMenuEmpresas.jsp");
    }
    
    
}
