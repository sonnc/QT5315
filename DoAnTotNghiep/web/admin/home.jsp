<%-- 
    Document   : home
    Created on : May 19, 2018, 8:55:22 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title>QUẢN TRỊ HỆ THỐNG</title>
    <%@include file="../admin/head.jsp" %>
</head>
<body>
    <section id="container">
        <%@include file="../admin/nabar.jsp" %>
        <%@include file="../admin/leftBar.jsp" %>

        <!--main content start-->
        <section id="main-content">
            <section class="wrapper">
                <!-- //market-->
                <div class="market-updates">
                    <div class="col-md-3 market-update-gd">
                        <div class="market-update-block clr-block-2">
                            <div class="col-md-4 market-update-right">
                                <i class="glyphicon glyphicon-user" style="color: white; font-size: 45px;"> </i>
                            </div>
                            <div class="col-md-8 market-update-left">
                                <h4>Tài khoản</h4>
                                <h3>13,500</h3>
                                <p>thành viên đã đăng ký thành công.</p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                    <div class="col-md-3 market-update-gd">
                        <div class="market-update-block clr-block-1">
                            <div class="col-md-4 market-update-right">
                                <i class="glyphicon glyphicon-home" style="color: white; font-size: 45px;"> </i>
                            </div>
                            <div class="col-md-8 market-update-left">
                                <h4>Công ty</h4>
                                <h3>1,250</h3>
                                <p>công ty đã đăng ký chương trình.</p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                    <div class="col-md-3 market-update-gd">
                        <div class="market-update-block clr-block-3">
                            <div class="col-md-4 market-update-right">
                                <i class="glyphicon glyphicon-list" style="color: white; font-size: 45px;"> </i>
                            </div>
                            <div class="col-md-8 market-update-left">
                                <h4>Đề tài</h4>
                                <h3>1,500</h3>
                                <p>đề tài được đăng tải trên hệ thống.</p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                    <div class="col-md-3 market-update-gd">
                        <div class="market-update-block clr-block-4" style="background: teal; .market-update-block.clr-block-3:hover{background: #8b5c7e}">
                            <div class="col-md-4 market-update-right">
                                <i class="glyphicon glyphicon-edit" style="color: white; font-size: 45px;"> </i>
                            </div>
                            <div class="col-md-8 market-update-left">
                                <h4>Sinh viên</h4>
                                <h3>4,500</h3>
                                <p>đã đăng ký thực tập tại doanh nghiệp.</p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>	

                <div class="agil-info-calendar">
                    <!-- calendar -->
                    <div class="col-md-12 agile-calendar">
                        <div class="calendar-widget">
                            <div class="panel-heading ui-sortable-handle">
                                <span class="panel-icon">
                                    <i class="fa fa-calendar-o"></i>
                                </span>
                                <span class="panel-title"> Calendar Widget</span>
                            </div>
                            <!-- grids -->
                            <div class="agile-calendar-grid">
                                <div class="page">

                                    <div class="w3l-calendar-left">
                                        <div class="calendar-heading">

                                        </div>
                                        <div class="monthly" id="mycalendar"></div>
                                    </div>

                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </section>
            <!-- footer -->
            <div class="footer">
                <div class="wthree-copyright">
                    <p>THIẾT KẾ BỎI: NGUYỄN CÔNG SƠN</p>
                </div>
            </div>
            <!-- / footer -->
        </section>
        <!--main content end-->
    </section>
    <%@include file="../admin/js.jsp" %>
</body>
</html>

