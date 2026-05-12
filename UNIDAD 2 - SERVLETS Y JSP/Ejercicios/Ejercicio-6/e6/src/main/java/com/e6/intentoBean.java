package com.e6;

public class intentoBean {
    public intentoBean() {
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public boolean isEsAcierto() {
        return esAcierto;
    }

    public void setEsAcierto(boolean esAcierto) {
        this.esAcierto = esAcierto;
    }

    private String numero;
    private String descripcion;
    private boolean esAcierto;
}
