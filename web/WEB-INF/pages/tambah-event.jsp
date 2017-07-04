<%-- 
    Document   : event-baru
    Created on : Feb 16, 2017, 11:38:34 AM
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
    <link href="https://bootstrap-tagsinput.github.io/bootstrap-tagsinput/dist/bootstrap-tagsinput.css" rel="stylesheet">
    <%@include file="include/css.jsp" %>
    <%--<style>--%>
        <%--.tt-query,--%>
        <%--.tt-hint {--%>
            <%--margin-bottom: 0;--%>
        <%--}--%>
        <%--.tt-hint {--%>
            <%--display: block;--%>
            <%--width: 100%;--%>
            <%--height: 38px;--%>
            <%--padding: 8px 12px;--%>
            <%--font-size: 14px;--%>
            <%--line-height: 1.428571429;--%>
            <%--color: #999;--%>
            <%--vertical-align: middle;--%>
            <%--background-color: #ffffff;--%>
            <%--border: 1px solid #cccccc;--%>
            <%--border-radius: 4px;--%>
            <%---webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);--%>
            <%--box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);--%>
            <%---webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;--%>
            <%--transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;--%>
        <%--}--%>
        <%--.tt-menu {--%>
            <%--min-width: 160px;--%>
            <%--margin-top: 2px;--%>
            <%--padding: 5px 0;--%>
            <%--background-color: #ffffff;--%>
            <%--border: 1px solid #cccccc;--%>
            <%--border: 1px solid rgba(0, 0, 0, 0.15);--%>
            <%--border-radius: 4px;--%>
            <%---webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);--%>
            <%--box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);--%>
            <%--background-clip: padding-box;--%>
        <%--}--%>
        <%--.tt-suggestion {--%>
            <%--display: block;--%>
            <%--padding: 3px 20px;--%>
        <%--}--%>
        <%--.tt-suggestion.tt-is-under-cursor {--%>
            <%--color: #fff;--%>
            <%--background-color: #428bca;--%>
        <%--}--%>
        <%--.tt-suggestion.tt-is-under-cursor a {--%>
            <%--color: #fff;--%>
        <%--}--%>
        <%--.tt-suggestion p {--%>
            <%--margin: 0;--%>
        <%--}--%>
    <%--</style>--%>



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
                    <h1 class="page-header"><i class="fa fa-calendar-o" aria-hidden="true"></i> Add Event</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Buat Event Baru</div>
                        <div class="panel-body">
                            <form method="post" class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Kode Event</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="id"
                                               name="id" required>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Nama Event</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="nama"
                                               name="nama" required>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Penyelenggara</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12" id="penyelenggara"
                                               name="penyelenggara" required>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Peserta</label>
                                    <div id="the-basics" class="col-md-6 col-sm-6 col-xs-12">
                                        <input class="form-control col-md-7 col-xs-12 typeahead" type="text" data-role="tagsinput" placeholder="Nama Peserta">
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Mulai Event</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <div class="xdisplay_inputx has-feedback">
                                            <div class="input-group">
                                                <input type="text" class="form-control col-md-7 col-xs-12"
                                                       id="single_cal3" aria-describedby="inputSuccess2Status"
                                                       name="mulai" required>
                                                <div class="input-group-addon"><span
                                                        class="glyphicon glyphicon-calendar"></span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Selesai Event</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <div class="xdisplay_inputx has-feedback">
                                            <div class="input-group">
                                                <input type="text" class="form-control col-md-7 col-xs-12"
                                                       id="single_cal2" aria-describedby="inputSuccess2Status"
                                                       name="selesai" required>
                                                <div class="input-group-addon"><span
                                                        class="glyphicon glyphicon-calendar"></span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="col-md-offset-2 col-sm-offset-2">
                                    &nbsp;<button type="submit" class="btn btn-labeled btn-success"><span class="btn-label"><i
                                            class="glyphicon glyphicon-floppy-disk"></i></span> Save
                                    </button>
                                </div>

                            </form>
                            <!-- /.form -->
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

<script src="${path}/js/moment/moment.min.js"></script>
<script src="${path}/js/datepicker/daterangepicker.js"></script>
<!-- Typeahead -->
<script src="${path}/dist/js/typeahead.jquery.js"></script>
<script src="${path}/dist/js/bloodhound.js"></script>

<script>
    $(document).ready(function () {


        $('#single_cal3').daterangepicker({
            singleDatePicker: true,
            calender_style: "picker_3"
        }, function (start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
        });

        $('#single_cal2').daterangepicker({
            singleDatePicker: true,
            calender_style: "picker_3"
        }, function (start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
        });
    });
</script>

<!-- script>
    var citynames = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        prefetch: {
            url: 'assets/citynames.json',
            filter: function(list) {
                return $.map(list, function(cityname) {
                    return { name: cityname }; });
            }
        }
    });
    citynames.initialize();

    $('input').tagsinput({
        typeaheadjs: {
            name: 'citynames',
            displayKey: 'name',
            valueKey: 'name',
            source: citynames.ttAdapter()
        }
    });
</script -->

<script>
    <%--$(document).ready(function () {--%>
    <%--var substringMatcher = function(strs) {--%>
        <%--return function findMatches(q, cb) {--%>
            <%--var matches, substringRegex;--%>

            <%--// an array that will be populated with substring matches--%>
            <%--matches = [];--%>

            <%--// regex used to determine if a string contains the substring `q`--%>
            <%--substrRegex = new RegExp(q, 'i');--%>

            <%--// iterate through the pool of strings and for any string that--%>
            <%--// contains the substring `q`, add it to the `matches` array--%>
            <%--$.each(strs, function(i, str) {--%>
                <%--if (substrRegex.test(str)) {--%>
                    <%--matches.push(str);--%>
                <%--}--%>
            <%--});--%>

            <%--cb(matches);--%>
        <%--};--%>
    <%--};--%>

    <%--var states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',--%>
        <%--'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii',--%>
        <%--'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',--%>
        <%--'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota',--%>
        <%--'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',--%>
        <%--'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota',--%>
        <%--'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island',--%>
        <%--'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont',--%>
        <%--'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'--%>
    <%--];--%>

    <%--$('#the-basics .typeahead').typeahead({--%>
            <%--hint: true,--%>
            <%--highlight: true,--%>
            <%--minLength: 1--%>
        <%--},--%>
        <%--{--%>
            <%--name: 'states',--%>
            <%--source: substringMatcher(states)--%>
        <%--});--%>
    <%--});--%>
<%--</script>--%>

<%--<script>--%>
    <%--var citynames = new Bloodhound({--%>
        <%--datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),--%>
        <%--queryTokenizer: Bloodhound.tokenizers.whitespace,--%>
        <%--prefetch: {--%>
            <%--url: 'assets/citynames.json',--%>
            <%--filter: function(list) {--%>
                <%--return $.map(list, function(cityname) {--%>
                    <%--return { name: cityname }; });--%>
            <%--}--%>
        <%--}--%>
    <%--});--%>
    <%--citynames.initialize();--%>

    <%--$('input').tagsinput({--%>
        <%--typeaheadjs: {--%>
            <%--name: 'citynames',--%>
            <%--displayKey: 'name',--%>
            <%--valueKey: 'name',--%>
            <%--source: citynames.ttAdapter()--%>
        <%--}--%>
    <%--});--%>
</script>
</body>

</html>

