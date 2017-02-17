<%-- 
    Document   : login
    Created on : Feb 16, 2017, 8:59:45 AM
    Author     : Kasih Handoyo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Login Pengguna Dewi Peri</title>

        <!-- Bootstrap Core CSS -->
        <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../dist/css/sb-admin-2.css" rel="stylesheet">
        <link href="../dist/css/style-login2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    </head>
    <body>

        <div class="container container-table">	
            <div class="row vertical-center-row">
                <div class="col-md-4 col-sm-6 col-xs-12 col-md-offset-4 col-sm-offset-3">
                    <div class="form-login">
                        <h4>Login Sistem</h4><br>
                        <form action="../loginServlet" method="POST" role="form" >
                            <div class="form-group">
                                <label for="inputUsername" class="sr-only">Username</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>	
                                    <input type="username" name="username" id="inputUsername" class="form-control" placeholder="Username" required autofocus="">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputPassword" class="sr-only">Password</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                                    <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required autofocus="">
                                </div>
                            </div>

                            <div class="wrapper">
                                <button class="btn btn-md btn-primary" id="myBtn" type="submit">
                                    <span class="glyphicon glyphicon-log-in"></span> Login
                                </button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="../bower_components/jquery/dist/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../dist/js/sb-admin-2.js"></script>

    </body>
</html>