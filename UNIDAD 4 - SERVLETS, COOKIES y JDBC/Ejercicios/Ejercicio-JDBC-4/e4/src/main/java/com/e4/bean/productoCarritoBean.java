package com.e4.bean;

import java.io.Serializable;

public class productoCarritoBean implements Serializable {

    private int nroDetalle;

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getNomProducto() {
        return nomProducto;
    }

    public void setNomProducto(String nomProducto) {
        this.nomProducto = nomProducto;
    }

    public String getCodBarra() {
        return codBarra;
    }

    public void setCodBarra(String codBarra) {
        this.codBarra = codBarra;
    }

    public int getNroDetalle() {
        return nroDetalle;
    }

    public void setNroDetalle(int nroDetalle) {
        this.nroDetalle = nroDetalle;
    }

    private String codBarra;
    private String nomProducto;
    private double precio;


}