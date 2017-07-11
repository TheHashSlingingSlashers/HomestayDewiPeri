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

    <script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript" class="init">


        $(document).ready(function() {

        } );
    </script>
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
                    <button type="button" id="btnAdd" onclick="addPenyewa();" data-toggle="tooltip" data-placement="top" title="Add Penyewa" class="btn btn-primary"><i class="fa fa-plus" aria-hidden="true"></i></button>
                    &nbsp;<button type="button" id="btnEdit" onclick="editPenyewa();" data-toggle="tooltip" data-placement="top" title="Edit Penyewa" class="btn btn-warning" disabled><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                    &nbsp;<button type="button" id="btnDelete" href="#" data-toggle="tooltip" data-placement="top" title="Delete Penyewa" class="btn btn-danger" disabled><i class="fa fa-trash" aria-hidden="true"></i></button>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            &nbsp;
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-bordered" id="example">
                                    <thead>
                                    <tr>
                                        <th>No ID</th>
                                        <th>Nama</th>
                                        <th>Gender</th>
                                        <th>Alamat</th>
                                        <th>Telp</th>
                                        <th>Makanan</th>
                                        <th>Menginap</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listPenyewa}" var="p">
                                        <tr>
                                            <td>${p.id}</td>
                                            <td>${p.nama}</td>
                                            <td>${p.jenisKelamin}</td>
                                            <td>${p.alamat}</td>
                                            <td>${p.noTelp}</td>
                                            <td>${p.jenisMakanan}</td>
                                            <td>${p.menginap}</td>
                                        </tr>
                                    </c:forEach>
                                    <%--<tr>
                                        <td>Tiger Nixon</td>
                                        <td>System Architect</td>
                                        <td>Edinburgh</td>
                                        <td>61</td>
                                        <td>2011/04/25</td>
                                        <td>$320,800</td>
                                        <td>Menginap</td>
                                    </tr>
                                    <tr>
                                        <td>Garrett Winters</td>
                                        <td>Accountant</td>
                                        <td>Tokyo</td>
                                        <td>63</td>
                                        <td>2011/07/25</td>
                                        <td>$170,750</td>
                                        <td>Menginap</td>
                                    </tr>
                                    <tr>
                                        <td>Ashton Cox</td>
                                        <td>Junior Technical Author</td>
                                        <td>San Francisco</td>
                                        <td>66</td>
                                        <td>2009/01/12</td>
                                        <td>$86,000</td>
                                        <td>Tidak Menginap</td>
                                    </tr>
                                    <tr>
                                        <td>Cedric Kelly</td>
                                        <td>Senior Javascript Developer</td>
                                        <td>Edinburgh</td>
                                        <td>22</td>
                                        <td>2012/03/29</td>
                                        <td>$433,060</td>
                                        <td>Tidak Menginap</td>
                                    </tr>
                                    <tr>
                                        <td>Airi Satou</td>
                                        <td>Accountant</td>
                                        <td>Tokyo</td>
                                        <td>33</td>
                                        <td>2008/11/28</td>
                                        <td>$162,700</td>
                                        <td>Menginap</td>
                                    </tr>--%>
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

<div class="modal fade" id="confirmDialog" role="dialog">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-body">
                <form role="form">

                </form>
            </div>
        </div>
    </div>
</div>


<%@include file="include/scripts.jsp" %>
<%@include file="include/dataTablesScript.jsp" %>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<%--<script>--%>
    <%--var id;--%>
    <%--function addPenyewa() {--%>
        <%--window.location = '${path}/penyewa/new';--%>
    <%--}--%>
    <%--function editPenyewa(id) {--%>
        <%--window.location = '${path}/penyewa/edit/'+id;--%>
    <%--}--%>
    <%--$(document).ready(function () {--%>
        <%--function myfunc(ele) {--%>
            <%--var values = new Array();--%>
            <%--$.each($("input[name='case[]']:checked").closest("td").siblings("td"),--%>
                <%--function () {--%>
                    <%--values.push($(this).text());--%>
                <%--}--%>
            <%--);--%>
        <%--}--%>

        <%--$('input[type="checkbox"]').on('change', function () {--%>
            <%--$('input[type="checkbox"]').not(this).prop('checked', false);--%>
        <%--});--%>
        <%--$('#dataTables-example tr').click(function (event) {--%>
            <%--$(this).toggleClass('selected');--%>
            <%--if (event.target.type !== 'checkbox') {--%>
                <%--$(':checkbox', this).trigger('click');--%>
            <%--}--%>
        <%--});--%>

        <%--$('#dataTables-example').DataTable({--%>
            <%--responsive: true--%>
        <%--});--%>

        <%--$("input.case").click(function(event){--%>
            <%--var id=$("input[name='case[]']:checked").closest("td").siblings("td")[0].innerHTML;--%>
            <%--$("#btnEdit").on("click",function(){window.location="${path}/penyewa/edit/"+id;});--%>
        <%--});--%>

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
    <%--})--%>
<%--</script>--%>

<script>
    $(document).ready(function () {
        var x = $("#example");
        var table = x.DataTable();

        /*$('#example tbody').on( 'click', 'tr', function () {
            var id = table.row( this ).data()[0];
            $("#btnEdit").on("click",function(){
                window.location='${path}/penyewa/edit/'+id;
            });
        } );*/
        var btnEdit = $("#btnEdit");
        x.find('tbody').on( 'click', 'tr', function () {
            var id = table.row( this ).data()[0];
            btnEdit.on("click",function(){
                window.location='${path}/penyewa/edit/'+id;
            });
            if ( $(this).hasClass('selected') ) {
                $(this).removeClass('selected');
            }
            else {
                table.$('tr.selected').removeClass('selected');
                $(this).addClass('selected');
                $('#btnDelete').removeAttr('disabled');
                btnEdit.removeAttr('disabled');
                $('[data-toggle="tooltip"]').tooltip();
            }
        } );

        //dikomen karena agar supaya yang lihat bingung
        // jk. ben ra mumet sing koding
        $('#btnDelete').click( function () {
            var id=table.row('.selected').data()[0];
            deletePenyewa(id)
         } );

        $('#btnAdd').tooltip();
    });

    function deletePenyewa(id){
        window.location.replace('${path}/penyewa/delete/'+id)
    }

    function addPenyewa() {
        window.location = '${path}/penyewa/new';
    }
    function editPenyewa(id) {
        window.location = '${path}/penyewa/edit/'+id;
    }
</script>

</body>

</html>

