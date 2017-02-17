<%-- 
    Document   : index
    Created on : Feb 16, 2017, 8:56:11 AM
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
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">Admin Dewi Peri</a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">


                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="fa fa-user fa-fw"></i> Ubah Password Admin</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                            <li>
                                <a href="#"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i> Event<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="lihat-event.jsp">Lihat Event</a>
                                    </li>
                                    <li>
                                        <a href="event-baru.jsp">Buat Event Baru</a>
                                    </li>
                                    <li>
                                        <a href="edit-event.jsp">Edit Event</a>
                                    </li>
                                    <li>
                                        <a href="hapus-event.jsp">Hapus Event</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>

                            <li>
                                <a href="#"><i class="fa fa-users fa-fw" aria-hidden="true"></i> Penyewa<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="lihat-penyewa.jsp">Lihat Penyewa</a>
                                    </li>
                                    <li>
                                        <a href="tambah-penyewa.jsp">Tambah Penyewa Baru</a>
                                    </li>
                                    <li>
                                        <a href="edit-penyewa.jsp">Edit Penyewa</a>
                                    </li>
                                    <li>
                                        <a href="hapus-penyewa.jsp">Hapus Penyewa</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>

                            <li>
                                <a href="#"><i class="fa fa-home fa-fw" aria-hidden="true"></i> Homestay<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="lihat-homestay.jsp">Lihat Homestay</a>
                                    </li>
                                    <li>
                                        <a href="tambah-homestay.jsp">Tambah Homestay Baru</a>
                                    </li>
                                    <li>
                                        <a href="edit-homestay.jsp">Edit Homestay</a>
                                    </li>
                                    <li>
                                        <a href="hapus-homestay.jsp">Hapus Homestay</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>

                            <li>
                                <a href="#"><i class="fa fa-user fa-fw" aria-hidden="true"></i> Manajemen Pengguna<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="lihat-pengguna.jsp">Lihat Pengguna</a>
                                    </li>
                                    <li>
                                        <a href="tambah-pengguna.jsp">Tambah Pengguna Baru</a>
                                    </li>
                                    <li>
                                        <a href="edit-password.jsp">Edit Password Pengguna</a>
                                    </li>
                                    <li>
                                        <a href="hapus-pengguna.jsp">Hapus Pengguna</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
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

