<%-- 
    Document   : edit-homestay
    Created on : Feb 16, 2017, 11:37:17 AM
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
    <%@include file="include/navbar.jsp"%>
    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-home" aria-hidden="true"></i> Homestay</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading"> Edit Homestay</div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form" role="form" method="post">
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Kode Homestay</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="kodeHomestay"
                                               readonly="readonly" value="${homestay.id}">
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Nama Pemilik</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" name="pemilik" id="pemilik"
                                        value="${homestay.pemilik}">
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Lokasi</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <select name="lokasi" class="form-control" title="Pilih Event yang Diikuti">
                                            <option>RT 1</option>
                                            <option>RT 2</option>
                                            <option>RT 3</option>
                                            <option>RT 4</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Jumlah Kamar</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" class="form-control" id="jumlahKamar" name="jumlahKamar" value="${homestay.jumlahKamar}">
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Jumlah Tempat Tidur</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" class="form-control" id="jumlahTempatTidur" name="jumlahBed" value="${homestay.jumlahBed}">
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Kapasitas</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" class="form-control" id="kapasitas" name="kapasitas" readonly>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Jumlah Toilet</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" class="form-control" id="jumlahToilet" name="jumlahWC" value="${homestay.jumlahWC}">
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
<%@include file="include/scripts.jsp"%>
<script>
    $(document).ready(function () {
        val1 = parseFloat($('#jumlahKamar').val());
        val2 = parseFloat($('#jumlahTempatTidur').val());
        (val1 != null && val2 != null) ? $('#kapasitas').val(val1 * val2) :  $('#kapasitas').val(0);
    });
</script>
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

