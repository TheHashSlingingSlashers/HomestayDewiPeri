            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/">Admin Dewi Peri</a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">


                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="fa fa-user fa-fw"></i> Ubah Password Admin</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                                <a href="#"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i> Event<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="/event">Lihat Event</a>
                                    </li>
                                    <li>
                                        <a href="event/new">Buat Event Baru</a>
                                    </li>
                                    <li>
                                        <a href="edit-event.jsp">Edit Event</a>
                                    </li>
                                    <li>
                                        <a href="hapus-event.jsp">Hapus Event</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>

                            <li>
                                <a href="#"><i class="fa fa-users fa-fw" aria-hidden="true"></i> Penyewa<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="lihat-penyewa.jsp">Lihat Penyewa</a>
                                    </li>
                                    <li>
                                        <a href="tambah-penyewa.jsp">Tambah Penyewa Baru</a>
                                    </li>
                                    <li>
                                        <a href="edit-penyewa.jsp">Edit Penyewa</a>
                                    </li>
                                    <li>
                                        <a href="hapus-penyewa.jsp">Hapus Penyewa</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>

                            <li>
                                <a href="#"><i class="fa fa-home fa-fw" aria-hidden="true"></i> Homestay<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="lihat-homestay.jsp">Lihat Homestay</a>
                                    </li>
                                    <li>
                                        <a href="tambah-homestay.jsp">Tambah Homestay Baru</a>
                                    </li>
                                    <li>
                                        <a href="edit-homestay.jsp">Edit Homestay</a>
                                    </li>
                                    <li>
                                        <a href="hapus-homestay.jsp">Hapus Homestay</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>

                            <li>
                                <a href="#"><i class="fa fa-user fa-fw" aria-hidden="true"></i> Manajemen Pengguna<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="lihat-pengguna.jsp">Lihat Pengguna</a>
                                    </li>
                                    <li>
                                        <a href="tambah-pengguna.jsp">Tambah Pengguna Baru</a>
                                    </li>
                                    <li>
                                        <a href="edit-password.jsp">Edit Password Pengguna</a>
                                    </li>
                                    <li>
                                        <a href="hapus-pengguna.jsp">Hapus Pengguna</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            
                            <li>
                                <a href="#"><i class="fa fa-suitcase fa-fw" aria-hidden="true"></i> Manajemen Homestay<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="#">Lihat Penyewa Homestay</a>
                                    </li>
                                    <li>
                                        <a href="kelola-penyewa.jsp">Kelola Penyewa Homestay</a>
                                    </li>
                                    <li>
                                        <a href="#">Memindah Penyewa Homestay</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>

                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>