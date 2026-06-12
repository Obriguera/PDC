package com.e3.beans;

public class TicketBean {


    public TicketBean() {
    }

    public String getTicketNro() {
        return ticketNro;
    }

    public void setTicketNro(String ticketNro) {
        this.ticketNro = ticketNro;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getSolicitante() {
        return solicitante;
    }

    public void setSolicitante(String solicitante) {
        this.solicitante = solicitante;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    private String ticketNro;
    private String fecha;
    private String solicitante;
    private String asunto;
    private String texto;
}
