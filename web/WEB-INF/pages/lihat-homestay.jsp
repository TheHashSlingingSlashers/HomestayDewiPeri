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
                    <h1 class="page-header"><i class="fa fa-home" aria-hidden="true"></i> Homestay</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <a type="button" href="${path}/homestay/new" data-toggle="tooltip" data-placement="top" title="Add Homestay" class="btn btn-primary" ><i class="fa fa-plus" aria-hidden="true"></i></a>
                    &nbsp;<a type="button" href="${path}/homestay/edit" data-toggle="tooltip" data-placement="top" title="Edit Homestay" class="btn btn-warning"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                    &nbsp;<button type="button" id="button" data-toggle="tooltip" data-placement="top" title="Delete Homestay" class="btn btn-danger"><i class="fa fa-trash" aria-hidden="true"></i></button>
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
                                        <th>Kode Hs</th>
                                        <th>Pemilik</th>
                                        <th>Lokasi</th>
                                        <th>Jml Kamar</th>
                                        <th>Jml Kasur</th>
                                        <th>Cpty</th>
                                        <th>Jml Toilet</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listHomestay}" var="homestay">
                                        <tr>
                                            <td>
                                                <div class="checkbox checkbox-primary">
                                                    <input type="checkbox" class="styled styled-primary case" name="case[]" id="singleCheckbox" value="option2">
                                                    <label></label>
                                                </div>
                                            </td>
                                            <td>${homestay.id} </td>
                                            <td>${homestay.pemilik}</td>
                                            <td>${homestay.lokasi}</td>
                                            <td>${homestay.jumlahKamar}</td>
                                            <td>${homestay.jumlahBed}</td>
                                            <td>${homestay.jumlahKamar*homestay.jumlahBed}</td>
                                            <td>${homestay.jumlahWC}</td>
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
        $('input[type="checkbox"]').on('change', function() {
            $('input[type="checkbox"]').not(this).prop('checked', false);
        });
    })
</script>

<script>
    $(document).ready(function() {

        $('#dataTables-example tr').click(function(event) {
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
    });
</script>

<script>
    $(document).ready(function () {
        function myfunc(ele) {

            var values = new Array();
            $.each($("input[name='case[]']:checked").closest("td").siblings("td"),
                function () {
                    values.push($(this).text());
                });

            alert("val---" + values.join (", "));
        }


        $(document).ready(function() {
            $("input.case").click(myfunc);
        });
    })
</script>

<script>
    $(document).ready(function() {
        var table = $('#dataTables-example').DataTable();

        $('#dataTables-example tbody').on( 'click', 'tr', function () {
            if ( $(this).hasClass('selected') ) {
                $(this).removeClass('selected');
            }
            else {
                table.$('tr.selected').removeClass('selected');
                $(this).addClass('selected');
            }
        } );

        $('#button').click( function () {
            table.row('.selected').remove().draw( false );
            alert("hello world");
        } );
    } );
</script>

</body>

</html>

