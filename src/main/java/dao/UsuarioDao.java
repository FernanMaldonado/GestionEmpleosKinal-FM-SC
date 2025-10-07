package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import model.UsuarioPojo;

/**
 * DAO para la entidad Usuario
 * Realiza operaciones CRUD usando JPA
 * Autor: Fernando Maldonado
 */
public class UsuarioDao {

    private final EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("gestionEmpleoKinal");

    public void agregar(UsuarioPojo usuario) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();

        try {
            // Asignar fecha de registro si es null
            if (usuario.getFechaRegistro() == null) {
                usuario.setFechaRegistro(new java.sql.Date(System.currentTimeMillis()));
            }

            transaccion.begin();
            em.persist(usuario);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
            System.err.println("Error al agregar usuario: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    public List<UsuarioPojo> listarUsuarios() {
        String jpql = "SELECT u FROM UsuarioPojo u";
        EntityManager em = fabrica.createEntityManager();

        try {
            return em.createQuery(jpql, UsuarioPojo.class).getResultList();
        } finally {
            em.close();
        }
    }

    public UsuarioPojo buscarPorId(int id) {
        EntityManager em = fabrica.createEntityManager();
        try {
            return em.find(UsuarioPojo.class, id);
        } finally {
            em.close();
        }
    }

    public void actualizar(UsuarioPojo usuario) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();

        try {
            transaccion.begin();
            em.merge(usuario);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
            System.err.println("Error al actualizar usuario: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    public void eliminar(int id) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();

        try {
            transaccion.begin();
            UsuarioPojo usuario = em.find(UsuarioPojo.class, id);
            if (usuario != null) {
                em.remove(usuario);
            }
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
            System.err.println("Error al eliminar usuario: " + e.getMessage());
        } finally {
            em.close();
        }
    }
}
