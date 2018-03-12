<%-- 
    Document   : sinhVienHeader
    Created on : Feb 26, 2018, 9:40:48 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header>
    <div class="navbar navbar-default navbar-static-top">
        <div class="container">
            <div class="row" style="margin: 0 0 0 0;">
                <div class="col-lg-6">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                    </div>
                    <a class="navbar-brand" href="index.html"><img src="./pages/libs/img/logoEn.png" alt="" style="width: 100%; height: 100%"/></a>
                </div>
                <div class="col-lg-6">
                    <div class="navbar-collapse collapse ">
                        <ul class="nav navbar-nav">
                            <li class="dropdown active">
                                <a href="home.jsp">Trang chủ</a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Thực tập<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="typography.html">Công ty</a></li>
                                    <li class="dropdown-submenu">
                                        <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown">Đề tài</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="./pages/sinhvien/detai.jsp">Danh sách đề tài</a></li>
                                            <li><a href="left-sidebar.html">Đề tài đã đăng ký</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="./pages/sinhvien/diemthi.jsp">Điểm thi</a></li>
                                    <li><a href="portfolio.html">Quy trình</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Tài liệu<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="blog-rightsidebar.html">Báo cáo</a></li>
                                    <li><a href="blog-leftsidebar.html">Tài liệu học tập</a></li>
                                </ul>
                            </li>
                            <li><a href="contact.html">Email</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false"><img style="width: 25px; height: 25px" src="./pages/libs/img/avatar.png"></a>
                                <ul class="dropdown-menu">
                                    <li><a><p style="color: red">Nguyễn Công Sơn</p></a></li>
                                    <li><a href="typography.html">Thông tin cá nhân</a></li>
                                    <li><a href="portfolio.html">scac</a></li>
                                    <li><a href="portfolio.html">Đăng xuất</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
