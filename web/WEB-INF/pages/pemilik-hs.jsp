<%-- 
    Document   : lihat-pengguna
    Created on : Feb 16, 2017, 11:45:03 AM
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
    <%@include file="include/dataTablesCss.jsp" %>
    <!-- Custom CSS -->
    <link href="${path}/dist/css/build.css" rel="stylesheet">

</head>

<body>

<div id="wrapper">

        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${path}">Selamat Datang, </a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">


                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li class="divider"></li>
                        <li><a href="${path}/logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="active">
                            <a href="${path}/penyewa"><i class="fa fa-home fa-fw" aria-hidden="true"></i> Info Homestay</a>
                        </li>

                        <li>
                            <a href="${path}/homestay"><i class="fa fa-users fa-fw" aria-hidden="true"></i> List Penyewa Homestay</a>
                        </li>

                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-home fa-fw" aria-hidden="true"></i> Info Homestay Pengguna</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">&nbsp;</div>
                        <div class="panel-body">
                            <form  method="POST" class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Kode Homestay</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="kodeHomestay"
                                               name="id" readonly="readonly">
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Nama Pemilik</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="namaPemilik"
                                               name="pemilik" required>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Lokasi</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <select name="lokasi" class="form-control" title="Pilih Event yang Diikuti">
                                            <option value="RT 1">RT 1</option>
                                            <option value="RT 2">RT 2</option>
                                            <option value="RT 3">RT 3</option>
                                            <option value="RT 4">RT 4</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Status</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <select name="status" class="form-control" title="Status Homestay">
                                            <option value="Tersedia">Tersedia</option>
                                            <option value="Tidak Tersedia">Tidak Tersedia</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Jumlah Kamar</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" class="form-control" id="jumlahKamar" name="jumlahKamar" required>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Jumlah Tempat Tidur</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" class="form-control" id="jumlahTempatTidur"
                                               name="jumlahBed" required>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Kapasitas</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" class="form-control" id="kapasitas" name="kapasitas"
                                               readonly="readonly">
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Jumlah Toilet</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" class="form-control" id="jumlahToilet" name="jumlahWC" required>
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

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $('#jumlahKamar').keyup(function () {
        var val1 = 0;
        var val2 = 0;
        var result = 0;
        val1 = parseFloat($('#jumlahKamar').val());
        val2 = parseFloat($('#jumlahTempatTidur').val());
        result = val1 * val2;
        if (isNaN(result)) {
            $('#kapasitas').val(0);
        }
        else {
            $('#kapasitas').val(result.toFixed(0));
        }
    });
</script>
<script>
    $('#jumlahTempatTidur').keyup(function () {
        var val1 = 0;
        var val2 = 0;
        var result = 0;
        val1 = parseFloat($('#jumlahKamar').val());
        val2 = parseFloat($('#jumlahTempatTidur').val());
        result = val1 * val2;
        if (isNaN(result)) {
            $('#kapasitas').val(0);
        }
        else {
            $('#kapasitas').val(result.toFixed(0));
        }
    });
</script>

</body>

</html>

