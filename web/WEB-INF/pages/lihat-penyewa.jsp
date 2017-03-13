<%-- 
    Document   : lihat-penyewa
    Created on : Feb 16, 2017, 11:45:37 AM
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


</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <%@include file="include/navbar.jsp" %>
    <%@page import="app.model.Penyewa.Sex" %>
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
                            Tabel Daftar Penyewa
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>No ID</th>
                                        <th>Nama</th>
                                        <th>Gender</th>
                                        <th>Alamat</th>
                                        <th>Telp</th>
                                        <th>Makanan</th>
                                        <th>Menginap</th>
                                        <th>Event</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listPenyewa}" var="p">
                                        <tr>
                                            <td>${p.id}</td>
                                            <td>${p.nama}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${p.jenisKelamin==Sex.L}">Laki-laki</c:when>
                                                    <c:when test="${p.jenisKelamin==P}">Perempuan</c:when>
                                                </c:choose>
                                            </td>
                                            <td>${p.alamat}</td>
                                            <td>${p.noTelp}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${p.jenisMakanan==vege}">Vegetarian</c:when>
                                                    <c:when test="${p.jenisKelamin==nonvege}">Non-vegetarian</c:when>
                                                </c:choose>
                                            </td>
                                            <td><input type="checkbox" disabled="disabled" value="${p.menginap}"/></td>
                                            <td>&nbsp;</td>
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

