package com.pruebacamposformularios;

import java.io.Serializable;

public class PacienteBean implements Serializable {
    private String nombreMascota;
    private String duenio;
    private String contacto;

    public PacienteBean() {}

    public String getNombreMascota() { return nombreMascota; }
    public void setNombreMascota(String nombreMascota) { this.nombreMascota = nombreMascota; }

    public String getDuenio() { return duenio; }
    public void setDuenio(String duenio) { this.duenio = duenio; }

    public String getContacto() { return contacto; }
    public void setContacto(String contacto) { this.contacto = contacto; }
}