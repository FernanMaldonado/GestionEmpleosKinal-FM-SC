package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import model.VacantesPojo;

/**
 *
 */
public class VacantesDao {

    private final EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("gestionEmpleoKinal");

    // Agregar una nueva vacante
    public void agregar(VacantesPojo vacante) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();

        try {
            transaccion.begin();
            em.persist(vacante);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) {
                transaccion.rollback();
            }
            System.err.println("Error al agregar vacante: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    // Listar todas las vacantes
    public List<VacantesPojo> listarVacantes() {
        EntityManager em = fabrica.createEntityManager();
        try {
            return em.createQuery(
                    "SELECT v FROM VacantesPojo v JOIN FETCH v.empresa", VacantesPojo.class
            ).getResultList();
        } finally {
            em.close();
        }
    }

    // Buscar vacante por ID
    public VacantesPojo buscarPorId(int id) {
        EntityManager em = fabrica.createEntityManager();
        try {
            return em.createQuery(
                    "SELECT v FROM VacantesPojo v JOIN FETCH v.empresa WHERE v.idVacante = :id", VacantesPojo.class)
                    .setParameter("id", id)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        } finally {
            em.close();
        }
    }

    // Actualizar vacante existente
    public void actualizar(VacantesPojo vacante) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();

        try {
            transaccion.begin();
            em.merge(vacante);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) {
                transaccion.rollback();
            }
            System.err.println("Error al actualizar vacante: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    // Eliminar vacante por ID
    public void eliminar(int id) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();

        try {
            transaccion.begin();
            VacantesPojo vacante = em.find(VacantesPojo.class, id);
            if (vacante != null) {
                em.remove(vacante);
            }
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) {
                transaccion.rollback();
            }
            System.err.println("Error al eliminar vacante: " + e.getMessage());
        } finally {
            em.close();
        }
    }
}
