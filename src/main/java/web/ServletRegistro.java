package web;

import dao.UsuarioDao;
import dao.EmpresasDao;
import model.UsuarioPojo;
import model.EmpresasPojo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "ServletRegistro", urlPatterns = {"/ServletRegistro"})
public class ServletRegistro extends HttpServlet {

    private final UsuarioDao usuarioDao = new UsuarioDao();
    private final EmpresasDao empresaDao = new EmpresasDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tipo = request.getParameter("tipo");

        try {
            if ("usuario".equalsIgnoreCase(tipo)) {
                UsuarioPojo usuario = new UsuarioPojo();
                usuario.setNombreUsuario(request.getParameter("nombreUsuario"));
                usuario.setApellidoUsuario(request.getParameter("apellidoUsuario"));
                usuario.setTelefono(request.getParameter("telefono"));
                usuario.setCorreo(request.getParameter("correo"));
                usuario.setContrasena(request.getParameter("contrasena"));
                usuarioDao.agregar(usuario);
            } else if ("empresa".equalsIgnoreCase(tipo)) {
                EmpresasPojo empresa = new EmpresasPojo();
                empresa.setNombreEmpresa(request.getParameter("nombreEmpresa"));
                empresa.setCorreoEmpresa(request.getParameter("correoEmpresa"));
                empresa.setTelefonoEmpresa(request.getParameter("telefonoEmpresa"));
                empresa.setDireccion(request.getParameter("direccion"));
                empresa.setContrasena(request.getParameter("contrasena"));
                empresaDao.agregar(empresa);
            }
            // Registro exitoso → redirigir a login
            response.sendRedirect("login.jsp");
        } catch (Exception e) {
            request.setAttribute("error", "❌ Error al registrar: " + e.getMessage());
            request.getRequestDispatcher("registro.jsp").forward(request, response);
        }
    }
}
