<%-- 
    Document   : lihat-event
    Created on : Feb 16, 2017, 11:42:07 AM
    Author     : Kasih Handoyo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <div class="panel-heading">
                            Tabel Daftar Event
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>Kode Event</th>
                                        <th>Nama Event</th>
                                        <th>Penyelenggara</th>
                                        <th>Mulai Event</th>
                                        <th>Selesai Event</th>
                                        <th>Jumlah Peserta</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listEvent}" var="e">
                                        <tr>
                                            <td>${e.id}</td>
                                            <td>${e.nama}</td>
                                            <td>${e.penyelenggara}</td>
                                            <td>${formatter.format(e.mulai)}</td>
                                            <td>${formatter.format(e.selesai)}</td>
                                            <td>&NonBreakingSpace;</td>
                                        </tr>
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
    });
</script>

</body>

</html>

