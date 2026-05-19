package com.pruebacamposformularios;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class TurnosBean implements Serializable {
    private static final String[] HORARIOS = {"16:00", "16:30", "17:00"};

    private List<AtencionBean> turnos;

    public TurnosBean() {
        turnos = new ArrayList<>();
        for (int i = 0; i < HORARIOS.length; i++) {
            turnos.add(new AtencionBean(i, HORARIOS[i]));
        }
    }

    public List<AtencionBean> getTurnos() {
        return turnos;
    }

    public void registrarPaciente(int idTurno, PacienteBean paciente) {
        if (idTurno < 0 || idTurno >= turnos.size()) {
            throw new IllegalArgumentException("ID de turno inválido: " + idTurno);
        }

        AtencionBean turno = turnos.get(idTurno);

        if (!turno.isLibre()) {
            throw new IllegalStateException("El turno " + turno.getHora() + " ya está ocupado");
        }

        turno.setPaciente(paciente);
    }
}