<%-- 
    Document   : lihat-pengguna
    Created on : Feb 16, 2017, 11:45:03 AM
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
                    <h1 class="page-header"><i class="fa fa-user fa-fw" aria-hidden="true"></i> Manajemen Pengguna</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <button type="button" id="btnAdd" onclick="addPengguna();" data-toggle="tooltip" data-placement="top" title="Add Pengguna" class="btn btn-primary"><i class="fa fa-plus" aria-hidden="true"></i></button>
                    &nbsp;<button type="button" id="btnEdit" onclick="editPasswd();" data-toggle="tooltip" data-placement="top" title="Edit Password" class="btn btn-warning" disabled><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                    &nbsp;
                    <span data-toggle="modal" data-target="#myModal">
                        <button type="button" id="btnDelete" href="#" data-toggle="tooltip" data-placement="top" title="Delete Pengguna" class="btn btn-danger" disabled><i class="fa fa-trash" aria-hidden="true"></i></button>
                    </span>

                    <div class="panel panel-primary" style="margin-top: 10px;">
                        <div class="panel-heading">
                            &nbsp;
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-bordered" id="example">
                                    <thead>
                                    <tr>
                                        <th>Username</th>
                                        <th>Password</th>
                                        <th>Role</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listPengguna}" var="u">
                                        <tr>
                                            <td>${u.username}</td>
                                            <td></td>
                                            <td>${u.role}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->

                            <!-- Modal -->
                            <div id="myModal" class="modal fade" role="dialog">
                                <div class="modal-dialog modal-md">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header btn-danger" style="font-weight:bold; color:white;"">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h5 class="modal-title modal-sm">Perhatian</h5>
                                    </div>
                                    <div class="modal-body">
                                        <p id="message"></p>
                                        <p>Klik 'Delete' untuk <strong>menghapus</strong> data. Klik 'Cancel' untuk membatalkan aksi.</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" id="btnModalDelete" class="btn btn-danger">Delete</button>
                                        <button type="button" id="btnModalCancel" data-dismiss="modal" class="btn btn-default">Cancel</button>
                                    </div>
                                </div>
                            </div>
                        </div>

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
<%--<script>--%>
    <%--$(document).ready(function () {--%>
        <%--$('input[type="checkbox"]').on('change', function() {--%>
            <%--$('input[type="checkbox"]').not(this).prop('checked', false);--%>
        <%--});--%>
    <%--});--%>

    <%--function addPengguna() {--%>
        <%--window.location = '${path}/pengguna/new';--%>
    <%--}--%>
    <%--function editPasswd(){--%>
        <%--window.location='${path}/pengguna/edit';--%>
    <%--}--%>
<%--</script>--%>

<%--<script>--%>
    <%--$(document).ready(function() {--%>
        <%--$('#btnAdd').tooltip();--%>
        <%--$('.singleCheckbox').click(function () {--%>
            <%--if ($(this).is(':checked')) {--%>
                <%--$('#btnDelete').removeAttr('disabled');--%>
                <%--$('#btnEdit').removeAttr('disabled');--%>
                <%--$('[data-toggle="tooltip"]').tooltip();--%>
            <%--} else {--%>
                <%--$('#btnDelete').attr('disabled', true);--%>
                <%--$('#btnEdit').attr('disabled', true);--%>
            <%--}--%>
        <%--});--%>
    <%--});--%>

<%--</script>--%>

    <%--<script>--%>
    <%--$(document).ready(function() {--%>

        <%--$('#dataTables-example tr').click(function(event) {--%>
            <%--$(this).toggleClass('selected');--%>
            <%--if (event.target.type !== 'checkbox') {--%>
                <%--$(':checkbox', this).trigger('click');--%>
            <%--}--%>
        <%--});--%>

        <%--$('#dataTables-example').DataTable({--%>
            <%--responsive: true--%>
        <%--});--%>
    <%--});--%>
<%--</script>--%>

<%--<script>--%>
    <%--$(document).ready(function () {--%>
        <%--function myfunc(ele) {--%>

            <%--var values = new Array();--%>
            <%--$.each($("input[name='case[]']:checked").closest("td").siblings("td"),--%>
                <%--function () {--%>
                    <%--values.push($(this).text());--%>
                <%--});--%>
        <%--}--%>

        <%--$(document).ready(function() {--%>
            <%--$("input.case").click(myfunc);--%>
        <%--});--%>
    <%--})--%>
<%--</script>--%>

<script>
    $(document).ready(function () {
        var table = $('#example').DataTable();

        $('#example tbody').on( 'click', 'tr', function () {
            var id = table.row( this ).data()[0];
            $("#btnEdit").on("click",function(){
                window.location='${path}/pengguna/edit/'+id;
            });
            if ( $(this).hasClass('selected') ) {
                $(this).removeClass('selected');
            }
            else {
                table.$('tr.selected').removeClass('selected');
                $(this).addClass('selected');
                $('#btnDelete').removeAttr('disabled');
                $('#btnEdit').removeAttr('disabled');
                $('[data-toggle="tooltip"]').tooltip();
            }
        } );

        $('#btnDelete').click( function () {
            var username = table.row('.selected').data()[0];
            $('#message').text('Apakah Anda yakin akan menghapus data, '+username+'?');
        } );

        $('#btnModalDelete').click( function () {
            var id=table.row('.selected').data()[0];
            deletePengguna(id)
        } );

        $('#btnAdd').tooltip();

        $('[data-toggle="tooltip"]').tooltip({
            trigger : 'hover'
        });
    });
    function deletePengguna(id){
        window.location.replace('${path}/pengguna/delete/'+id)
    }

    function addPengguna() {
        window.location = '${path}/pengguna/new';
    }
    function editPasswd(id){
        window.location='${path}/pengguna/edit/'+id;
    }
</script>

</body>

</html>

