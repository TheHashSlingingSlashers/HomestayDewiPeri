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
                                            <td>
                                                <div class="checkbox checkbox-primary">
                                                    <input type="checkbox" class="styled styled-primary case singleCheckbox" name="case[]" id="singleCheckbox" value="option2">
                                                    <label></label>
                                                </div>
                                            </td>
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
        $('input[type="checkbox"]').on('change', function() {
            $('input[type="checkbox"]').not(this).prop('checked', false);
        });
    })
</script>

<script>
    function addEvent() {
        window.location='${path}/event/new';
    }
    function editEvent(id){
        window.location='${path}/event/edit/'+id;
    }

    $(document).ready(function() {
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
    });

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


    });
</script>

<script>
    $(document).ready(function () {
        function myfunc(ele) {
            var id=$("input[name='case[]']:checked").closest("td").siblings("td")[0].innerHTML;
            var values = new Array();
            $.each($("input[name='case[]']:checked").closest("td").siblings("td"),
                function () {
                    values.push($(this).text());
                });
            $("#btnEdit").on("click",function(){
                window.location='${path}/event/edit/'+id;
            })
//            alert("val---" + values.join (", "));
        }
        $(document).ready(function() {
            $("input.case").click(myfunc);
        });
    });


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

