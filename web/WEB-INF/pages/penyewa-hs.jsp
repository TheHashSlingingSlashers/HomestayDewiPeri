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

    <!-- you need to include the shieldui css and js assets in order for the components to work -->
    <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light/all.min.css" />

    <style>
        .search-form .form-group {
            float: right !important;
            transition: all 0.35s, border-radius 0s;
            width: 32px;
            height: 32px;
            background-color: #fff;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
            border-radius: 25px;
            border: 1px solid #ccc;
        }
        .search-form .form-group input.form-control {
            padding-right: 20px;
            border: 0 none;
            background: transparent;
            box-shadow: none;
            display:block;
        }
        .search-form .form-group input.form-control::-webkit-input-placeholder {
            display: none;
        }
        .search-form .form-group input.form-control:-moz-placeholder {
            /* Firefox 18- */
            display: none;
        }
        .search-form .form-group input.form-control::-moz-placeholder {
            /* Firefox 19+ */
            display: none;
        }
        .search-form .form-group input.form-control:-ms-input-placeholder {
            display: none;
        }
        .search-form .form-group:hover,
        .search-form .form-group.hover {
            width: 100%;
            border-radius: 4px 25px 25px 4px;
        }
        .search-form .form-group span.form-control-feedback {
            position: absolute;
            top: -1px;
            right: -2px;
            z-index: 2;
            display: block;
            width: 34px;
            height: 34px;
            line-height: 34px;
            text-align: center;
            color: #3596e0;
            left: initial;
            font-size: 14px;
        }

    </style>

</head>

<body>
<div id="wrapper">
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${path}">Selamat Datang </a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">


            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li class="divider"></li>
                    <li><a href="${path}/logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                        <a href="${path}/"><i class="fa fa-home fa-fw" aria-hidden="true"></i> Home</a>
                    </li>
                    <li>
                        <a href="${path}/list-penyewa"><i class="fa fa-users fa-fw" aria-hidden="true"></i> List Penyewa Homestay</a>
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
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-users" aria-hidden="true"></i> Penyewa</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-md-4">
                    <button id="exportButton" class="btn btn-sm btn-danger clearfix"><span class="fa fa-file-pdf-o"></span> Export to PDF</button>
                </div>
                <div class="col-md-4 col-md-offset-8">
                    <form action="GET" class="search-form">
                        <div class="form-group has-feedback">
                            <label for="search" class="sr-only">Kode Event</label>
                            <input type="text" class="form-control" name="search" id="search" placeholder="Masukkan Kode Event">
                            <span class="glyphicon glyphicon-search form-control-feedback"></span>
                        </div>
                    </form>
                </div>
            </div>

            <!-- /.row -->
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
                                        <th>Keterangan</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%--<tr>--%>
                                        <%--<td>--%>
                                            <%--1--%>
                                        <%--</td>--%>
                                        <%--&lt;%&ndash;<td>${p.nama}</td>&ndash;%&gt;--%>
                                        <%--<td>Erika</td>--%>
                                        <%--&lt;%&ndash;<td>${p.jenisKelamin}</td>&ndash;%&gt;--%>
                                        <%--<td>L</td>--%>
                                        <%--&lt;%&ndash;<td>${p.jenisMakanan}</td>&ndash;%&gt;--%>
                                        <%--<td>Vegetarian</td>--%>
                                        <%--&lt;%&ndash;<td>${p.menginap}</td>&ndash;%&gt;--%>
                                        <%--<td>Menginap</td>--%>
                                    <%--</tr>--%>
                                    <c:set var="count" value="1" scope="page" />
                                    <c:forEach items="${listPenyewa}" var="p">
                                        <tr>
                                            <td>${count}</td>
                                            <td>${p.nama}</td>
                                            <td>${p.jenisKelamin}</td>
                                            <td>${p.jenisMakanan}</td>
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
<script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/jszip.min.js"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $(document).ready(function () {

        $('#dataTables-example').DataTable({
            responsive: true
        });

    })
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
                        Keterangan: { type: String }
                    }
                }
            });

            // when parsing is done, export the data to PDF
            dataSource.read().then(function (data) {
                var pdf = new shield.exp.PDFDocument({
                    author: "Pemilik Homestay",
                    created: new Date()
                });

                pdf.addPage("a4", "portrait");

                pdf.table(
                    50,
                    50,
                    data,
                    [
                        { field: "No", title: "No", width: 30 },
                        { field: "Nama", title: "Nama", width: 200 },
                        { field: "Gender", title: "Gender", width: 50 },
                        { field: "Makanan", title: "Makanan", width: 90 },
                        { field: "Keterangan", title: "Keterangan", width: 110 }
                    ],
                    {
                        margins: {
                            top: 50,
                            left: 50
                        }
                    }
                );

                pdf.saveAs({
                    fileName: "List Penyewa Homestay.pdf"
                });
            });
        });
    });
</script>

</body>

</html>

