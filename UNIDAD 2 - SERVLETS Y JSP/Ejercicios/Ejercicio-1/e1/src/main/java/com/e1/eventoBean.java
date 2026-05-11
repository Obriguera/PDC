package com.e1;

import java.util.Date;

public class evento {


    public evento() {
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public boolean isNotificar() {
        return notificar;
    }

    public void setNotificar(boolean notificar) {
        this.notificar = notificar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    private String prioridad;
    private String descripcion;
    private boolean notificar;
    private String email;
    private Date fecha;

}
