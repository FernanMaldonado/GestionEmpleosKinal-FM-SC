package model;

import javax.persistence.*;
import java.sql.Date; // para el campo fechaRegistro

@Entity
@Table(name = "curriculum")
public class CurriculumPojo {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idCurriculum")
    private int idCurriculum;
    
    @Column(name = "idUsuario")
    private int idUsuario;
    
    @Column(name = "añosExperiencia")
    private String añosExperiencia;
    
    @Column(name = "estudiosObtenidos")
    private String estudiosObtenidos;
    
    @Column(name = "lugarEstudios")
    private String lugarEstudios;
    
    @Column(name = "numeroReferencia1")
    private String numeroReferencia1;
    
    @Column(name = "numeroReferencia2")
    private String numeroReferencia2;
    
    @Column(name = "tipoTrabajoBusca")
    private String tipoTrabajoBusca;
    
    @Column(name = "habilidades")
    private String habilidades; 

    public CurriculumPojo() {
    }

    public CurriculumPojo(int idCurriculum, int idUsuario, String añosExperiencia, String estudiosObtenidos, String lugarEstudios, String numeroReferencia1, String numeroReferencia2, String tipoTrabajoBusca, String habilidades) {
        this.idCurriculum = idCurriculum;
        this.idUsuario = idUsuario;
        this.añosExperiencia = añosExperiencia;
        this.estudiosObtenidos = estudiosObtenidos;
        this.lugarEstudios = lugarEstudios;
        this.numeroReferencia1 = numeroReferencia1;
        this.numeroReferencia2 = numeroReferencia2;
        this.tipoTrabajoBusca = tipoTrabajoBusca;
        this.habilidades = habilidades;
    }

    public int getIdCurriculum() {
        return idCurriculum;
    }

    public void setIdCurriculum(int idCurriculum) {
        this.idCurriculum = idCurriculum;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getAñosExperiencia() {
        return añosExperiencia;
    }

    public void setAñosExperiencia(String añosExperiencia) {
        this.añosExperiencia = añosExperiencia;
    }

    public String getEstudiosObtenidos() {
        return estudiosObtenidos;
    }

    public void setEstudiosObtenidos(String estudiosObtenidos) {
        this.estudiosObtenidos = estudiosObtenidos;
    }

    public String getLugarEstudios() {
        return lugarEstudios;
    }

    public void setLugarEstudios(String lugarEstudios) {
        this.lugarEstudios = lugarEstudios;
    }

    public String getNumeroReferencia1() {
        return numeroReferencia1;
    }

    public void setNumeroReferencia1(String numeroReferencia1) {
        this.numeroReferencia1 = numeroReferencia1;
    }

    public String getNumeroReferencia2() {
        return numeroReferencia2;
    }

    public void setNumeroReferencia2(String numeroReferencia2) {
        this.numeroReferencia2 = numeroReferencia2;
    }

    public String getTipoTrabajoBusca() {
        return tipoTrabajoBusca;
    }

    public void setTipoTrabajoBusca(String tipoTrabajoBusca) {
        this.tipoTrabajoBusca = tipoTrabajoBusca;
    }

    public String getHabilidades() {
        return habilidades;
    }

    public void setHabilidades(String habilidades) {
        this.habilidades = habilidades;
    }
    
    
    
}
