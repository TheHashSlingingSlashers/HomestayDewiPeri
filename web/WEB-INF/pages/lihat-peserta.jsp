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
    <!-- Custom CSS -->
    <link href="${path}/dist/css/build.css" rel="stylesheet">


</head>

<body>

<div id="wrapper">

        <div class="container-fluid">
            <div class="row">
                <br/><br/>
                <div class="col-md-4">
                    <button id="exportButton" class="btn btn-sm btn-danger clearfix"><span class="fa fa-file-pdf-o"></span> Export to PDF</button>
                </div>
                <br>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <br/>
            <div class="row">
                <div class="col-lg-12">

                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Daftar Peserta
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
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
<!-- /#wrapper -->
<%@include file="include/scripts.jsp" %>
<%@include file="include/dataTablesScript.jsp" %>
<script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/jszip.min.js"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $(document).ready(function () {

        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>

<script type="text/javascript">
    jQuery(function ($) {
        $("#exportButton").click(function () {
            // parse the HTML table element having an id=exportTable
            var dataSource = shield.DataSource.create({
                data: "#dataTables-example",
                schema: {
                    type: "table",
                    fields: {
                        No: { type: Number },
                        Nama: { type: String },
                        Gender: { type: String },
                        Makanan: { type: String },
                        Homestay: { type: String },
                        Menginap: { type: String }
                    }
                }
            });

            // when parsing is done, export the data to PDF
            dataSource.read().then(function (data) {
                var pdf = new shield.exp.PDFDocument({
                    author: "Penyelenggara",
                    created: new Date()
                });

                pdf.addPage("a4", "portrait");

                pdf.table(
                    50,
                    50,
                    data,
                    [
                        { field: "No", title: "No", width: 30 },
                        { field: "Nama", title: "Nama", width: 190 },
                        { field: "Gender", title: "Gender", width: 50 },
                        { field: "Makanan", title: "Makanan", width: 80 },
                        { field: "Homestay", title: "Homestay", width: 100 },
                        { field: "Menginap", title: "Menginap", width: 60 }
                    ],
                    {
                        margins: {
                            top: 50,
                            left: 50
                        }
                    }
                );

                pdf.saveAs({
                    fileName: "List Peserta.pdf"
                });
            });
        });
    });
</script>

</body>

</html>

