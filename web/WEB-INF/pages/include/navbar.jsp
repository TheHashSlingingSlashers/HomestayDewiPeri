<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="${path}/">Admin Dewi Peri</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">


        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="#"><i class="fa fa-user fa-fw"></i> Ubah Password Admin</a>
                </li>
                <li class="divider"></li>
                <li><a href="${path}/logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li>
                    <a href="${path}/penyewa"><i class="fa fa-users fa-fw" aria-hidden="true"></i> Penyewa</a>
                </li>

                <li>
                    <a href="${path}/homestay"><i class="fa fa-home fa-fw" aria-hidden="true"></i> Homestay</a>
                </li>

                <li>
                    <a href="${path}/event"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i> Event</a>
                </li>

                <li>
                    <a href="#"><i class="fa fa-suitcase fa-fw" aria-hidden="true"></i> Manajemen Homestay<span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="${path}/manajemen/hist">History Terakhir Pemakaian Homestay</a>
                        </li>
                        <li>
                            <a href="${path}/manajemen">Kelola Penyewa Homestay</a>
                        </li>
                        <li>
                            <a href="${path}/manajemen/list">Lihat Penyewa Homestay</a>
                        </li>

                    </ul>
                    <!-- /.nav-second-level -->
                </li>

                <li>
                    <a href="${path}/pengguna"><i class="fa fa-user fa-fw" aria-hidden="true"></i> Manajemen Pengguna</a>
                </li>

            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>