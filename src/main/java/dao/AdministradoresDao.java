package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import model.AdministradoresPojo;

/**
 * DAO para la entidad Adminstradores
 * Realiza operaciones CRUD usando JPA
 * Autor: Fernando Maldonado
 */
public class AdministradoresDao {

    private final EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("gestionEmpleoKinal");

    public void agregar(AdministradoresPojo administrador) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();

        try {
            // Asignar fecha de registro si es null
            if (administrador.getFechaRegistro() == null) {
                administrador.setFechaRegistro(new java.sql.Date(System.currentTimeMillis()));
            }

            transaccion.begin();
            em.persist(administrador);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
            System.err.println("Error al agregar administrador: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    public List<AdministradoresPojo> listarAdministradores() {
        String jpql = "SELECT u FROM AdministradoresPojo u";
        EntityManager em = fabrica.createEntityManager();

        try {
            return em.createQuery(jpql, AdministradoresPojo.class).getResultList();
        } finally {
            em.close();
        }
    }

    public AdministradoresPojo buscarPorId(int id) {
        EntityManager em = fabrica.createEntityManager();
        try {
            return em.find(AdministradoresPojo.class, id);
        } finally {
            em.close();
        }
    }

    public void actualizar(AdministradoresPojo administrador) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();

        try {
            transaccion.begin();
            em.merge(administrador);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
            System.err.println("Error al actualizar administrador: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    public void eliminar(int id) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();

        try {
            transaccion.begin();
            AdministradoresPojo administrador = em.find(AdministradoresPojo.class, id);
            if (administrador != null) {
                em.remove(administrador);
            }
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
            System.err.println("Error al eliminar Administrador: " + e.getMessage());
        } finally {
            em.close();
        }
    }
}
