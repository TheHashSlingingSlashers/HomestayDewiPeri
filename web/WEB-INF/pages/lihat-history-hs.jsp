<%-- 
    Document   : lihat-homestay
    Created on : Feb 16, 2017, 11:44:31 AM
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

    <!-- Navigation -->
    <%@include file="include/navbar.jsp" %>

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-suitcase fa-fw" aria-hidden="true"></i> Manajemen Homestay</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            List History Pemakaian Homestay
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-md-1 col-sm-1 col-xs-12">Lokasi</label>
                                    <div class="col-md-2 col-sm-2 col-xs-12">
                                        <select name="lokasi" class="form-control" title="Pilih Event yang Diikuti">
                                            <option value="RT 1">RT 1</option>
                                            <option value="RT 2">RT 2</option>
                                            <option value="RT 3">RT 3</option>
                                            <option value="RT 4">RT 4</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                            </form>
                            <!-- /.form -->
                            <br>

                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>Kode Hs</th>
                                        <th>Pemilik</th>
                                        <th>Tanggal Event Terakhir</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>A1</td>
                                            <td>Lorem ipsum dolor sit amet</td>
                                            <td>8</td>
                                        </tr>
                                        <tr>
                                            <td>A2</td>
                                            <td>Consectetur adipiscing elit</td>
                                            <td>7</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
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
<%@include file="include/dataTablesScript.jsp" %>


<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $(document).ready(function () {
        $('#dataTables-example tr').click(function (event) {
            $(this).toggleClass('selected');
            if (event.target.type !== 'checkbox') {
                $(':checkbox', this).trigger('click');
            }
        });

        $('#dataTables-example').DataTable({
            responsive: true
        });
    })
</script>

</body>

</html>

