<%-- 
    Document   : index
    Created on : 21/05/2020, 10:29:52 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=0.4">
        <title>¡Juega sopa de letras!</title>

        <!-- estilos css -->
        <link href="lib/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/> 
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="css/dashboard.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>

        <div class="main">
            <%
                if (request.getParameter("mens") != null) { %>
            <input type="text" name="obtInfo" id="obtInfo" value="<%out.println(request.getParameter("mens")); %>" style="visibility: hidden"> <%
                }
            %>
            <div class="container-fluid">

                <div class="row">

                    <div class="col-md-6">

                        <div class="formulario">
                            <h2>Iniciar Sesión</h2>
                            <form method="post" id="" action="ControladorLogin">
                                <div class="form-group">

                                    <div class="row">
                                        <div class="col-md-2">
                                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="user" placeholder="Usuario" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">

                                    <div class="row">
                                        <div class="col-md-2">
                                            <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="password" class="form-control" name="password" placeholder="password" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <a class="btn btn-success" href="#" data-toggle="modal" data-target="#myModal">Registrarse</a>
                                    <button type="submit" class="btn btn-default" name="accion" value="login">Ingresar</button>
                                </div>
                            </form>
                        </div>

                    </div>

                    <div class="col-md-6 ">
                        <div class="image center-block">
                            <img src="img/iconLogin.png" class="img-responsive center-block imgLogo">
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
                                <p>!Registro completado¡</p>

                            </div>

                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <div class="modal fade" id="ErrorRegistro" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body modalErrorUsuario">

                            <div class="row">

                                <div class="iconModalErrorUsuario">
                                    <span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>
                                </div>
                                <p>¡ERROR! - Hubo algun error en el sistema</p>

                            </div>

                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <div class="modal fade" id="errorUsuario" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body modalErrorUsuario">

                            <div class="row">

                                <div class="iconModalErrorUsuario">
                                    <span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>
                                </div>
                                <p>¡ERROR! - Este Usuario No Existe o No Se Encuentra Registrado</p>

                            </div>

                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <!-- aqui comienzza el modal de registro---------------------------------------------------------------------->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">


                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h2 class="modal-title">Ventana de Registro</h2>
                        </div>
                        <div class="modal-body">

                            <div class="row">


                                <!-- cuadro de registro del Usuario-->
                                <form action="ControladorJugador" class="form-horizontal" method="post">
                                    <div id="Docente-Administrativo" class="marcoSeleccionado">
                                        <br>
                                        <h5> * Complete los campos para el Formulario: <span id="objRecivido"></span> </h5>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" name="nombres" placeholder="Nombres" required="" onkeypress="return soloLetras(event)">
                                                </div>
                                                <div class="col-lg-6">
                                                    <select class="form-control"  name="genero" required="">
                                                        <option value="">Tipo Genero</option>
                                                        <option >Femenino</option>
                                                        <option >Masculino</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-lg-12">
                                                    <div class="input-group">
                                                        <input type="email" class="form-control" placeholder="Correo Electronico" name="email" aria-describedby="basic-addon2" required="">
                                                        <span class="input-group-addon" id="basic-addon2">@example.com</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-lg-6">
                                                    <input type="date" class="form-control" placeholder="Fecha Nacimiento" name="fechaNacimi" required="">
                                                </div>
                                                <div class="col-lg-6">
                                                    <input type="number" class="form-control" placeholder="Edad" name="edad" min="18" max="80" required="">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" name="usuario" placeholder="usuario" required="" >
                                                </div>
                                                <div class="col-lg-6">
                                                    <input type="password" class="form-control" name="passwor" placeholder="pasword" required="" >
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary" name="accion" value="agregarUsu">Registrar</button>
                                        </div>

                                    </div>
                                </form>  
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>

                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                    <!-- aqui cierra el modal de registro------------------------------------------------------------------------- -->


                    <script src="lib/jquery/jquery-3.3.1.js" type="text/javascript"></script>
                    <script src="lib/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
                    <script src="js/script_Admin.js" type="text/javascript"></script>
                    <script src="js/soloLetras.js" type="text/javascript"></script>
                    </body>
                    </html>