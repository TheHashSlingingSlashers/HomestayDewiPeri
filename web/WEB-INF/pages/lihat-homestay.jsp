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
    <%--<!-- Custom CSS -->--%>
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
                    <h1 class="page-header"><i class="fa fa-home" aria-hidden="true"></i> Homestay</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <button type="button" id="btnAdd" onclick="addHs();" data-toggle="tooltip" data-placement="top"
                            title="Add Homestay" class="btn btn-primary"><i class="fa fa-plus" aria-hidden="true"></i>
                    </button>
                    &nbsp;<button type="button" id="btnEdit" onclick="editHs();" data-toggle="tooltip"
                                  data-placement="top" title="Edit Homestay" class="btn btn-warning" disabled><i
                        class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                    &nbsp;
                    <span data-toggle="modal" data-target="#myModal">
                        <button type="button" id="btnDelete" href="#" data-toggle="tooltip" data-placement="top"
                                  title="Delete Homestay" class="btn btn-danger" disabled><i class="fa fa-trash"
                                                                                             aria-hidden="true"></i>
                </button>
                    </span>

                    <div class="panel panel-primary" style="margin-top: 10px;">
                        <div class="panel-heading">
                            &nbsp;
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table id="example" class="table table-bordered" cellspacing="0" width="100%">
                                    <thead>
                                    <tr>
                                        <th>Kode Hs</th>
                                        <th>Pemilik</th>
                                        <th>Lokasi</th>
                                        <th>Jml Kamar</th>
                                        <th>Jml Tmpt Tidur</th>
                                        <th>Status</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listHomestay}" var="h">
                                        <tr>
                                            <td>${h.id}</td>
                                            <td>${h.pemilik}</td>
                                            <td>${h.lokasi}</td>
                                            <td>${h.jumlahKamar}</td>
                                            <td>${h.jumlahBed}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${h.available}">
                                                        Tersedia
                                                    </c:when>
                                                    <c:otherwise>
                                                        Tidak tersedia
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
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
<script src="http://bootboxjs.com/bootbox.js"></script>

<script>
    $(document).ready(function () {
        var table = $('#example').DataTable();

        $('#example tbody').on('click', 'tr', function () {
            var id = table.row(this).data()[0];
            $("#btnEdit").on("click", function () {
                window.location = '${path}/homestay/edit/' + id;
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
            var pemilik = table.row('.selected').data()[1];
            $('#message').text('Apakah Anda yakin akan menghapus data, '+pemilik+'?');
        } );

        $('#btnModalDelete').click( function () {
            var id=table.row('.selected').data()[0];
            deleteHs(id)
        } );

        $('#btnAdd').tooltip();

        $('[data-toggle="tooltip"]').tooltip({
            trigger : 'hover'
        });
    });
    function addHs() {
        window.location = '${path}/homestay/new';
    }
    function deleteHs(id){
        window.location.replace('${path}/homestay/delete/'+id)
    }

    function editHs(id) {
        window.location = '${path}/homestay/edit/' + id;
    }
</script>

</body>

</html>

