package model;

import javax.persistence.*;
import java.sql.Date; // para el campo fechaRegistro

@Entity
@Table(name = "usuarios")
public class UsuarioPojo {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idUsuario")
    private int idUsuario;
    
    @Column(name = "nombreUsuario")
    private String nombreUsuario;
    
    @Column(name = "apellidoUsuario")
    private String apellidoUsuario;
    
    @Column(name = "telefono")
    private String telefono;
    
    @Column(name = "correo")
    private String correo;
    
    @Column(name = "contrasena") // ojo con el caracter especial ñ
    private String contrasena;   // en Java no se usa ñ por convención
    
    @Column(name = "fechaRegistro")
    private Date fechaRegistro;

    // 🔹 Constructor vacío (requerido por JPA)
    public UsuarioPojo() {
    }

    // 🔹 Constructor con parámetros
    public UsuarioPojo(String nombreUsuario, String apellidoUsuario, String telefono, String correo, String contrasena, Date fechaRegistro) {
        this.nombreUsuario = nombreUsuario;
        this.apellidoUsuario = apellidoUsuario;
        this.telefono = telefono;
        this.correo = correo;
        this.contrasena = contrasena;
        this.fechaRegistro = fechaRegistro;
    }

    // 🔹 Getters y Setters
    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getApellidoUsuario() {
        return apellidoUsuario;
    }

    public void setApellidoUsuario(String apellidoUsuario) {
        this.apellidoUsuario = apellidoUsuario;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }
}
