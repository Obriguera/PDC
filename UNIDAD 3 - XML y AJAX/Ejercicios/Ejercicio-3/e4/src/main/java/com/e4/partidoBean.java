package com.e4;

public class partidoBean {
    public partidoBean() {
    }

    public String getEquipoA() {
        return equipoA;
    }

    public void setEquipoA(String equipoA) {
        this.equipoA = equipoA;
    }

    public String getEquipoB() {
        return equipoB;
    }

    public void setEquipoB(String equipoB) {
        this.equipoB = equipoB;
    }

    public String getGolesV() {
        return golesV;
    }

    public void setGolesV(String golesV) {
        this.golesV = golesV;
    }

    public String getEsAcierto() {
        return esAcierto;
    }

    public void setEsAcierto(String esAcierto) {
        this.esAcierto = esAcierto;
    }

    public String getResultadoReal() {
        return resultadoReal;
    }

    public void setResultadoReal(String resultadoReal) {
        this.resultadoReal = resultadoReal;
    }

    public String getPrediccion() {
        return prediccion;
    }

    public void setPrediccion(String prediccion) {
        this.prediccion = prediccion;
    }

    public String getGolesL() {
        return golesL;
    }

    public void setGolesL(String golesL) {
        this.golesL = golesL;
    }

    private String equipoA;
    private String equipoB;
    private String golesL;
    private String golesV;
    private String prediccion;
    private String resultadoReal;
    private String esAcierto;
}
