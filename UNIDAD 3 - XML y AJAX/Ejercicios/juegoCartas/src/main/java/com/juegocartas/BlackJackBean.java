package com.juegocartas;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class BlackJackBean implements Serializable {

    private List<Integer> cartasJugador;
    private List<Integer> cartasHouse;
    private String estado;
    private Random random;

    public BlackJackBean() {
        this.random = new Random();
        reiniciar();
    }

    // ── Getters ──────────────────────────────────────────────────────────────

    public List<Integer> getCartasJugador() {
        return cartasJugador;
    }

    public int getPuntosJugador() {
        return sumarCartas(cartasJugador);
    }

    public String getEstado() {
        return estado;
    }

    // ── Lógica principal ─────────────────────────────────────────────────────

    public void pedirCarta() {
        if (!"JUGANDO".equals(estado)) return;

        cartasJugador.add(cartaAleatoria());

        if (getPuntosJugador() > 21) {
            estado = "PERDISTE";
        }
    }

    public void plantarse() {
        if (!"JUGANDO".equals(estado)) return;

        // La casa saca cartas hasta llegar a 17 o más
        while (sumarCartas(cartasHouse) < 17) {
            cartasHouse.add(cartaAleatoria());
        }

        int puntosJugador = getPuntosJugador();
        int puntosCasa    = sumarCartas(cartasHouse);

        if (puntosCasa > 21 || puntosJugador > puntosCasa) {
            estado = "GANASTE";
        } else if (puntosJugador < puntosCasa) {
            estado = "PERDISTE";
        } else {
            estado = "EMPATE";
        }
    }

    public void reiniciar() {
        cartasJugador = new ArrayList<>();
        cartasHouse   = new ArrayList<>();
        estado        = "JUGANDO";

        // Reparto inicial: 2 cartas para cada uno
        cartasJugador.add(cartaAleatoria());
        cartasJugador.add(cartaAleatoria());
        cartasHouse.add(cartaAleatoria());
        cartasHouse.add(cartaAleatoria());
    }

    // ── Helpers privados ─────────────────────────────────────────────────────

    private int cartaAleatoria() {
        return random.nextInt(11) + 1; // entre 1 y 11
    }

    private int sumarCartas(List<Integer> cartas) {
        int total = 0;
        for (int carta : cartas) {
            total += carta;
        }
        return total;
    }
}