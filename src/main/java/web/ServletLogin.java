package web;

import model.UsuarioPojo;
import model.EmpresasPojo;
import model.AdministradoresPojo;
import java.io.IOException;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {

    @PersistenceUnit(unitName = "gestionEmpleoKinal") // ⚠️ Cambia por el nombre de tu persistence-unit
    private EntityManagerFactory emf;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("usuario");
        String contrasena = request.getParameter("password");

        EntityManager em = emf.createEntityManager();

        try {
            // 1️⃣ Buscar en usuarios
            TypedQuery<UsuarioPojo> qUsuario = em.createQuery(
                "SELECT u FROM UsuarioPojo u WHERE u.correo = :correo", UsuarioPojo.class);
            qUsuario.setParameter("correo", correo);

            UsuarioPojo usuario = qUsuario.getResultStream().findFirst().orElse(null);
            if (usuario != null && usuario.getContrasena().equals(contrasena)) {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("usuario", usuario);
                response.sendRedirect("PaginaMenuUsuarios.jsp");
                return;
            }

            // 2️⃣ Buscar en empresas
            TypedQuery<EmpresasPojo> qEmpresa = em.createQuery(
                "SELECT e FROM EmpresasPojo e WHERE e.correoEmpresa = :correo", EmpresasPojo.class);
            qEmpresa.setParameter("correo", correo);

            EmpresasPojo empresa = qEmpresa.getResultStream().findFirst().orElse(null);
            if (empresa != null && empresa.getContrasena().equals(contrasena)) {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("empresa", empresa);
                response.sendRedirect("PaginaMenuEmpresas.jsp");
                return;
            }

            // 3️⃣ Buscar en administradores
            TypedQuery<AdministradoresPojo> qAdmin = em.createQuery(
                "SELECT a FROM AdministradoresPojo a WHERE a.correo = :correo", AdministradoresPojo.class);
            qAdmin.setParameter("correo", correo);

            AdministradoresPojo admin = qAdmin.getResultStream().findFirst().orElse(null);
            if (admin != null && admin.getContrasena().equals(contrasena)) {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("admin", admin);
                response.sendRedirect("PaginaMenuAdministradores.jsp");
                return;
            }

            // ❌ Si no coincide nada
            response.sendRedirect("login.jsp?error=true");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=true");
        } finally {
            em.close();
        }
    }
}
