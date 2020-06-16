/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controls;

import Facade.Facade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Manuel
 */
@WebServlet(name = "ControladorJugador", urlPatterns = {"/ControladorJugador"})
public class ControladorJugador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Facade faca = new Facade();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String accion = request.getParameter("accion");
            if (accion.equals("agregarUsu")) {
                RegistrarJuga(request, response);
            }
            if (accion.equals("actualizarJugador")) {
                ActualizarJuga(request, response);
            }
            if (accion.equals("eliminar")) {
                EliminarJuga(request, response);
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void RegistrarJuga(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        String nombres = request.getParameter("nombres");
        String genero = request.getParameter("genero");
        String email = request.getParameter("email");
        String fechaNacimiento = request.getParameter("fechaNacimi");
        String edad = request.getParameter("edad");
        String usuario = request.getParameter("usuario");
        String pasword = request.getParameter("passwor");
        try {
            ArrayList<String> retornoPersona = retornarSiExisteUsuario(usuario);
            if (retornoPersona.isEmpty()) {
                boolean agregar = agregarJugador(nombres, email, fechaNacimiento, edad, genero, usuario, pasword);

                if (agregar == true) {
                    response.sendRedirect("index.jsp?mens='RegistroExitoso'");
                } else {
                    response.sendRedirect("index.jsp?mens='ErrorRegistro'");
                }
            } else {
                response.sendRedirect("index.jsp?mens='ErrorRegistro'");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }

    private void ActualizarJuga(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        String nombres = request.getParameter("NombresJu");
        String genero = request.getParameter("genero");
        String email = request.getParameter("emailUsu");
        String fechaNacimiento = request.getParameter("fechaNacimi");
        String edad = request.getParameter("edadUsu");
        String usuario = request.getParameter("Usuario");
        String pasword = request.getParameter("contraseña");
        String idPersona = request.getParameter("idPersonaInput");
        try {
            boolean actualiza = actualizarJugador(idPersona, nombres, email, fechaNacimiento, edad, genero, usuario, pasword);
            if (actualiza == true) {
                response.sendRedirect("vistas/Administrador/administrador.jsp?mens='RegistroExitoso'");
            } else {
                response.sendRedirect("vistas/Administrador/editarDatosJugador.jsp?mens='ErrorRegistro'");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }

    private void EliminarJuga(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        String idPersona = request.getParameter("idPersona");
        try {
            boolean elimina = eliminarPersona(idPersona);
            if (elimina == true) {
                response.sendRedirect("vistas/Administrador/administrador.jsp?mens='EliminadoExitosamente'");
            } else {
                response.sendRedirect("vistas/Administrador/administrador.jsp?mens='errorSistema'");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }

    private ArrayList<String> retornarSiExisteUsuario(String usuario) {
        ArrayList<String> dato;
        dato = faca.retornarSiExisteUsuario(usuario);
        return dato;
    }

    private boolean agregarJugador(String nombres, String email, String fechaNacimiento, String edad, String genero, String usuario, String pasword) {
        return faca.agregarJugador(nombres, email, fechaNacimiento, edad, genero, usuario, pasword);
    }

    private boolean actualizarJugador(String idPersona, String nombres, String email, String fechaNacimiento, String edad, String genero, String usuario, String pasword) {
        return faca.actualizarJugador(idPersona, nombres, email, fechaNacimiento, edad, genero, usuario, pasword);
    }

    private boolean eliminarPersona(String idPersona) {
        return faca.eliminarPersona(idPersona);
    }

}
