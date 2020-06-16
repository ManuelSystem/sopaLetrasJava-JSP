<%-- 
    Document   : juego2
    Created on : 23/05/2020, 08:25:48 PM
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
        <title>Jugador!</title>
        <link href="../../css/estilosSopa.css" rel="stylesheet" type="text/css"/>
        <link href="../../lib/fontawesome/css/all.css" rel="stylesheet" type="text/css"/>
        <link href="../../lib/fontawesome/css/fontawesome.css" rel="stylesheet" type="text/css"/>
        <link href="../../lib/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../../lib/bootstrap/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/dashboard.css" rel="stylesheet" type="text/css"/>

    </head>
    <body onload="main();">
        <script language="javascript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
        <script src="../../js/wordfind.js" type="text/javascript"></script>
        <script src="../../js/funciones.js" type="text/javascript"></script>
        <%
            Facade faca = new Facade();
            if (request.getParameter("mens") != null) { %>
        <input type="text" name="obtInfo" id="obtInfo" value="<%out.println(request.getParameter("mens")); %>" style="visibility: hidden;"> <%
            }
        %>
        <%
            String usuario = (String) session.getAttribute("parametroCodigo");
            String jugador = (String) session.getAttribute("jugador");

            ArrayList<String> datoSesion = faca.obtenerDatosPersona(usuario);
            String dato = datoSesion.toString().replace("[", "").replace("]", "");
            String[] sesion = dato.split("/");

            ArrayList<String> jue = faca.obtenerDatosJuego(jugador);
            String datos = jue.toString().replace("[", "").replace("]", "");
            String[] juegoss = datos.split("/");
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
                        <li><a href="#"> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Perfil</a></li>
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
                        <li class="active"><a href="jugador.jsp"> <span class="fas fa-gamepad"></span> Jugar</a></li>
                        <li><a href="conductor.jsp"> <i class="fab fa-gripfire"></i> Records </a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h1 class="page-header">¡Aprezurate, termina siendo el mejor!</h1>

                    <!-- Div de alerta de informción -->
                    <div class="alert alert-info alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <strong>Información!</strong> Una vez des clic en vamos... iniciará el tiempo de partida, no pierdas tiempo y termina siendo el mejor
                    </div>
                    
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">
                            <br>
                            <br>
                            <div class="row contenedorForms">
                                <form action="../../ControladorJuego" method="post">
                                    <input type="text" name="jugador" value="<%=juegoss[1]%>" style="visibility:hidden "/>
                                    <input type="text" class="form-control" name="idPersonaInput" value="<%=juegoss[0]%>" style="visibility:hidden ">
                                    <div class="form-row">
                                        <div class="form-group col-md-2">
                                            <label for="" >Tiempo:</label>
                                            <label for="" >Minutos</label>
                                            <input type="text" class="form-control" id="minutes" name="minuto" value="<%=juegoss[2]%>" readonly="">
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label for="" >Segundos</label>
                                            <input type="text" class="form-control" id="seconds" name="segundo" value="<%=juegoss[3]%>" readonly="">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="">Puntuación de Juego</label>
                                            <input type="text" class="form-control" id="score" name="puntuacion" value="<%=juegoss[4]%>" readonly="">
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label for="">Nivel de Juego</label>
                                            <input type="text" class="form-control" name="nivel" value="2" readonly="">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-2" id="iniciar">
                                            <label for="">Iniciar Partida</label>
                                            <Button type="button" onclick="inicioTime();"  class="btn btn-primary">Vamos...</Button>

                                        </div>
                                        <div class="form-group col-md-2" id="detener">
                                            <label for="">Detener Partida</label>
                                            
                                            <Button type="submit" onclick="detenerTime();" class="btn btn-danger"  name="accion" value="actuzalizarNivel">Terminar Juego</Button>

                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="contentSopa">
                                <div class="palabras col-md-6">
                                    <h2>Palabras</h2>
                                    <div id='words'></div>
                                </div>
                                <div class="asopaLetras col-md-6">
                                    <h2>Sopa de Letras</h2>
                                    <div id='puzzle'></div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- modal cerrar sesion -->
            <%@ include file="../HTML/modal_CerrarSesion.jsp" %> 
            <!-- modal Error eliminando--> 
            <%@ include file="../HTML/modal_Error.jsp" %>
            <script>
                    var words = ['PIEDRA', 'RELOJ', 'CEPILLO', 'GOTA', 'CELULAR', 'AGUA', 'VELA', 'LUPA', 'LAMPARA', 'LUZ'];
                var gamePuzzle = wordfindgame.create(words, '#puzzle', '#words');
            </script>

            <script src="../../lib/fontawesome/js/all.js" type="text/javascript"></script>
            <script src="../../lib/jquery/jquery-3.3.1.js" type="text/javascript"></script>
            <script src="../../lib/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
            <script src="../../lib/bootstrap/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
            <script src="../../js/script_Admin.js" type="text/javascript"></script>
            <script src="../../js/temporizadoe2.js" type="text/javascript"></script>
    </body>
</html>
