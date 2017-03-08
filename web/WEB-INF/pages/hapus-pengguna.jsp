<%-- 
    Document   : hapus-pengguna
    Created on : Feb 16, 2017, 11:39:57 AM
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
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <form class="form-inline pull-right" role="form">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Username...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button"> Cari</button>
                                        </span>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                            </form>
                        </div>  
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Hapus Pengguna</div>
                                <div class="panel-body">
                                    <form class="form-horizontal" role="form">

                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">No. Identitas</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control" id="noIdentias" readonly="readonly">
                                            </div>
                                        </div>
                                        <!-- /.form-group -->                                    
                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">Nama</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control" id="nama" readonly="readonly">
                                            </div>
                                        </div>
                                        <!-- /.form-group -->
                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">Jenis Kelamin</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control" id="jenisKelamin" readonly="readonly">
                                            </div>
                                        </div>
                                        <!-- /.form-group -->
                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">RT Tempat Tinggal</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control" id="tempatTinggal" readonly="readonly">
                                            </div>
                                        </div>
                                        <!-- /.form-group -->

                                        <div class="col-md-offset-2 col-sm-offset-2">
                                            <button type="button" class="btn btn-labeled btn-danger"><span class="btn-label"><i class="glyphicon glyphicon-trash"></i></span> Hapus</button>    
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

