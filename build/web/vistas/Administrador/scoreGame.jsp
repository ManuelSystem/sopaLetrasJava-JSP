<%-- 
    Document   : scoreGame
    Created on : 25/05/2020, 12:36:27 AM
    Author     : Manuel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Administrador!</title>

        <link href="../../lib/fontawesome/css/all.css" rel="stylesheet" type="text/css"/>
        <link href="../../lib/fontawesome/css/fontawesome.css" rel="stylesheet" type="text/css"/>
        <link href="../../lib/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../../lib/bootstrap/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/dashboard.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/DataTabla.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>

        <%
            Facade faca = new Facade();
            if (request.getParameter("mens") != null) { %>
        <input type="text" name="obtInfo" id="obtInfo" value="<%out.println(request.getParameter("mens")); %>" style="visibility: hidden;"> <%
            }
        %>
        <%
            String usuario = (String) session.getAttribute("parametroCodigo");

            ArrayList<String> datoSesion = faca.obtenerDatosPersona(usuario);
            String dato = datoSesion.toString().replace("[", "").replace("]", "");
            String[] sesion = dato.split("/");

        %>

        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar"  aria-controls="navbar"></
                        <span class="sr-only">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Juego Web !Sopa de Letras¡</a>

                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"> <span class="glyphicon glyphicon-home" aria-hidden="true"></span> Inicio</a></li>
                        <li><a href="#" data-toggle="modal" data-target="#myModalCerrar"> <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Salir</a></li>

                    </ul>

                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">

                    <div class="opcAdmin">

                        <span style="color: #4ECDC4; font-family: sans-serif; font-size: 16px;" class="col-md-12"> Bienvenido!</span>
                        <span style="color: #fff;" class="col-md-12 userNombre"><%=sesion[6]%></span>
                        <div class="iconOpcAdmin">
                            <a href="#" data-toggle="modal" data-target="#myModalCerrar"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> </a> 
                        </div>

                    </div>

                    <ul class="nav nav-sidebar">
                        <li><a href="administrador.jsp"> <span class="fas fa-users" aria-hidden="true"></span> Jugadores</a></li>
                        <li class="active"><a href="#"> <i class="fab fa-gripfire"></i> Records </a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h1 class="page-header">Resultados de todos los Jugadores!</h1>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">

                            <br>
                            <br>
                            <table id="example" class="table table-striped table-bordered table-responsive" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>Nombre de Usuario</th>
                                        <th>Minutos</th>
                                        <th>Segundos</th>
                                        <th>Puntuación</th>
                                        <th>Nivel</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%
                                        ArrayList<String> lista = faca.obtenerDatosJuego();

                                        for (int i = 0; i < lista.size(); i++) {
                                            String dato1 = lista.get(i).toString();
                                            String[] dato2 = dato1.split("/");
                                    %>

                                    <tr>
                                        <td> <%=dato2[1]%> </td>
                                        <td> <%=dato2[2]%> </td>
                                        <td> <%=dato2[3]%> </td>
                                        <td> <%=dato2[4]%> </td>
                                        <td> <%=dato2[5]%> </td>
                                    </tr>

                                    <% }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- modal cerrar sesion -->
        <%@ include file="../HTML/modal_CerrarSesion.jsp" %> 
        <!-- modal Eliminado exitoso -->
        <%@ include file="../HTML/modal_EliminadoExitosamente.jsp" %>
        <!-- modal Error eliminando--> 
        <%@ include file="../HTML/modal_Error.jsp" %>

        <script src="../../lib/fontawesome/js/all.js" type="text/javascript"></script>
        <script src="../../lib/jquery/jquery-3.3.1.js" type="text/javascript"></script>
        <script src="../../lib/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../../lib/bootstrap/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="../../lib/bootstrap/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../../js/script_Admin.js" type="text/javascript"></script>
    </body>
</html>
