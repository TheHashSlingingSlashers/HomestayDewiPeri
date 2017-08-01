<%-- 
    Document   : tambah-homestay
    Created on : Feb 16, 2017, 11:46:22 AM
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
                    <h1 class="page-header"><i class="fa fa-home" aria-hidden="true"></i> Homestay</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Tambah Homestay Baru</div>
                        <div class="panel-body">
                            <form method="POST" class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Kode Homestay</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="kodeHomestay"
                                               name="id" required>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Nama Pemilik</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="testInput"
                                               name="pemilik" required>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">ID Pemilik</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" class="form-control col-md-4 col-sm-4 col-xs-12"
                                               id="idPemilik" name="idPemilik" required>
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
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Jumlah Kamar</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" class="form-control" id="jumlahKamar" name="jumlahKamar"
                                               required>
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
                                        <input type="text" class="form-control" id="jumlahToilet" name="jumlahWC"
                                               required>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="col-md-offset-2 col-sm-offset-2">



                                    <button type="submit" data-toggle="modal" data-target="#myModal" id="bynSave"
                                            class="btn btn-labeled btn-success"><span class="btn-label"><i
                                            class="glyphicon glyphicon-floppy-disk"></i></span> Simpan
                                    </button>
                                </div>

                            </form>
                            <!-- /.form -->

                            <!-- Modal -->
                            <div id="myModal" class="modal fade" role="dialog">
                                <div class="modal-dialog modal-md">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header btn-success" style="font-weight:bold; color:white;">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h5 class="modal-title modal-sm">Berhasil</h5>
                                        </div>
                                        <div class="modal-body">
                                            <p id="message"></p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" id="btnOK" data-dismiss="modal"
                                                    class="btn btn-success">OK
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

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
    $(function () {
        $("#idPemilik").autofill({
            data: arrIdPemilik
        });
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

<script>
    var arrIdPemilik = [];
    $(document).ready(function () {
        $('#btnSave').click(function () {
            var namaHs = $('#nama').val();
            $('#message').text('Data, ' + namaHs + ' berhasil disimpan.');
        });
        <c:forEach items="${listIdPemilik}" var="id">
        arrIdPemilik.push("${id}");
        </c:forEach>
    });
</script>

</body>

</html>

