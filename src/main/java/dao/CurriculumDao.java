package dao;

import model.CurriculumPojo;

import javax.persistence.*;
import java.util.List;

public class CurriculumDao {

    private final EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("gestionEmpleoKinal");

    // 🔹 Agregar Curriculum
    public void agregar(CurriculumPojo curriculum) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(curriculum);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            System.err.println("Error al agregar curriculum: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    // 🔹 Listar todos los curriculums
    public List<CurriculumPojo> listarCurriculums() {
        EntityManager em = fabrica.createEntityManager();
        try {
            return em.createQuery("SELECT c FROM CurriculumPojo c", CurriculumPojo.class).getResultList();
        } finally {
            em.close();
        }
    }

    // 🔹 Listar curriculums por usuario
    public List<CurriculumPojo> listarPorUsuario(int idUsuario) {
        EntityManager em = fabrica.createEntityManager();
        try {
            return em.createQuery("SELECT c FROM CurriculumPojo c WHERE c.idUsuario = :idUsuario", CurriculumPojo.class)
                    .setParameter("idUsuario", idUsuario)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    // 🔹 Buscar por ID
    public CurriculumPojo buscarPorId(int id) {
        EntityManager em = fabrica.createEntityManager();
        try {
            return em.find(CurriculumPojo.class, id);
        } finally {
            em.close();
        }
    }

    // 🔹 Actualizar curriculum
    public void actualizar(CurriculumPojo curriculum) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(curriculum);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            System.err.println("Error al actualizar curriculum: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    // 🔹 Eliminar curriculum
    public void eliminar(int id) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            CurriculumPojo c = em.find(CurriculumPojo.class, id);
            if (c != null) em.remove(c);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            System.err.println("Error al eliminar curriculum: " + e.getMessage());
        } finally {
            em.close();
        }
    }
}
