/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author Manuel
 */
public class JuegoModel {
    
    private String idJuego;
    private String nombreUsuario;
    private String minutos;
    private String segundos;
    private String puntuación;
    private String nivel;

    public JuegoModel(String idJuego, String nombreUsuario, String minutos, String segundos, String puntuación, String nivel) {
        this.idJuego = idJuego;
        this.nombreUsuario = nombreUsuario;
        this.minutos = minutos;
        this.segundos = segundos;
        this.puntuación = puntuación;
        this.nivel = nivel;
    }

    public JuegoModel(String nombreUsuario, String minutos, String segundos, String puntuación, String nivel) {
        this.nombreUsuario = nombreUsuario;
        this.minutos = minutos;
        this.segundos = segundos;
        this.puntuación = puntuación;
        this.nivel = nivel;
    }

    public String getIdJuego() {
        return idJuego;
    }

    public void setIdJuego(String idJuego) {
        this.idJuego = idJuego;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getMinutos() {
        return minutos;
    }

    public void setMinutos(String minutos) {
        this.minutos = minutos;
    }

    public String getSegundos() {
        return segundos;
    }

    public void setSegundos(String segundos) {
        this.segundos = segundos;
    }

    public String getPuntuación() {
        return puntuación;
    }

    public void setPuntuación(String puntuación) {
        this.puntuación = puntuación;
    }

    public String getNivel() {
        return nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }
    
    
}
