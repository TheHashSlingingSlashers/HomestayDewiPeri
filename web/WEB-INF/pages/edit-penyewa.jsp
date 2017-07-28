<%-- 
    Document   : edit-penyewa
    Created on : Feb 16, 2017, 11:38:09 AM
    Author     : Kasih Handoyo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="app.model.Penyewa.Sex" %>
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
                    <h1 class="page-header"><i class="fa fa-user" aria-hidden="true"></i> Penyewa</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Edit Penyewa</div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form" method="post">

                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">No. Identitas</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="noIdentitas"
                                               name="noIdentitas" readonly="readonly" value="${penyewa.id}">
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Nama</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="nama"
                                               name="nama" value="${penyewa.nama}">
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Jenis Kelamin</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">

                                        <div class="radio radio-inline radio-primary">
                                            <jsp:text>
                                                <![CDATA[ <input type="radio" name="jenisKelamin" id="inlineRadio1" value="L" ]]>
                                            </jsp:text>
                                            <c:if test="${penyewa.jenisKelamin==\"L\"}" var="sex">checked </c:if>
                                            <jsp:text> <![CDATA[ /> ]]></jsp:text>
                                            <label for="inlineRadio1">Laki-laki</label>
                                        </div>
                                        <div class="radio radio-inline radio-primary">
                                            <jsp:text>
                                                <![CDATA[<input type="radio" name="jenisKelamin" id="inlineRadio2" value="P" ]]>
                                            </jsp:text>
                                            <c:if test="${!sex}">checked</c:if>
                                            <jsp:text> <![CDATA[ /> ]]></jsp:text>
                                            <label for="inlineRadio2">Perempuan</label>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Alamat</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="alamat"
                                               name="alamat" value="${penyewa.alamat}">
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">No. Telepon</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="telepon"
                                               name="noTelp" value="${penyewa.noTelp}">
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Jenis Makanan</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="radio radio-inline radio-primary">
                                            <jsp:text>
                                                <![CDATA[ <input type="radio" name="jenisMakanan" id="inlineRadio3" value="vege" ]]>
                                            </jsp:text>
                                            <c:if test="${penyewa.jenisMakanan==\"vege\"}" var="food">checked </c:if>
                                            <jsp:text> <![CDATA[ /> ]]></jsp:text>
                                            <label for="inlineRadio3">Vegetarian</label>
                                        </div>
                                        <div class="radio radio-inline radio-primary">
                                            <jsp:text>
                                                <![CDATA[<input type="radio" name="jenisMakanan" id="inlineRadio4" value="nonvege" ]]>
                                            </jsp:text>
                                            <c:if test="${!food}">checked</c:if>
                                            <jsp:text> <![CDATA[ /> ]]></jsp:text>
                                            <label for="inlineRadio4">Non Vegetarian</label>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Keterangan</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="radio radio-inline radio-primary">
                                            <jsp:text>
                                                <![CDATA[ <input type="radio" name="menginap" id="inlineRadio5" value="true" ]]>
                                            </jsp:text>
                                            <c:if test="${penyewa.menginap==\"true\"}" var="stay">checked </c:if>
                                            <jsp:text> <![CDATA[ /> ]]></jsp:text>
                                            <label for="inlineRadio5">Menginap</label>
                                        </div>
                                        <div class="radio radio-inline radio-primary">
                                            <jsp:text>
                                                <![CDATA[<input type="radio" name="menginap" id="inlineRadio6" value="false" ]]>
                                            </jsp:text>
                                            <c:if test="${!stay}">checked</c:if>
                                            <jsp:text> <![CDATA[ /> ]]></jsp:text>
                                            <label for="inlineRadio6">Tidak Menginap</label>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                                <div class="col-md-offset-2 col-sm-offset-2">
                                    <button type="submit" data-toggle="modal" data-target="#myModal" id="btnSave" class="btn btn-labeled btn-success"><span class="btn-label"><i
                                            class="glyphicon glyphicon-floppy-disk"></i></span> Simpan
                                    </button>
                                </div>
                            </form>
                            <!-- /.form -->

                            <!-- Modal -->
                            <div id="myModal" class="modal fade" role="dialog">
                                <div class="modal-dialog modal-md">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header btn-success" style="font-weight:bold; color:white;">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h5 class="modal-title modal-sm">Berhasil</h5>
                                        </div>
                                        <div class="modal-body">
                                            <p id="message"></p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" id="btnOK" data-dismiss="modal" class="btn btn-success">OK</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- /.panel body -->
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
<script>
    $(document).ready(function () {
        $('#btnSave').click(function () {
            var namaPenyewa = $('#nama').val();
            $('#message').text('Data, '+namaPenyewa+' berhasil diperbarui.');
        });
    });
</script>

</body>

</html>

