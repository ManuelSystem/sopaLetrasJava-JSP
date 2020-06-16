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
@WebServlet(name = "ControladorJuego", urlPatterns = {"/ControladorJuego"})
public class ControladorJuego extends HttpServlet {

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
            if (accion.equals("registrarNivel1")) {
                RegistrarJuego(request, response);
            }
            if (accion.equals("actuzalizarNivel")) {
                ActualizarNivel(request, response);
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

    private void RegistrarJuego(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String nombre = request.getParameter("jugador");
        String minuto = request.getParameter("minuto");
        String segundo = request.getParameter("segundo");
        String puntuacion = request.getParameter("puntuacion");
        String nivel = request.getParameter("nivel");
        try {
            ArrayList<String> retorno = validarJuegoUsuario(nombre);
            if (retorno.isEmpty()) {
                boolean guardar = registrarJuego(nombre, minuto, segundo, puntuacion, nivel);
                if (guardar == true) {
                    response.sendRedirect("vistas/Jugador/juego2.jsp?mens=NextLevel'");
                    request.getSession().setAttribute("jugador", nombre);
                } else {
                    response.sendRedirect("vistas/Jugador/jugador.jsp?mens='errorSistema'");
                }
            } else {
                response.sendRedirect("vistas/Jugador/jugador.jsp?mens='errorSistema'");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }

    private void ActualizarNivel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String nombre = request.getParameter("jugador");
        String minuto = request.getParameter("minuto");
        String segundo = request.getParameter("segundo");
        String puntuacion = request.getParameter("puntuacion");
        String nivel = request.getParameter("nivel");
        String idJuego = request.getParameter("idPersonaInput");
        try {
            boolean actualiza = ActualizarNivelJuego(idJuego, nombre, minuto, segundo, puntuacion, nivel);
            if (actualiza == true) {
                response.sendRedirect("vistas/Jugador/scoreGame.jsp?mens='JuegoCompletado'");
            } else {
                response.sendRedirect("vistas/Jugador/juego2.jsp?mens='errorSistema'");
            }
        } catch (Exception e) {
            out.println(e);
        }

    }

    private ArrayList<String> validarJuegoUsuario(String nombre) {
        ArrayList<String> dato;
        dato = faca.validarJuegoUsuario(nombre);
        return dato;
    }

    private boolean registrarJuego(String nombre, String minuto, String segundo, String puntuacion, String nivel) {
        return faca.registrarJuego(nombre, minuto, segundo, puntuacion, nivel);
    }

    private boolean ActualizarNivelJuego(String idJuego, String nombre, String minuto, String segundo, String puntuacion, String nivel) {
        return faca.ActualizarNivelJuego(idJuego, nombre, minuto, segundo, puntuacion, nivel);
    }

}
