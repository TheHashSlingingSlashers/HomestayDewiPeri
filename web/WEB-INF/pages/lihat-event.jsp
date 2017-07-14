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
                    <h1 class="page-header"><i class="fa fa-calendar-o" aria-hidden="true"></i> Event</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <button type="button" id="btnAdd" onclick="addEvent();" data-toggle="tooltip" data-placement="top" title="Add Event" class="btn btn-primary" ><i class="fa fa-plus" aria-hidden="true"></i></button>
                    &nbsp;<button type="button" id="btnEdit" onclick="editEvent();" data-toggle="tooltip" data-placement="top" title="Edit Event" class="btn btn-warning" disabled><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                    &nbsp;<button type="button" id="btnDelete" href="#" data-toggle="tooltip" data-placement="top" title="Delete Event" class="btn btn-danger" disabled><i class="fa fa-trash" aria-hidden="true"></i></button>
                    <div class="panel panel-primary"  style="margin-top: 10px;">
                        <div class="panel-heading">
                            &nbsp;
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-bordered" id="example">
                                    <%--<table class="display" id="dataTables-example">--%>
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
<script>
    $(document).ready(function () {
        var table = $('#example').DataTable();

        $('#example tbody').on( 'click', 'tr', function () {
//            console.log( table.row( this ).data()[1] );
            var id = table.row( this ).data()[0];
            $("#btnEdit").on("click",function(){
                window.location='${path}/event/edit/'+id;
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

            $('#btnDelete').click( function () {
                var namaEvent = table.row('.selected').data()[1];
                $('#message').text('Apakah Anda yakin akan menghapus data, '+namaEvent+'?');
            } );

            $('#btnModalDelete').click( function () {
                var id=table.row('.selected').data()[0];
//            deletePenyewa(id)
            } );

            $('#btnAdd').tooltip();

            $('[data-toggle="tooltip"]').tooltip({
                trigger : 'hover'
            });
        } );
    });

    function addEvent() {
        window.location='${path}/event/new';
    }
    function editEvent(id){
        window.location='${path}/event/edit/'+id;
    }
</script>


</body>

</html>

