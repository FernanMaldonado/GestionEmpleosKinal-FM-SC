package model;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "SolicitudesUsuario")  // Asegúrate de que el nombre de la tabla sea el correcto
public class SolicitudPojo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idSolicitud") // Ajusta el nombre de la columna según sea necesario
    private int idSolicitud;

    @Column(name = "idUsuario")
    private int idUsuario;

    @Column(name = "idVacante")
    private int idVacante;

    @Column(name = "fechaSolicitud")
    private Date fechaSolicitud;

    @Column(name = "estadoSolicitud")
    private String estadoSolicitud;

    // Getters y setters
    public int getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(int idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdVacante() {
        return idVacante;
    }

    public void setIdVacante(int idVacante) {
        this.idVacante = idVacante;
    }

    public Date getFechaSolicitud() {
        return fechaSolicitud;
    }

    public void setFechaSolicitud(Date fechaSolicitud) {
        this.fechaSolicitud = fechaSolicitud;
    }

    public String getEstadoSolicitud() {
        return estadoSolicitud;
    }

    public void setEstadoSolicitud(String estadoSolicitud) {
        this.estadoSolicitud = estadoSolicitud;
    }
}
