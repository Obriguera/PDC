package com.e4.bean;

import org.eclipse.tags.shaded.org.apache.xpath.objects.XString;

public class productoBean {


    private int nroDetalle;
    private String nomProducto;
    private String codBarra;
    private String precio;

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

    public String getNomProducto() {
        return nomProducto;
    }

    public void setNomProducto(String nomProducto) {
        this.nomProducto = nomProducto;
    }


    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }
}
