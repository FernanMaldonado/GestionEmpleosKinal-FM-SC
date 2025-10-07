package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import model.EmpresasPojo;

/**
 * DAO para la entidad Empresas
 * Realiza operaciones CRUD usando JPA
 * Autor: Fernando Maldonado
 */
public class EmpresasDao {

    private final EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("gestionEmpleoKinal");

    public void agregar(EmpresasPojo empresa) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();

        try {
            // Asignar fecha de registro si es null
            if (empresa.getFechaRegistro() == null) {
                empresa.setFechaRegistro(new java.sql.Date(System.currentTimeMillis()));
            }

            transaccion.begin();
            em.persist(empresa);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
            System.err.println("Error al agregar empresa: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    public List<EmpresasPojo> listarEmpresas() {
        String jpql = "SELECT u FROM EmpresasPojo u";
        EntityManager em = fabrica.createEntityManager();

        try {
            return em.createQuery(jpql, EmpresasPojo.class).getResultList();
        } finally {
            em.close();
        }
    }

    public EmpresasPojo buscarPorId(int id) {
        EntityManager em = fabrica.createEntityManager();
        try {
            return em.find(EmpresasPojo.class, id);
        } finally {
            em.close();
        }
    }

    public void actualizar(EmpresasPojo empresa) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();

        try {
            transaccion.begin();
            em.merge(empresa);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
            System.err.println("Error al actualizar empresa: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    public void eliminar(int id) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();

        try {
            transaccion.begin();
            EmpresasPojo empresa = em.find(EmpresasPojo.class, id);
            if (empresa != null) {
                em.remove(empresa);
            }
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
            System.err.println("Error al eliminar empresa: " + e.getMessage());
        } finally {
            em.close();
        }
    }
}
