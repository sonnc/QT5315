<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--sidebar start-->
<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
                <li>
                    <a class="active" href="<%=session.getAttribute("httpURL")%>admin/home.jsp">
                        <i class="fa fa-home"></i>
                        <span>TRANG CHỦ</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-user"></i>
                        <span>QUẢN LÝ NGƯỜI DÙNG</span>
                    </a>
                    <ul class="sub">
                        <li><a href="<%=session.getAttribute("httpURL")%>admin/sinhvien.jsp">Sinh viên</a></li>
                        <li><a href="<%=session.getAttribute("httpURL")%>admin/giangvienhuongdan.jsp">Giảng viên hướng dẫn</a></li>
                        <li><a href="grids.html">Đại diện công ty</a></li>
                        <li><a href="grids.html">Người hướng dẫn</a></li>
                        <li><a href="grids.html">Admin</a></li>
                    </ul>
                </li>
                <li>
                    <a href="<%=session.getAttribute("httpURL")%>admin/congty.jsp">
                        <i class="fa fa-building"></i>
                        <span>QUẢN LÝ CÔNG TY</span>
                    </a>
                </li>
                <li>
                    <a href="<%=session.getAttribute("httpURL")%>admin/detai.jsp">
                        <i class="fa fa-list"></i>
                        <span>QUẢN LÝ ĐỀ TÀI</span>
                    </a>
                </li>
                <li>
                    <a href="<%=session.getAttribute("httpURL")%>admin/file.jsp">
                        <i class="fa fa-file"></i>
                        <span>QUẢN LÝ FILE</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>QUẢN LÝ THỰC TẬP</span>
                    </a>
                    <ul class="sub">
                        <li><a href="<%=session.getAttribute("httpURL")%>admin/qlsv.jsp">Quản lý sinh viên</a></li>
                        <li><a href="<%=session.getAttribute("httpURL")%>admin/dtsv.jsp">Quản lý đề tài sinh viên</a></li>
                        <li><a href="<%=session.getAttribute("httpURL")%>admin/qldt.jsp">Quản lý điểm thi</a></li>
                        <li><a href="<%=session.getAttribute("httpURL")%>admin/qlktt.jsp">Quản lý kỳ thực tập</a></li>
                        <li><a href="<%=session.getAttribute("httpURL")%>admin/qlbcsv.jsp">Quản lý báo cáo sinh viên</a></li>
                    </ul>
                </li>

                <li>
                    <a href="<%=session.getAttribute("httpURL")%>admin/qltb.jsp">
                        <i class="fa fa-mail-reply"></i>
                        <span>QUẢN LÝ THÔNG BÁO</span>
                    </a>
                </li>





<!--                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-tasks"></i>
                        <span>Form Components</span>
                    </a>
                    <ul class="sub">
                        <li><a href="form_component.html">Form Elements</a></li>
                        <li><a href="form_validation.html">Form Validation</a></li>
                        <li><a href="dropzone.html">Dropzone</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-envelope"></i>
                        <span>Mail </span>
                    </a>
                    <ul class="sub">
                        <li><a href="mail.html">Inbox</a></li>
                        <li><a href="mail_compose.html">Compose Mail</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class=" fa fa-bar-chart-o"></i>
                        <span>Charts</span>
                    </a>
                    <ul class="sub">
                        <li><a href="chartjs.html">Chart js</a></li>
                        <li><a href="flot_chart.html">Flot Charts</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class=" fa fa-bar-chart-o"></i>
                        <span>Maps</span>
                    </a>
                    <ul class="sub">
                        <li><a href="google_map.html">Google Map</a></li>
                        <li><a href="vector_map.html">Vector Map</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-glass"></i>
                        <span>Extra</span>
                    </a>
                    <ul class="sub">
                        <li><a href="gallery.html">Gallery</a></li>
                        <li><a href="404.html">404 Error</a></li>
                        <li><a href="registration.html">Registration</a></li>
                    </ul>
                </li>
                <li>
                    <a href="login.html">
                        <i class="fa fa-user"></i>
                        <span>Login Page</span>
                    </a>
                </li>-->
            </ul>          
        </div>
        <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->
