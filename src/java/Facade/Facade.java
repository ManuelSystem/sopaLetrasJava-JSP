/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Facade;

import Dao.JuegoDao;
import Dao.PersonaDao;
import Models.JuegoModel;
import Models.PersonaModel;
import java.util.ArrayList;

/**
 *
 * @author Manuel
 */
public class Facade {

    public ArrayList<String> iniciarSesion(String usuario, String clave) {
        ArrayList<String> datos = new ArrayList<>();
        try {
            PersonaModel persona = new PersonaModel(usuario, clave);
            datos = PersonaDao.iniciarSesion(persona);
        } catch (Exception e) {
        }
        return datos;
    }

    public ArrayList<String> retornarSiExisteUsuario(String usuario) {
        ArrayList<String> dato;
        PersonaModel p = new PersonaModel(usuario);
        dato = PersonaDao.retornarSiExisteUsuario(p);
        return dato;
    }

    public boolean agregarJugador(String nombres, String email, String fechaNacimiento, String edad, String genero, String usuario, String pasword) {
        PersonaModel per = new PersonaModel(nombres, email, fechaNacimiento, edad, genero, usuario, pasword);
        return PersonaDao.agregarJugador(per);
    }

    public ArrayList<String> obtenerDatosPersona(String usuario) {
        ArrayList<String> dato = new ArrayList<>();
        PersonaModel persona = new PersonaModel(usuario);
        persona = PersonaDao.obtenerDatosPersona(persona);

        dato.add(persona.getIdPersona() + "/" + persona.getNombre() + "/" + persona.getCorreo() + "/"
                + persona.getFechaNacimiento() + "/" + persona.getEdad() + "/" + persona.getGenero() + "/"
                + persona.getUser() + "/" + persona.getPass() + "/" + persona.getRol());

        return dato;
    }

    public ArrayList<String> obtenerDatosJugadores() {
        ArrayList<String> dato;
        dato = PersonaDao.obtenerDatosJugadores();
        return dato;
    }

    public ArrayList<String> obtenerDatosJugador(String idPersona) {
        ArrayList<String> datos;
        datos = PersonaDao.obtenerDatosJugador(idPersona);
        return datos;
    }

    public boolean actualizarJugador(String idPersona, String nombres, String email, String fechaNacimiento, String edad, String genero, String usuario, String pasword) {
        PersonaModel per = new PersonaModel(idPersona, nombres, email, fechaNacimiento, edad, genero, usuario, pasword);
        return PersonaDao.actualizarJugador(per);
    }

    public boolean eliminarPersona(String idPersona) {
        PersonaModel elPer = new PersonaModel(idPersona);
        return PersonaDao.eliminarPersona(elPer);
    }

    public ArrayList<String> validarJuegoUsuario(String nombre) {
        ArrayList<String> dato;
        dato = JuegoDao.validarJuegoUsuario(nombre);
        return dato;
    }

    public boolean registrarJuego(String nombre, String minuto, String segundo, String puntuacion, String nivel) {
        JuegoModel ju = new JuegoModel(nombre, minuto, segundo, puntuacion, nivel);
        return JuegoDao.registrarJuego(ju);
    }

    public ArrayList<String> obtenerDatosJuego() {
        ArrayList<String> dato;
        dato = JuegoDao.obtenerDatosJuego();
        return dato;
    }

    public ArrayList<String> obtenerDatosJuego(String jugador) {
        ArrayList<String> dato;
        dato = JuegoDao.obtenerDatosJuego(jugador);
        return dato;
    }

    public boolean ActualizarNivelJuego(String idJuego, String nombre, String minuto, String segundo, String puntuacion, String nivel) {
        JuegoModel jue = new JuegoModel(idJuego, nombre, minuto, segundo, puntuacion, nivel);
        return JuegoDao.ActualizarNivelJuego(jue);
    }
}
