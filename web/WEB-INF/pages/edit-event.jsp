<%-- 
    Document   : edit-event
    Created on : Feb 16, 2017, 11:36:01 AM
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

        <!-- Bootstrap Core CSS -->
        <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

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
                            <h1 class="page-header">Event</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <form action="../EditEvent" method="POST" class="form-inline pull-right" role="form">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Kode Event..." name="kodeEvent">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="submit"> Cari</button>
                                        </span>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                            </form>
                            <!-- /.form -->
                        </div>  
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading"> Edit Event</div>
                                <div class="panel-body">
                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">Kode Event</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control col-md-7 col-xs-12" id="kodeEvent" readonly="readonly">
                                            </div>
                                        </div>
                                        <!-- /.form-group -->

                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">Nama Event</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control col-md-7 col-xs-12" id="namaEvent">
                                            </div>
                                        </div>
                                        <!-- /.form-group -->
                                        
                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">Penyelenggara</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control col-md-7 col-xs-12" id="penyelenggara" name="penyelenggara">
                                            </div>
                                        </div>
                                        <!-- /.form-group -->

                                        <div class="form-group">
                                            <label class="col-md-2 col-sm-2 col-xs-12">Mulai Event</label>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <div class="xdisplay_inputx has-feedback">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control col-md-7 col-xs-12" id="single_cal3" aria-describedby="inputSuccess2Status">
                                                        <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></div>
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
                                                        <input type="text" class="form-control col-md-7 col-xs-12" id="single_cal2" aria-describedby="inputSuccess2Status">
                                                        <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></div>
                                                    </div>
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

        <!-- jQuery -->
        <script src="../bower_components/jquery/dist/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../dist/js/sb-admin-2.js"></script>

        <script src="../js/moment/moment.min.js"></script>
        <script src="../js/datepicker/daterangepicker.js"></script>
        <script>
            $(document).ready(function() {


                $('#single_cal3').daterangepicker({
                    singleDatePicker: true,
                    calender_style: "picker_3"
                }, function(start, end, label) {
                    console.log(start.toISOString(), end.toISOString(), label);
                });

            });
        </script>

        <script>
            $(document).ready(function() {


                $('#single_cal2').daterangepicker({
                    singleDatePicker: true,
                    calender_style: "picker_3"
                }, function(start, end, label) {
                    console.log(start.toISOString(), end.toISOString(), label);
                });

            });
        </script>

    </body>

</html>

