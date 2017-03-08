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
                            <h1 class="page-header">Manajemen Pengguna</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Tambah Pengguna Baru</div>
                                <div class="panel-body">
                                    <form class="form-horizontal" role="form">

                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">No. Identitas</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control" id="noIdentias">
                                            </div>
                                        </div>
                                        <!-- /.form-group -->                                    
                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">Nama</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control" id="nama">
                                            </div>
                                        </div>
                                        <!-- /.form-group -->
                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">Jenis Kelamin</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <div class="radio radio-inline radio-primary">
                                                    <input type="radio" name="sexRadio" id="inlineRadio1" value="option1">
                                                    <label for="inlineRadio1">Laki-laki</label>
                                                </div>
                                                <div class="radio radio-inline radio-primary">
                                                    <input type="radio" name="sexRadio" id="inlineRadio2" value="option2">
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
                                                <input type="text" class="form-control" id="username">
                                            </div>
                                        </div>
                                        <!-- /.form-group -->
                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">Password</label>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <div class="input-group">
                                                    <input type="password" class="form-control" id="password1">
                                                    <div class="input-group-addon"><span class="glyphicon glyphicon-eye-close"></span></div>
                                                </div>    
                                            </div>
                                        </div>
                                        <!-- /.form-group -->
                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">Ulangi Password</label>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <div class="input-group">
                                                    <input type="password" class="form-control" id="password2">    
                                                    <div class="input-group-addon"><span class="glyphicon glyphicon-eye-close"></span></div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.form-group -->

                                        <div class="col-md-offset-2 col-sm-offset-2">
                                            <button type="button" class="btn btn-labeled btn-success"><span class="btn-label"><i class="glyphicon glyphicon-floppy-disk"></i></span> Simpan</button>    
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

    </body>

</html>

