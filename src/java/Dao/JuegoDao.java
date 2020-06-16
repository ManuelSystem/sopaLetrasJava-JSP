/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Models.JuegoModel;
import java.util.ArrayList;
import util.Database;

/**
 *
 * @author Manuel
 */
public class JuegoDao {

    public static ArrayList<String> validarJuegoUsuario(String nombre) {
        String sql = "";
        ArrayList<String> dato = new ArrayList<>();
        try {
            sql = "SELECT idJuego FROM juego WHERE nombreUsuario='" + nombre + "'";
            dato = Database.getSQL(sql);
        } catch (Exception e) {
            System.err.println(e);
        }
        return dato;
    }

    public static boolean registrarJuego(JuegoModel ju) {
        String sql = "";
        try {
            sql = "INSERT INTO juego (nombreUsuario, minutos, segundos, puntuacion, nivel) VALUES('" + ju.getNombreUsuario() + "',"
                    + "'" + ju.getMinutos() + "', '" + ju.getSegundos() + "', '" + ju.getPuntuación() + "', '" + ju.getNivel() + "')";
        } catch (Exception e) {
            System.err.println("Falló el agregar Partida" + e);
        }
        return Database.ejecutarActualizacionSQL(sql);
    }

    public static ArrayList<String> obtenerDatosJuego() {
        String sql = "";
        ArrayList<String> dato = new ArrayList<>();
        try {
            sql = "SELECT * FROM juego ORDER BY puntuacion ASC";
            dato = Database.getSQL(sql);
        } catch (Exception e) {
            System.err.println(e);
        }
        return dato;
    }

    public static ArrayList<String> obtenerDatosJuego(String jugador) {
         String sql = "";
        ArrayList<String> dato = new ArrayList<>();
        try {
            sql = "SELECT * FROM juego WHERE nombreUsuario='"+jugador+"'";
            dato = Database.getSQL(sql);
        } catch (Exception e) {
            
            System.err.println(e);
        }
        return dato;
    }

    public static boolean ActualizarNivelJuego(JuegoModel jue) {
    String sql = "";
        try {
            sql = "UPDATE juego SET nombreUsuario='"+jue.getNombreUsuario()+"', minutos='"+jue.getMinutos()+"',"
                    + "segundos='"+jue.getSegundos()+"', puntuacion='"+jue.getPuntuación()+"', nivel='"+jue.getNivel()+"' WHERE idJuego="+jue.getIdJuego()+"";
        } catch (Exception e) {
            System.err.println("error al actualizar nivel "+e);
        }
        return Database.ejecutarActualizacionSQL(sql);
    }

}
