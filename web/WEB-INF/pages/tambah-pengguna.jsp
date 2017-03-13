<%-- 
    Document   : tambah-pengguna
    Created on : Feb 16, 2017, 11:46:55 AM
    Author     : Kasih Handoyo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Admin Dewi Peri</title>
        <%@include file="include/css.jsp" %>

        <!-- Custom CSS -->
        <link href="${path}/dist/css/build.css" rel="stylesheet">

    </head>

    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <%@include file="include/navbar.jsp" %>

            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header"><i class="fa fa-user fa-fw" aria-hidden="true"></i> Manajemen Pengguna</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Tambah Pengguna Baru</div>
                                <div class="panel-body">
                                    <form class="form-horizontal" role="form" method="get">

                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">No. Identitas</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control" id="noIdentias" required>
                                            </div>
                                        </div>
                                        <!-- /.form-group -->                                    
                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">Nama</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control" id="nama" required>
                                            </div>
                                        </div>
                                        <!-- /.form-group -->
                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">Jenis Kelamin</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <div class="radio radio-inline radio-primary">
                                                    <input type="radio" name="sexRadio" id="inlineRadio1" value="option1" class="sr-only" required>
                                                    <label for="inlineRadio1">Laki-laki</label>
                                                </div>
                                                <div class="radio radio-inline radio-primary">
                                                    <input type="radio" name="sexRadio" id="inlineRadio2" value="option2" class="sr-only" required>
                                                    <label for="inlineRadio2">Perempuan</label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.form-group -->
                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">RT Tempat Tinggal</label>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <select class="form-control" title="RT Tempat Tinggal">
                                                    <option>RT 1</option>
                                                    <option>RT 2</option>
                                                    <option>RT 3</option>
                                                    <option>RT 4</option>
                                                </select>
                                            </div>
                                        </div>
                                        <!-- /.form-group -->
                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">Username</label>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <input type="text" class="form-control" id="username" required>
                                            </div>
                                        </div>
                                        <!-- /.form-group -->
                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">Password</label>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <div class="input-group">
                                                    <input type="password" class="form-control" name="password" id="password1" required>
                                                    <div class="input-group-addon"><span class="glyphicon glyphicon-eye-close"></span></div>
                                                </div>    
                                            </div>
                                        </div>
                                        <!-- /.form-group -->
                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">Ulangi Password</label>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <div class="input-group">
                                                    <input type="password" class="form-control" id="password2" required>
                                                    <div class="input-group-addon"><span class="glyphicon glyphicon-eye-close"></span></div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.form-group -->

                                        <div class="col-md-offset-2 col-sm-offset-2">
                                            &nbsp;<button type="submit" class="btn btn-labeled btn-success"><span class="btn-label"><i class="glyphicon glyphicon-floppy-disk"></i></span> Save</button>
                                        </div>

                                    </form>
                                    <!-- /.form -->
                                </div>
                                <!-- /.panel body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->
        <%@include file="include/scripts.jsp" %>

        <script>
            $(document).ready(function() {
                var password = document.getElementById("password1")
                    , confirm_password = document.getElementById("password2");

                function validatePassword() {
                    if (password.value != confirm_password.value) {
                        confirm_password.setCustomValidity("Passwords Don't Match");
                    } else {
                        confirm_password.setCustomValidity('');
                    }
                }

                password.onchange = validatePassword;
                confirm_password.onkeyup = validatePassword;
            });
        </script>

    </body>

</html>

