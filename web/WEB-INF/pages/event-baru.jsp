<%-- 
    Document   : event-baru
    Created on : Feb 16, 2017, 11:38:34 AM
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
                    <h1 class="page-header">Event</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Buat Event Baru</div>
                        <div class="panel-body">
                            <form method="post" class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Kode Event</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="kodeEvent"
                                               name="kodeEvent">
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Nama Event</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="namaEvent"
                                               name="namaEvent">
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Penyelenggara</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="penyelenggara"
                                               name="penyelenggara">
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Mulai Event</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <div class="xdisplay_inputx has-feedback">
                                            <div class="input-group">
                                                <input type="text" class="form-control col-md-7 col-xs-12"
                                                       id="single_cal3" aria-describedby="inputSuccess2Status"
                                                       name="single_cal3">
                                                <div class="input-group-addon"><span
                                                        class="glyphicon glyphicon-calendar"></span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Selesai Event</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <div class="xdisplay_inputx has-feedback">
                                            <div class="input-group">
                                                <input type="text" class="form-control col-md-7 col-xs-12"
                                                       id="single_cal2" aria-describedby="inputSuccess2Status"
                                                       name="single_cal2">
                                                <div class="input-group-addon"><span
                                                        class="glyphicon glyphicon-calendar"></span></div>
                                            </div>
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

<script src="${path}/js/moment/moment.min.js"></script>
<script src="${path}/js/datepicker/daterangepicker.js"></script>
<script>
    $(document).ready(function () {


        $('#single_cal3').daterangepicker({
            singleDatePicker: true,
            calender_style: "picker_3"
        }, function (start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
        });

    });
</script>

<script>
    $(document).ready(function () {


        $('#single_cal2').daterangepicker({
            singleDatePicker: true,
            calender_style: "picker_3"
        }, function (start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
        });

    });
</script>

</body>

</html>

