<%-- 
    Document   : editarDatosJugador
    Created on : 23/05/2020, 12:47:51 AM
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
        <title>Administrador</title>

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
            String idPersona = request.getParameter("idPersona");

            ArrayList<String> datoSesion = faca.obtenerDatosPersona(usuario);
            String dato = datoSesion.toString().replace("[", "").replace("]", "");
            String[] sesion = dato.split("/");

            ArrayList<String> datosJugador = faca.obtenerDatosJugador(idPersona);
            String dtAu = datosJugador.toString().replace("[", "").replace("]", "");
            String[] dtoJuga = dtAu.split("/");

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
                        <li class="active"><a href="administrador.jsp"> <span class="fas fa-users" aria-hidden="true"></span> Jugadores</a></li>
                        <li><a href="conductor.jsp"> <i class="fab fa-gripfire"></i> Records </a></li>
                    </ul>
                </div>


                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

                    <ol class="breadcrumb">
                        <li><a href="administrador.jsp">Inicio</a></li>
                        <li >Listado de Jugadores</li>
                        <li class="active">Editar Jugador</li>
                    </ol>

                    <h4 class="">Datos del Jugador Seleccionado:</h4>

                    <div class="row contenedorForms">
                        <form action="../../ControladorJugador" method="post">

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="">Nombres</label>
                                    <input type="text" class="form-control" name="NombresJu" placeholder="Tu Nombre" value="<%=dtoJuga[1]%>" required="">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="">Tipo de Género</label>
                                    <input type="text" class="form-control" name="genero" placeholder="Tipo de Genero" value="<%=dtoJuga[5]%>" required="">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="">Fecha de Nacimiento</label>
                                    <input type="text" class="form-control" name="fechaNacimi" placeholder="Tu Telefono" value="<%=dtoJuga[3]%>" required="">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="">Correo Electronico</label>
                                    <input type="email" class="form-control" name="emailUsu" placeholder="Tu Cooreo Electronico" value="<%=dtoJuga[2]%>" required="">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="">Usuario</label>
                                    <input type="text" class="form-control"  name="Usuario"  value="<%=dtoJuga[6]%>" required="">

                                </div>
                                <div class="form-group col-md-4">
                                    <label for="">Password</label>
                                    <input type="text" class="form-control" placeholder="" name="contraseña" value="<%=dtoJuga[7]%>" required="">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="">Edad</label>
                                    <input type="number" class="form-control" placeholder="Edad" name="edadUsu" min="1" max="120" value="<%=dtoJuga[4]%>"required="">
                                </div>

                            </div>
                            <input type="text" class="form-control" name="idPersonaInput" value="<%=idPersona%>" style="visibility:hidden ">
                            <button type="submit" class="btn btn-primary" name="accion" value="actualizarJugador">Actualizar Jugador</button>
                        </form>

                    </div>

                </div>
            </div>
        </div>
        <div class="modal fade" id="RegistroExitoso" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body modalErrorUsuario">

                        <div class="row">

                            <div class="iconModalErrorUsuario">
                                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                            </div>
                            <p>¡Exito! - Registro completado</p>

                        </div>

                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <!-- modal cerrar sesion -->
        <%@ include file="../HTML/modal_CerrarSesion.jsp" %>
        <!-- modal Error Registro-->
        <%@ include file="../HTML/modal_ErrorRegistro.jsp" %>

        <script src="../../lib/fontawesome/js/all.js" type="text/javascript"></script>
        <script src="../../lib/jquery/jquery-3.3.1.js" type="text/javascript"></script>
        <script src="../../lib/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../../lib/bootstrap/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="../../lib/bootstrap/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../../js/script_Admin.js" type="text/javascript"></script>
    </body>
</html>
