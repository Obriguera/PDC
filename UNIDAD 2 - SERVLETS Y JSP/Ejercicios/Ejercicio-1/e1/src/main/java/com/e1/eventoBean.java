package com.e1;

import java.util.Date;

public class eventoBean {

    public eventoBean() {
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

    public String getNotificar() {
        return notificar;
    }

    public void setNotificar(String notificar) {
        this.notificar = notificar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    private String prioridad;
    private String descripcion;
    private String notificar;
    private String email;
    private String fecha;

    public boolean isDescartado() {
        return descartado;
    }

    public void setDescartado(boolean descartado) {
        this.descartado = descartado;
    }

    private boolean descartado;

}
