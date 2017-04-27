<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Dewi Peri</title>
    <%@include file="include/css.jsp"%>
    <%@include file="include/dataTablesCss.jsp"%>

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

</head>
<body>

<div id="wrapper">
    <%@include file="include/navbar.jsp"%>
    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Manajemen Pengguna</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Tambah Pengguna Baru</div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form">

                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Pemilik Homestay</label>
                                    <div class="col-md-4 col-sm-6 col-xs-12" id="the-basics">
                                        <input class="form-control typeahead" type="text" id="the-basics">
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 col-sm-2 col-xs-12">Kapasitas</label>
                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" id="kapasitas" readonly="readonly">
                                    </div>
                                </div>

                                <div class="col-md-offset-2 col-sm-offset-2">
                                    <button type="button" class="btn btn-labeled btn-info" style="margin-left: 5px;"><span class="btn-label"><i class="glyphicon glyphicon-ok"></i></span> Check</button>

                                    <button type="submit" class="btn btn-labeled btn-success" style="margin-left: 5px;" id="save"><span class="btn-label"><i class="glyphicon glyphicon-floppy-disk"></i></span> Save</button>
                                </div>

                            </form>
                            <!-- /.form -->
                            <br>

                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th> </th>
                                        <th>Nama</th>
                                        <th>Jenis Kelamin</th>
                                        <th>Jenis Makanan</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="odd gradeX">
                                        <td>
                                            <div class="checkbox checkbox-primary">
                                                <input type="checkbox" class="styled styled-primary case singleCheckbox" name="case[]" id="singleCheckbox" value="1">
                                                <label></label>
                                            </div>
                                        </td>
                                        <td>Internet Explorer 4.0</td>
                                        <td>Win 95+</td>
                                        <td class="center">4</td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>
                                            <div class="checkbox checkbox-primary">
                                                <input type="checkbox" class="styled styled-primary case singleCheckbox" name="case[]" id="singleCheckbox" value="1">
                                                <label></label>
                                            </div>
                                        </td>
                                        <td>Internet Explorer 5.0</td>
                                        <td>Win 95+</td>
                                        <td class="center">5</td>
                                    </tr>
                                    <tr class="odd gradeA">
                                        <td>
                                            <div class="checkbox checkbox-primary">
                                                <input type="checkbox" class="styled styled-primary case singleCheckbox" name="case[]" id="singleCheckbox" value="1">
                                                <label></label>
                                            </div>
                                        </td>
                                        <td>Internet Explorer 5.5</td>
                                        <td>Win 95+</td>
                                        <td class="center">5.5</td>
                                    </tr>
                                    <tr class="even gradeA">
                                        <td>
                                            <div class="checkbox checkbox-primary">
                                                <input type="checkbox" class="styled styled-primary case singleCheckbox" name="case[]" id="singleCheckbox" value="1">
                                                <label></label>
                                            </div>
                                        </td>
                                        <td>Internet Explorer 6</td>
                                        <td>Win 98+</td>
                                        <td class="center">6</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->

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


<%@include file="include/scripts.jsp"%>
<%@include file="include/dataTablesScript.jsp"%>
<script src="${path}/dist/js/typeahead.jquery.min.js"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $(document).ready(function() {
        var c = $('#kapasitas').val(8);
        $('#dataTables-example').DataTable({
            responsive: true
        });
        var capacity = $('#kapasitas').val();
        //var count = $("[type='checkbox']:checked").length;

        $('input:checkbox').change(function () {
            var total = capacity;
            $('input:checkbox:checked').each(function(){
                total -= isNaN(parseInt($(this).val())) ? 0 : parseInt($(this).val());
            });
            $("#kapasitas").val(total);
        });

    });
</script>

<script>
    var substringMatcher = function(strs) {
        return function findMatches(q, cb) {
            var matches, substringRegex;

            // an array that will be populated with substring matches
            matches = [];

            // regex used to determine if a string contains the substring `q`
            substrRegex = new RegExp(q, 'i');

            // iterate through the pool of strings and for any string that
            // contains the substring `q`, add it to the `matches` array
            $.each(strs, function(i, str) {
                if (substrRegex.test(str)) {
                    matches.push(str);
                }
            });

            cb(matches);
        };
    };

    var states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
        'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii',
        'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
        'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota',
        'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
        'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota',
        'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island',
        'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont',
        'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'
    ];

    $('#the-basics .typeahead').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
        },
        {
            name: 'states',
            source: substringMatcher(states)
        });
</script>

<script>
    $(document).ready(function () {
        var a = "";
        $("input:checkbox").click(function () {
            if ((this).checked) {
                if (a.length == 0) {
                    a = $(this).closest("tr").find("td:eq(1)").text();
                } else {
                    a = a + "," + $(this).closest("tr").find("td:eq(1)").text();
                }
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