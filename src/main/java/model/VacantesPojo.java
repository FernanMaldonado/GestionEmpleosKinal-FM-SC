/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.*;
import model.EmpresasPojo;


/**
 *
 * @author danil
 */
@Entity
@Table(name = "vacantes")
public class VacantesPojo implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idVacante")
    private int idVacante;

    @ManyToOne
    @JoinColumn(name = "idEmpresa", referencedColumnName = "idEmpresa")
    private EmpresasPojo empresa;

    @Column(name = "sueldo", precision = 10, scale = 2)
    private BigDecimal sueldo;

    @Column(name = "estudiosRequeridos", length = 64)
    private String estudiosRequeridos;

    @Column(name = "añosExperienciaRequeridos", length = 64)
    private String añosExperienciaRequeridos;

    @Column(name = "trabajoVacante", length = 64)
    private String trabajoVacante;

    @Column(name = "habilidadesRequeridas", length = 64)
    private String habilidadesRequeridas;

    @Column(name = "direccionEntrevista", length = 64)
    private String direccionEntrevista;

    public VacantesPojo() {
    }

    public VacantesPojo(int idVacante, EmpresasPojo empresa, BigDecimal sueldo, String estudiosRequeridos, String añosExperienciaRequeridos, String trabajoVacante, String habilidadesRequeridas, String direccionEntrevista) {
        this.idVacante = idVacante;
        this.empresa = empresa;
        this.sueldo = sueldo;
        this.estudiosRequeridos = estudiosRequeridos;
        this.añosExperienciaRequeridos = añosExperienciaRequeridos;
        this.trabajoVacante = trabajoVacante;
        this.habilidadesRequeridas = habilidadesRequeridas;
        this.direccionEntrevista = direccionEntrevista;
    }

    public int getIdVacante() {
        return idVacante;
    }

    public void setIdVacante(int idVacante) {
        this.idVacante = idVacante;
    }

    public EmpresasPojo getEmpresa() {
        return empresa;
    }

    public void setEmpresa(EmpresasPojo empresa) {
        this.empresa = empresa;
    }

    public BigDecimal getSueldo() {
        return sueldo;
    }

    public void setSueldo(BigDecimal sueldo) {
        this.sueldo = sueldo;
    }

    public String getEstudiosRequeridos() {
        return estudiosRequeridos;
    }

    public void setEstudiosRequeridos(String estudiosRequeridos) {
        this.estudiosRequeridos = estudiosRequeridos;
    }

    public String getAñosExperienciaRequeridos() {
        return añosExperienciaRequeridos;
    }

    public void setAñosExperienciaRequeridos(String añosExperienciaRequeridos) {
        this.añosExperienciaRequeridos = añosExperienciaRequeridos;
    }

    public String getTrabajoVacante() {
        return trabajoVacante;
    }

    public void setTrabajoVacante(String trabajoVacante) {
        this.trabajoVacante = trabajoVacante;
    }

    public String getHabilidadesRequeridas() {
        return habilidadesRequeridas;
    }

    public void setHabilidadesRequeridas(String habilidadesRequeridas) {
        this.habilidadesRequeridas = habilidadesRequeridas;
    }

    public String getDireccionEntrevista() {
        return direccionEntrevista;
    }

    public void setDireccionEntrevista(String direccionEntrevista) {
        this.direccionEntrevista = direccionEntrevista;
    }
    
}
