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
public class PersonaModel {

    private String idPersona;
    private String nombre;
    private String correo;
    private String fechaNacimiento;
    private String edad;
    private String genero;
    private String user;
    private String pass;
    private String rol;

    public PersonaModel(String idPersona, String nombre, String correo, String fechaNacimiento, String edad, String genero, String user, String pass, String rol) {
        this.idPersona = idPersona;
        this.nombre = nombre;
        this.correo = correo;
        this.fechaNacimiento = fechaNacimiento;
        this.edad = edad;
        this.genero = genero;
        this.user = user;
        this.pass = pass;
        this.rol = rol;
    }

    public PersonaModel(String nombre, String correo, String fechaNacimiento, String edad, String genero, String user, String pass) {
        this.nombre = nombre;
        this.correo = correo;
        this.fechaNacimiento = fechaNacimiento;
        this.edad = edad;
        this.genero = genero;
        this.user = user;
        this.pass = pass;
    }

    public PersonaModel(String idPersona, String nombre, String correo, String fechaNacimiento, String edad, String genero, String user, String pass) {
        this.idPersona = idPersona;
        this.nombre = nombre;
        this.correo = correo;
        this.fechaNacimiento = fechaNacimiento;
        this.edad = edad;
        this.genero = genero;
        this.user = user;
        this.pass = pass;
    }

    

    public PersonaModel(String user, String pass) {
        this.user = user;
        this.pass = pass;
    }

    public PersonaModel(String idPersona) {
        this.idPersona = idPersona;
    }

    public String getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(String idPersona) {
        this.idPersona = idPersona;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getEdad() {
        return edad;
    }

    public void setEdad(String edad) {
        this.edad = edad;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

}
