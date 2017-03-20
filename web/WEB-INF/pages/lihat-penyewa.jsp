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

    <!-- Navigation -->
    <%@include file="include/navbar.jsp" %>
    <%@page import="app.model.Penyewa.Sex" %>
    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-user" aria-hidden="true"></i> Penyewa</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <button type="button" id="btnAdd" onclick="addPenyewa();" data-toggle="tooltip" data-placement="top" title="Add Penyewa" class="btn btn-primary" ><i class="fa fa-plus" aria-hidden="true"></i></button>
                    &nbsp;<button type="button" id="btnEdit" onclick="editPenyewa();" data-toggle="tooltip" data-placement="top" title="Edit Penyewa" class="btn btn-warning" disabled><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                    &nbsp;<button type="button" id="btnDelete" href="#" data-toggle="tooltip" data-placement="top" title="Delete Penyewa" class="btn btn-danger" disabled><i class="fa fa-trash" aria-hidden="true"></i></button>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            &nbsp;
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th> </th>
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
                                            <td>
                                                <div class="checkbox checkbox-primary">
                                                    <input type="checkbox" class="styled styled-primary case singleCheckbox" name="case[]" id="singleCheckbox" value="option2">
                                                    <label></label>
                                                </div>
                                            </td>
                                            <td>${p.id}</td>
                                            <td>${p.nama}</td>
                                            <td>
                                                    ${p.jenisKelamin}
                                            </td>
                                            <td>${p.alamat}</td>
                                            <td>${p.noTelp}</td>
                                            <td>
                                                    ${p.jenisMakanan}
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
    function addHs() {
        window.location='${path}/penyewa/new';
    }
    function editHs(){
        window.location='${path}/penyewa/edit';
    }
    $(document).ready(function () {
        function myfunc(ele) {
            var values = new Array();
            $.each($("input[name='case[]']:checked").closest("td").siblings("td"),
                function () {
                    values.push($(this).text());
                }
            );
        }

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

        $('a').tooltip();
        $('#button').tooltip();
        $("input.case").click(myfunc);

        $('#btnAdd').tooltip();
        $('.singleCheckbox').click(function () {
            if ($(this).is(':checked')) {
                $('#btnDelete').removeAttr('disabled');
                $('#btnEdit').removeAttr('disabled');
                $('[data-toggle="tooltip"]').tooltip();
            } else {
                $('#btnDelete').attr('disabled', true);
                $('#btnEdit').attr('disabled', true);
            }
        });
    })
</script>

</body>

</html>

