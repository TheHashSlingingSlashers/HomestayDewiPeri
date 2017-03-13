<%-- 
    Document   : edit-penyewa
    Created on : Feb 16, 2017, 11:38:09 AM
    Author     : Kasih Handoyo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                    <h1 class="page-header"><i class="fa fa-user" aria-hidden="true"></i> Penyewa</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <form action="../EditPenyewa" method="POST" class="form-inline pull-right" role="form">
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="No. identitas..." name="id">
                                <span class="input-group-btn">
                                            <button class="btn btn-default" type="submit"> Cari</button>
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
                        <div class="panel-heading">Edit Penyewa</div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form">

                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">No. Identitas</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="noIdentias"
                                               name="noIdentias" readonly="readonly">
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Nama</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="nama"
                                               name="nama">
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Jenis Kelamin</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="radio radio-inline radio-primary">
                                            <input type="radio" name="sexRadio" id="inlineRadio1" value="Laki-laki">
                                            <label for="inlineRadio1">Laki-laki</label>
                                        </div>
                                        <div class="radio radio-inline radio-primary">
                                            <input type="radio" name="sexRadio" id="inlineRadio2" value="Perempuan">
                                            <label for="inlineRadio2">Perempuan</label>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Alamat</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="alamat"
                                               name="alamat">
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">No. Telepon</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="telepon"
                                               name="telepon">
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Jenis Makanan</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="radio radio-inline radio-primary">
                                            <input type="radio" name="foodRadio" id="inlineRadio3" value="Vegetarian">
                                            <label for="inlineRadio3">Vegetarian</label>
                                        </div>
                                        <div class="radio radio-inline radio-primary">
                                            <input type="radio" name="foodRadio" id="inlineRadio4"
                                                   value="Non Vegetarian">
                                            <label for="inlineRadio4">Non Vegetarian</label>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Keterangan</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="radio radio-inline radio-primary">
                                            <input type="radio" name="infoRadio" id="inlineRadio5" value="Menginap">
                                            <label for="inlineRadio5">Menginap&nbsp</label>
                                        </div>
                                        <div class="radio radio-inline radio-primary">
                                            <input type="radio" name="infoRadio" id="inlineRadio6"
                                                   value="Tidak Menginap">
                                            <label for="inlineRadio6">Tidak Menginap</label>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="col-md-offset-2 col-sm-offset-2">
                                    <button type="submit" class="btn btn-labeled btn-success"><span class="btn-label"><i
                                            class="glyphicon glyphicon-floppy-disk"></i></span> Simpan
                                    </button>
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

