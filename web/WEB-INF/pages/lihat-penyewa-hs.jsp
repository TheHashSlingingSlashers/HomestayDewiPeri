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
            <br>
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
                                    <label class="col-md-2 col-sm-2 col-xs-12">Event</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <select name="lokasi" class="form-control" title="Pilih Event yang Diikuti">
                                            <option value="RT 1">Lorem ipsum dolor sit amet</option>
                                            <option value="RT 2">Consectetur adipiscing elit</option>
                                            <option value="RT 3">Proin eu tincidunt urna</option>
                                            <option value="RT 4">Aliquam ut arcu sit amet tortor</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="col-md-offset-2 col-sm-offset-2">
                                    <button type="button" class="btn btn-labeled btn-info" style="margin-left: 5px;" id="btnCheck"><span class="btn-label"><i class="glyphicon glyphicon-ok"></i></span> Check</button>
                                    <button type="submit" class="btn btn-labeled btn-success" style="margin-left: 5px;" id="btnDetails" disabled><span class="btn-label"><i class="fa fa-search-plus" aria-hidden="true"></i></span> Lihat</button>
                                </div>

                            </form>
                            <!-- /.form -->
                            <br>

                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th> </th>
                                        <th>Kode Hs</th>
                                        <th>Pemilik</th>
                                        <th>Cpty</th>
                                        <th>Jml Penyewa</th>
                                        <th>Tersedia</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="checkbox checkbox-primary">
                                                    <input type="checkbox" class="styled styled-primary case singleCheckbox" name="case[]" id="singleCheckbox" value="option2">
                                                    <label></label>
                                                </div>
                                            </td>
                                            <td>A1</td>
                                            <td>Lorem ipsum dolor sit amet</td>
                                            <td>8</td>
                                            <td>6</td>
                                            <td>2</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="checkbox checkbox-primary">
                                                    <input type="checkbox" class="styled styled-primary case singleCheckbox" name="case[]" id="singleCheckbox" value="option2">
                                                    <label></label>
                                                </div>
                                            </td>
                                            <td>A2</td>
                                            <td>Consectetur adipiscing elit</td>
                                            <td>7</td>
                                            <td>5</td>
                                            <td>3</td>
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
        function myfunc(ele) {
            var values = new Array();
            $.each($("input[name='case[]']:checked").closest("td").siblings("td"),
                function () {
                    values.push($(this).text());
                });
            $("#btnDetails").on("click",function(){
                alert(values[0]);
                <%--window.location='${path}/event/edit/'+id;--%>
            });
        }

        $(document).ready(function() {
            $("input.case").click(myfunc);
        });

        $('input[type="checkbox"]').on('change', function () {
            $('input[type="checkbox"]').not(this).prop('checked', false);
        });
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

<script>
    $(document).ready(function() {
        $('.singleCheckbox').click(function () {
            if ($(this).is(':checked')) {
                $('#btnDetails').removeAttr('disabled');
            } else {
                $('#btnDetails').attr('disabled', true);
            }
        });
    });

</script>

</body>

</html>

