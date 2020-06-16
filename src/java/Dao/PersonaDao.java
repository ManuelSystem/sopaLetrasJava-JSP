/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Models.PersonaModel;
import java.util.ArrayList;
import util.Database;

/**
 *
 * @author Manuel
 */
public class PersonaDao {

    public static ArrayList<String> iniciarSesion(PersonaModel persona) {
        ArrayList<String> dato = new ArrayList<>();
        String sql = "";
        try {
            sql = "SELECT * FROM persona, rol WHERE persona.idRol=rol.idRol AND persona.user='" + persona.getUser() + "'"
                    + " AND persona.password='" + persona.getPass() + "'";
            dato = Database.getSQL(sql);
        } catch (Exception e) {
            System.out.println("Falló consulta de usuario, iniciar sesión" + e);
        }
        return dato;
    }

    public static ArrayList<String> retornarSiExisteUsuario(PersonaModel p) {
        String sql = "";
        ArrayList<String> dato = new ArrayList<>();
        try {
            sql = "SELECT idPersona FROM persona WHERE user='" + p.getUser() + "'";
            dato = Database.getSQL(sql);
        } catch (Exception e) {
            System.err.println(e);
        }
        return dato;
    }

    public static boolean agregarJugador(PersonaModel per) {
        String sql = "";
        try {
            sql = "INSERT INTO persona (nombre,correo,fechaNacimiento,edad,genero,user,"
                    + "	password,idRol) "
                    + "VALUES('" + per.getNombre() + "', '" + per.getCorreo() + "', '" + per.getFechaNacimiento() + "', "
                    + "'" + per.getEdad() + "', '" + per.getGenero() + "', '" + per.getUser() + "', "
                    + "'" + per.getPass() + "', 2)";
        } catch (Exception e) {
            System.err.println("Falló el agregar usuario" + e);
        }
        return Database.ejecutarActualizacionSQL(sql);
    }

    public static PersonaModel obtenerDatosPersona(PersonaModel persona) {
        ArrayList<String> dato;
        try {

            String sql = "SELECT * FROM persona WHERE user='" + persona.getIdPersona() + "'";
            dato = Database.getSQL(sql);

            String separado = dato.toString();

            String[] pars = separado.split("/");

            persona.setIdPersona(pars[0].replace("[", ""));
            persona.setNombre(pars[1]);
            persona.setCorreo(pars[2]);
            persona.setFechaNacimiento(pars[3]);
            persona.setEdad(pars[4]);
            persona.setGenero(pars[5]);
            persona.setUser(pars[6]);
            persona.setPass(pars[7]);
            persona.setRol(pars[8]);

        } catch (Exception e) {
            System.err.println("SQL Error: " + e.getMessage());
        }

        return persona;
    }

    public static ArrayList<String> obtenerDatosJugadores() {
        ArrayList<String> dato = new ArrayList<>();
        try {
            String sql = "SELECT * FROM persona WHERE idRol=2";
            dato = Database.getSQL(sql);
        } catch (Exception e) {
            System.err.println("SQL Error: " + e.getMessage());
        }
        return dato;
    }

    public static ArrayList<String> obtenerDatosJugador(String idPersona) {
         ArrayList<String> dato = new ArrayList<>();
     String sql="";
        try {
              sql="SELECT * FROM persona WHERE idPersona="+idPersona+"";
             dato=Database.getSQL(sql);
        } catch (Exception e) {
            System.out.println("Falló consulta de usuario, iniciar sesión"+e);
        }
        return dato;
    }

    public static boolean actualizarJugador(PersonaModel per) {
    String sql= ""    ;
        try {
            sql="UPDATE persona SET nombre='"+per.getNombre()+"', correo='"+per.getCorreo()+"', fechaNacimiento='"+per.getFechaNacimiento()+"',"
                    + "edad='"+per.getEdad()+"', genero='"+per.getGenero()+"', user='"+per.getUser()+"',"
                    + "password='"+per.getPass()+"', idRol=2 WHERE idPersona="+per.getIdPersona()+"";
        } catch (Exception e) {
            System.err.println("Error al actualizar" +e);
        }
        return Database.ejecutarActualizacionSQL(sql);
    }

    public static boolean eliminarPersona(PersonaModel elPer) {
    String sql="";
        try {
            sql="DELETE FROM persona WHERE idPersona="+elPer.getIdPersona()+"";
        } catch (Exception e) {
           System.err.println("Error al Eliminar jugador" +e);
        }
        return Database.ejecutarActualizacionSQL(sql);    
    }


}