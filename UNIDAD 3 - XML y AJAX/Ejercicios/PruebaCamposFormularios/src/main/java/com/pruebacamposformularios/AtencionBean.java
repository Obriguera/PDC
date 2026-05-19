package com.pruebacamposformularios;

import java.io.Serializable;

public class AtencionBean implements Serializable {
    private int id;
    private String hora;
    private PacienteBean paciente;

    public AtencionBean() {}

    public AtencionBean(int id, String hora) {
        this.id = id;
        this.hora = hora;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getHora() { return hora; }
    public void setHora(String hora) { this.hora = hora; }

    public boolean isLibre() { return paciente == null; }

    public PacienteBean getPaciente() { return paciente; }
    public void setPaciente(PacienteBean paciente) { this.paciente = paciente; }
}