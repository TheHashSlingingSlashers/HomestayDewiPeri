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
                            List Penyewa Homestay
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Kode Event</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" class="form-control col-md-4 col-xs-12" id="kodeEvent" name="kodeEvent">
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="col-md-offset-2 col-sm-offset-2">
                                    <button type="button" id="lihatBtn" onclick="lihatPenyewa();" class="btn btn-labeled btn-success" style="margin-left: 5px;">
                                        <span class="btn-label"><i class="glyphicon glyphicon-ok"></i></span> Lihat</button>
                                </div>
                            </form>
                            <!-- /.form -->
                            <br>

                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Nama</th>
                                        <th>Gender</th>
                                        <th>Makanan</th>
                                        <th>Homestay</th>
                                        <th>Menginap</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:set var="count" value="1" scope="page" />
                                    <c:forEach items="${listPenyewa}" var="p">
                                        <tr>
                                            <td>${count}</td>
                                            <td>${p.nama}</td>
                                            <td>${p.jenisKelamin}</td>
                                            <td>${p.jenisMakanan}</td>
                                            <td></td>
                                            <td>${p.menginap}</td>
                                        </tr>
                                        <c:set var="count" value="${count + 1}" scope="page"/>
                                    </c:forEach>
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
        $('#dataTables-example').DataTable({
            responsive: true
        });

        $('#dataTables-example tr').click(function (event) {
            $(this).toggleClass('selected');
            if (event.target.type !== 'checkbox') {
                $(':checkbox', this).trigger('click');
            }
        });

        $('#lihatBtn').click(function () {
            var id = $('#kodeEvent').val();
            lihatPenyewa(id);
        });
    });

    function lihatPenyewa(id) {
        window.location = '${path}/manajemen/list/'+id;
    }
</script>

</body>

</html>

