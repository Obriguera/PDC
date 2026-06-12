package com.e2.beans;

public class SubtipoClienteBean {


    public String getNom_tipo_cliente() {
        return nom_tipo_cliente;
    }

    public void setNom_tipo_cliente(String nom_tipo_cliente) {
        this.nom_tipo_cliente = nom_tipo_cliente;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }

    public String getCod_tipo_cliente() {
        return cod_tipo_cliente;
    }

    public void setCod_tipo_cliente(String cod_tipo_cliente) {
        this.cod_tipo_cliente = cod_tipo_cliente;
    }

    public String getNro_subtipo() {
        return nro_subtipo;
    }

    public void setNro_subtipo(String nro_subtipo) {
        this.nro_subtipo = nro_subtipo;
    }

    private String nom_tipo_cliente;
    private String habilitado;
    private String cod_tipo_cliente;
    private String nro_subtipo;
}
