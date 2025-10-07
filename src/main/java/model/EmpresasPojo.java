package model;

import javax.persistence.*;
import java.sql.Date; // para el campo fechaRegistro

@Entity
@Table(name = "empresas")
public class EmpresasPojo {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idEmpresa")
    private int idEmpresa;
    
    @Column(name = "nombreEmpresa")
    private String nombreEmpresa;
    
    @Column(name = "correoEmpresa")
    private String correoEmpresa;
    
    @Column(name = "telefonoEmpresa")
    private String telefonoEmpresa;
    
    @Column(name = "contrasena")
    private String contrasena; 
    
    @Column(name = "direccion")
    private String direccion;
    
    @Column(name = "fechaRegistro")
    private Date fechaRegistro;

    public EmpresasPojo() {
    }

    public EmpresasPojo(int idEmpresa, String nombreEmpresa, String correoEmpresa, String telefonoEmpresa, String contrasena, String direccion, Date fechaRegistro) {
        this.idEmpresa = idEmpresa;
        this.nombreEmpresa = nombreEmpresa;
        this.correoEmpresa = correoEmpresa;
        this.telefonoEmpresa = telefonoEmpresa;
        this.contrasena = contrasena;
        this.direccion = direccion;
        this.fechaRegistro = fechaRegistro;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public String getCorreoEmpresa() {
        return correoEmpresa;
    }

    public void setCorreoEmpresa(String correoEmpresa) {
        this.correoEmpresa = correoEmpresa;
    }

    public String getTelefonoEmpresa() {
        return telefonoEmpresa;
    }

    public void setTelefonoEmpresa(String telefonoEmpresa) {
        this.telefonoEmpresa = telefonoEmpresa;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }
    
    
    
}