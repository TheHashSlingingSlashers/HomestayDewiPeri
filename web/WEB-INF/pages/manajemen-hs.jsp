<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%--@elvariable id="listEvent" type="java.util.List<app.model.Event>"--%>
    <%--@elvariable id="listHomestay" type="java.util.List<app.model.Homestay>"--%>
    <%--@elvariable id="mapPenyewa" type="java.util.Map<java.lang.String,java.util.List<app.model.Penyewa>>"--%>
    <%--@elvariable id="listLokasi" type="java.util.Set<java.lang.String>"--%>
    <%--@elvariable id="selectedHs" type="app.model.Homestay"--%>


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

    <style>
        .tt-query,
        .tt-hint {
            margin-bottom: 0;
        }

        .tt-hint {
            display: block;
            width: 100%;
            height: 38px;
            padding: 8px 12px;
            font-size: 14px;
            line-height: 1.428571429;
            color: #999;
            vertical-align: middle;
            background-color: #ffffff;
            border: 1px solid #cccccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
        }

        .tt-menu {
            min-width: 160px;
            margin-top: 2px;
            padding: 5px 0;
            background-color: #ffffff;
            border: 1px solid #cccccc;
            border: 1px solid rgba(0, 0, 0, 0.15);
            border-radius: 4px;
            -webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
            background-clip: padding-box;
        }

        .tt-suggestion {
            display: block;
            padding: 3px 20px;
        }

        .tt-suggestion.tt-is-under-cursor {
            color: #fff;
            background-color: #428bca;
        }

        .tt-suggestion.tt-is-under-cursor a {
            color: #fff;
        }

        .tt-suggestion p {
            margin: 0;
        }
    </style>

    <!-- script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script -->

</head>
<body>

<div id="wrapper">
    <%@include file="include/navbar.jsp" %>
    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-suitcase fa-fw" aria-hidden="true"></i> Manajemen Homestay
                    </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Kelola Penyewa</div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form">

                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Event</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <select name="event" class="form-control" title="Pilih Event yang Diikuti"
                                                id="event">
                                            <option value="">Pilih event</option>
                                            <c:if test="${listEvent.size()>0}">
                                                <c:forEach items="${listEvent}" var="event">
                                                    <c:out value="<option value='${event.id}'" escapeXml="false"/>
                                                    <c:if test="${event.id==param['idEvent']}">
                                                        <c:out value="selected=true"/>
                                                    </c:if>
                                                    <c:out value=">${event.nama}</option>" escapeXml="false"/>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <%-- <div class="form-group">
                                     <label class="col-md-2 col-sm-2 col-xs-12">Lokasi</label>
                                     <div class="col-md-2 col-sm-2 col-xs-12">
                                         <select name="lokasi" class="form-control" title="Pilih Event yang Diikuti">
                                             <c:forEach items="${listLokasi}" var="l">
                                                 <option value="${l}">${l}</option>
                                             </c:forEach>
                                         </select>
                                     </div>
                                 </div>--%>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Pemilik</label>
                                    <div class="col-md-2 col-sm-2 col-xs-12">
                                        <select name="lokasi" class="form-control" title="Pilih Homestay" id="lokasi">
                                            <option value="">Pilih homestay</option>
                                            <c:forEach items="${listHomestay}" var="h">
                                                <c:out value="<option value='${h.id}' " escapeXml="false"/>
                                                <c:if test="${selectedHs.id==h.id}">
                                                    <c:out value="selected=true"/>
                                                </c:if>
                                                <c:out value=">${h.pemilik}</option>" escapeXml="false"/>
                                                <option value="${h.id}">${h.pemilik}</option>

                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Kapasitas</label>
                                    <div class="col-md-2 col-sm-2 col-xs-12">
                                        <c:out value='<input type="text" class="form-control" id="kapasitas" readonly="readonly" '
                                               escapeXml="false"/>
                                        <c:if test="${selectedHs!=null}">
                                            <c:out value="value='${selectedHs.jumlahBed*selectedHs.jumlahKamar}' />"/>
                                        </c:if>
                                        <c:out value="/>" escapeXml="false"/>
                                    </div>
                                </div>

                                <div class="col-md-offset-2 col-sm-offset-2">
                                    <button type="button" class="btn btn-labeled btn-info" style="margin-left: 5px;">
                                        <span class="btn-label"><i class="glyphicon glyphicon-ok"></i></span> Cek Cpty
                                    </button>
                                </div>

                            </form>
                            <!-- /.form -->
                            <br>

                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>No ID</th>
                                        <th>Nama</th>
                                        <th>Jenis Kelamin</th>
                                        <th>Jenis Makanan</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%--@elvariable id="listPenyewa" type="java.util.List<app.model.Penyewa>"--%>
                                    <c:if test="${listPenyewa!=null}">
                                        <c:forEach items="${listPenyewa}" var="p">
                                            <tr>
                                                <td>
                                                    <div class="checkbox checkbox-primary">
                                                        <input type="checkbox"
                                                               class="styled styled-primary case singleCheckbox"
                                                               name="case[]" id="singleCheckbox" value="1">
                                                        <label></label>
                                                    </div>
                                                </td>
                                                <td>${p.id}</td>
                                                <td>${p.nama}</td>
                                                <td>${p.jenisKelamin}</td>
                                                <td>${p.jenisMakanan}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->


                            <br>
                            <button type="submit" class="btn btn-labeled btn-success" id="save"
                                    style="width: 100%"><span class="btn-label"><i
                                    class="glyphicon glyphicon-floppy-disk"></i></span> Simpan
                            </button>


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
<%@include file="include/dataTablesScript.jsp" %>
<script src="${path}/dist/js/typeahead.jquery.min.js"></script>
<script src="${path}/js/jquery.query-object.js"></script>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $(document).ready(function () {
        var q = $.query;
        $("#event").on('change', function () {
            window.location = $.query.SET('idEvent', this.value).toString();
        });
        $("#lokasi").on('change', function () {
            window.location = $.query.SET('hs', this.value).toString();
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

        var c = $('#kapasitas').val(8);

        var capacity = $('#kapasitas').val();
        //var count = $("[type='checkbox']:checked").length;

        $('input:checkbox').change(function () {
            var total = capacity;
            $('input:checkbox:checked').each(function () {
                total -= isNaN(parseInt($(this).val())) ? 0 : parseInt($(this).val());
            });
            $("#kapasitas").val(total);
        });
    });
</script>

<script>
    $(document).ready(function () {
        var a = "";
        $("input:checkbox").click(function () {
            if ((this).checked) {
                //    if (a.length == 0) {
                //        a = $(this).closest("tr").find("td:eq(1)").text();
                //    } else {
                a = a + "," + $(this).closest("tr").find("td:eq(1)").text();
                //    }
            } else {
                if (a.length == 1) {
                    a = a.slice(0, -1);
                } else {
                    a = a.replace(("," + $(this).closest("tr").find("td:eq(1)").text()), "");
                }
            }
        });

        $('#save').click(function (e) {
            e.preventDefault();
            alert(a);
        });
    });
</script>

</body>
</html>