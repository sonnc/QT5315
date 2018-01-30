<%-- 
    Document   : header
    Created on : Jan 26, 2018, 11:01:32 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- header -->
<div class="header-top">
    <div class="container">
        <div class="bottom_header_left">
            <p>
                <span class="fa fa-map-marker" aria-hidden="true"></span>Hệ thống đăng ký thực tập doanh nghiệp
            </p>
        </div>
        <div class="bottom_header_right">
            <div class="bottom-social-icons">
                <a class="facebook" href="#">
                    <span class="fa fa-facebook"></span>
                </a>
                <a class="twitter" href="#">
                    <span class="fa fa-twitter"></span>
                </a>
                <a class="pinterest" href="#">
                    <span class="fa fa-pinterest-p"></span>
                </a>
                <a class="linkedin" href="#">
                    <span class="fa fa-linkedin"></span>
                </a>
            </div>
            <div class="header-top-righ">
                <a href="login.jsp">
                    <span class="fa fa-sign-out" aria-hidden="true"></span>Đăng nhập</a>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<div class="header">
    <div class="content white">
        <nav class="navbar navbar-default">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="home.jsp">
                        <img style="height: 100%; width: auto;" src="<%=session.getAttribute("httpURL")%>pages/lib/images/logo/bannerHUST.png">
                    </a>

                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <nav class="link-effect-2" id="link-effect-2">
                        <ul class="nav navbar-nav">
                            <li class="active">
                                <a href="index.html" class="effect-3">Trang chủ</a>
                            </li>
                            <li>
                                <a href="about.html" class="effect-3">Thực tập</a>
                            </li>
                            <li>
                                <a href="courses.html" class="effect-3">Công ty</a>
                            </li>
                            <li>
                                <a href="join.html" class="effect-3">Thông báo</a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="icons.html">Web Icons</a>
                                    </li>
                                    <li>
                                        <a href="codes.html">Short Codes</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="Gallery.html" class="effect-3">Gallery</a>
                            </li>
                            <li>
                                <a href="contact.html" class="effect-3">Contact Us</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!--/.navbar-header-->

                <!--/.navbar-collapse-->
                <!--/.navbar-->
            </div>
        </nav>
    </div>
</div>
<!-- banner -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
        <li data-target="#myCarousel" data-slide-to="3" class=""></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <div class="container">
                <div class="carousel-caption">
                    <h6>Welcome To Best Study</h6>
                    <h3>Leading
                        <span>University</span>
                    </h3>
                    <p>Create an all-encompassing website for your school with ease.</p>
                </div>
            </div>
        </div>
        <div class="item item2">
            <div class="container">
                <div class="carousel-caption">
                    <h6>Welcome To Best Study</h6>
                    <h3>Most Popular
                        <span>Education</span>
                    </h3>
                    <p>Create an all-encompassing website for your school with ease.</p>
                </div>
            </div>
        </div>
        <div class="item item3">
            <div class="container">
                <div class="carousel-caption">
                    <h6>Welcome To Best Study</h6>
                    <h3>We Can
                        <span>Teach</span> You</h3>
                    <p>Create an all-encompassing website for your school with ease.</p>
                </div>
            </div>
        </div>
        <div class="item item4">
            <div class="container">
                <div class="carousel-caption">
                    <h6>Welcome To Best Study</h6>
                    <h3>Most Popular
                        <span>Education</span>
                    </h3>
                    <p>Create an all-encompassing website for your school with ease.</p>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="fa fa-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="fa fa-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
    <!-- The Modal -->
</div>
<!--//banner -->
