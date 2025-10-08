package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import model.CurriculumPojo;

/**
 * DAO para la entidad Curriculum
 * Realiza operaciones CRUD usando JPA
 * Autor: [Tu nombre]
 */
public class CurriculumDao {

    private final EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("gestionEmpleoKinal");

    // Agregar un nuevo curriculum
    public void agregar(CurriculumPojo curriculum) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();

        try {
            transaccion.begin();
            em.persist(curriculum);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
            System.err.println("Error al agregar curriculum: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    // Listar todos los curriculums
    public List<CurriculumPojo> listarCurriculums() {
        EntityManager em = fabrica.createEntityManager();
        try {
            return em.createQuery("SELECT c FROM CurriculumPojo c", CurriculumPojo.class)
                     .getResultList();
        } finally {
            em.close();
        }
    }

    // Buscar curriculum por ID
    public CurriculumPojo buscarPorId(int id) {
        EntityManager em = fabrica.createEntityManager();
        try {
            return em.find(CurriculumPojo.class, id);
        } finally {
            em.close();
        }
    }

    // Actualizar curriculum existente
    public void actualizar(CurriculumPojo curriculum) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();

        try {
            transaccion.begin();
            em.merge(curriculum);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
            System.err.println("Error al actualizar curriculum: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    // Eliminar curriculum por ID
    public void eliminar(int id) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();

        try {
            transaccion.begin();
            CurriculumPojo curriculum = em.find(CurriculumPojo.class, id);
            if (curriculum != null) {
                em.remove(curriculum);
            }
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
            System.err.println("Error al eliminar curriculum: " + e.getMessage());
        } finally {
            em.close();
        }
    }
}
