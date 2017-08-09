<%-- 
    Document   : login
    Created on : Feb 16, 2017, 8:59:45 AM
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

    <title>Login Pengguna Dewi Peri<c:out value="laku" /></title>
    <%@include file="include/css.jsp" %>


    <link href="../dist/css/style-login2.css" rel="stylesheet">

    <!-- Custom Fonts -->

</head>
<body>

<div class="container container-table">
    <div class="row vertical-center-row">
        <div class="col-md-4 col-sm-6 col-xs-12 col-md-offset-4 col-sm-offset-3">
            <div class="form-login">
                <h4>Masukkan Kode Event</h4><br>
                <form method="GET" role="form">
                    <div class="form-group">
                        <label class="sr-only">Kode Event</label>
                        <div class="input-group">
                            <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></div>
                            <input type="username" name="kodeEvent" id="kodeEvent" class="form-control"
                                   placeholder="Kode Event" required autofocus="">
                        </div>
                    </div>
                    <div class="wrapper">
                        <button class="btn btn-md btn-primary" id="loginBtn" type="button" onclick="login();">
                            <span class="glyphicon glyphicon-log-in"></span> Login
                        </button>
                    </div>
                </form>

            </div>

        </div>
    </div>
</div>

<%@include file="include/scripts.jsp" %>
<script>
    $(document).ready(function () {
        $('#loginBtn').click(function () {
            var id = $('#kodeEvent').val();
            login(id);
        });

        function login(id) {
            window.location = '${path}/login-penyewa/'+id;
        }
    })
</script>

</body>
</html>