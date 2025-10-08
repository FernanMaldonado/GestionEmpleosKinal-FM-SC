package dao;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import model.SolicitudPojo;

public class SolicitudDao {

    private static final String PERSISTENCE_UNIT_NAME = "gestionEmpleoKinal";
    private static EntityManager em;

    // Método para agregar una solicitud
    public void agregar(SolicitudPojo solicitud) {
        em = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME).createEntityManager();
        EntityTransaction transaction = em.getTransaction();

        try {
            transaction.begin();
            em.persist(solicitud);  // Inserta la solicitud en la base de datos
            transaction.commit();  // Confirma la transacción
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();  // Reversa la transacción en caso de error
            }
            e.printStackTrace();
        } finally {
            if (em != null) {
                em.close();  // Cierra el EntityManager
            }
        }
    }

    // Obtener solicitudes del usuario
    public List<SolicitudPojo> obtenerSolicitudesPorUsuario(int idUsuario) {
        List<SolicitudPojo> solicitudes = new ArrayList<>();
        em = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME).createEntityManager();

        try {
            String query = "SELECT s FROM SolicitudPojo s WHERE s.idUsuario = :idUsuario";
            solicitudes = em.createQuery(query, SolicitudPojo.class)
                    .setParameter("idUsuario", idUsuario)
                    .getResultList();

            System.out.println("Solicitudes obtenidas: " + solicitudes.size());  // Log para verificar las solicitudes
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (em != null) {
                em.close();  // Cierra el EntityManager
            }
        }
        return solicitudes;
    }
}
