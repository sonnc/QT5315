<%-- 
    Document   : register
    Created on : Mar 12, 2018, 1:56:49 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="mains/head.jsp" %>
        <title>Đăng ký</title>
        <!--        <script type="text/javascript">
                    function validateRegister() {
                        var email = document.getElementById("email").value;
                        var pass = document.getElementById("pass").value;
                        var re_pass = document.getElementById("re-pass").value;
                        if (email == "") {
                            alert("Xin hãy nhập địa chỉ email");
                            return false;
                        }
                        if (pass == "") {
                            alert("Mật khẩu không được để trống");
                            return false;
                        }
                        if (pass.length < 8) {
                            alert("Mật khẩu không được nhỏ hơn 8 ký tự");
                            return false;
                        }
                        if (pass != re_pass) {
                            alert("Mật khẩu không trùng nhau");
                            return false;
                        }
        
                    }
                </script>-->
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <script src="./pages/libs/js/sonnc.js"></script>
        <style>
            .error{
                color: red;
                text-orientation: initial;
            }
        </style>
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
                            <form role="form" id="formValidate" class="register-form"  >
                                <h2>ĐĂNG KÝ <small>tài khoản.</small></h2>
                                <div class="form-group">
                                    <input type="email" name="email" class="form-control input-lg" placeholder="Tài khoản email" tabindex="4" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" id="password" name="password" class="form-control input-lg" id="exampleInputPassword1" placeholder="Mật khẩu" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" id="repassword" name="repassword" class="form-control input-lg" id="exampleInputPassword1" placeholder="Nhập lại mật khẩu" required>
                                </div>

                                <hr class="colorgraph">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6"><input type="submit" value="Đăng ký" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
                                    <div class="col-xs-12 col-md-6">
                                        <div>Quên mật khẩu? <a href="<%=request.getContextPath()%>/forgotpassword.jsp">Khôi phục</a></div>
                                        <div>Trở về <a href="<%=request.getContextPath()%>/home.jsp">Trang chủ</a></div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
            <footer style="padding: 0px">
                <div id="sub-footer" style="margin: 0px">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="copyright">
                                    <p>&copy; Phát triển bởi: Nguyễn Công Sơn - INPG12 - SIE - HUST</p>
                                    <div class="credits">
                                        <a href="#">Hệ thống đăng ký thực tập doanh nghiệp trực tuyến</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <ul class="social-network">
                                    <li><a href="#" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#" data-placement="top" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="#" data-placement="top" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
                                    <li><a href="#" data-placement="top" title="Google plus"><i class="fa fa-google-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
        <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
            <%@include file="mains/js.jsp" %>
    </body>
</html>

