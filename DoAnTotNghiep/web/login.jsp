<%-- 
    Document   : login
    Created on : Mar 4, 2018, 10:21:26 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="mains/head.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <!-- end header -->
            <section id="inner-headline">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 style="text-align: center; color: red">HỆ THỐNG ĐĂNG KÝ THỰC TẬP DOANH NGHIỆP TRỰC TUYẾN</h3>
                        </div>
                    </div>
                </div>
            </section>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                            <form role="form" class="register-form">
                                <h2>ĐĂNG NHẬP <small>vào hệ thống</small></h2>
                                <hr class="colorgraph">

                                <div class="form-group">
                                    <input type="email" name="email" id="email" class="form-control input-lg" placeholder="Tài khoản" tabindex="4">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control input-lg" id="exampleInputPassword1" placeholder="Mật khẩu">
                                </div>

                                <div class="row">
                                    <div class="col-xs-4 col-sm-3 col-md-3">
                                        <span class="button-checkbox">
                                            <button type="button" class="btn" data-color="info" tabindex="7">Ghi nhớ tài khoản</button>
                                            <input type="checkbox" name="t_and_c" id="t_and_c" class="hidden" value="1">
                                        </span>
                                    </div>
                                </div>

                                <hr class="colorgraph">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6"><input type="submit" value="Đăng nhập" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
                                    <div class="col-xs-12 col-md-6">
                                        <div>Quên mật khẩu? <a href="forgotpassword.jsp">Khôi phục</a></div>
                                        <div>Trở về <a href="home.jsp">Trang chủ</a></div>
                                        
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </section>
            <section>
                <div style="text-align: center">
                    <p>Mọi thông tin chi tiết xin liên hệ: Nguyễn Công Sơn _ INPG12 _ SIE _ HUST - Email: son.nguyencong.hust@gmail.com - Điện thoại: (+84)0898 595 657</p>
                </div>
            </section>
        </div>
        <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
        <!-- javascript
    ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file="mains/js.jsp" %>
    </body>
</html>
